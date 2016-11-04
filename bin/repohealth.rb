require "github_api"
require "optparse"
require "ostruct"
require "yaml"

# Configure the command line options
options = {}
options[:age] = 8
options[:warn] = true

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: repoheartbeat.rb [options]"

  opts.separator ""
  opts.separator "Specific Options"

  opts.on("-a", "--age AGE", "Acceptable age of issue") do |a|
    options[:age] = a.to_i
  end

  opts.on("-o", "--owner OWNER", "Repository Owner") do |o|
    options[:owner] = o
  end

  opts.on("-r", "--repo REPO", "Repository Name") do |r|
    options[:repo] = r
  end

  opts.on("-t", "--token TOKEN", "oAuth Token") do |t|
    options[:token] = t
  end

  # Set whether errors are set as warnings rather than stopping errors
  opts.on("-e", "--error", "Fail the build on error.  Default is to warn") do |w|
    options[:warn] = false
  end

end

opt_parser.parse!

def issueAge(start_date, end_date)

  end_date = Time.parse end_date

  seconds_diff = (start_date - end_date).to_i.abs 

  return seconds_diff / 86400
end

# Read the configuration file in the user home directory for the client_id and client_secret
# They can be passed on the command line but it is not recommended
if options[:token].nil?

  # Determine if the configuration file for the credentials exists
  config_file = File.join(Dir.home, ".repohealth")

  if File.exists?(config_file)
    config = YAML.load_file(config_file)
  else 
    puts format("ERROR: Configuration file cannot be located: %s", config_file)
    exit 2
  end

  oauth = config["oauth"]

else
  oauth = {
    "token" => options[:token]
  }
end

# Final check for the ouath details
if oauth["token"].nil?
  puts "ERROR:  A token must be specified for GitHub oAuth authentication"
  exit 3
end

github = Github.new oauth_token: options[:token] 

items = github.issues.list user: options[:owner], repo: options[:repo], auto_pagination: true

# create counters for issues and prs
issues = 0
prs = 0

# Determine the date time now so that a comparison can be made to the update time of the issues
dtnow = Time.now.utc

# set counter for violations
violations = {
  :pr => {
    :count => 0,
    :urls => []
  },
  :issues => {
    :count => 0,
    :urls => []
  }
}

# Iterate around the issues to get the type and the age
items.each do |item|

  if item.key?('pull_request')
    if (issueAge(dtnow, item.updated_at) > options[:age])
      violations[:pr][:count] += 1 
      violations[:pr][:urls] << item.url
    end
    prs += 1
  else
    if (issueAge(dtnow, item.updated_at) > options[:age])
      violations[:issues][:count] += 1 
      violations[:issues][:urls] << item.url
    end
    issues += 1
  end
end

# Set default exitcode
exitcode = 0

# Based on the warn state, set the prefix for the message
# This is only for issues and PRs that have not been updated in the last x days
# Other errors such as not being able to find the configuration file for Github will still generate an error
if (options[:warn] and (violations[:pr][:count] > 0 or violations[:issues][:count] > 0))
  prefix = "WARNING"
  puts <<-EOH
***************************
Violations in timely updates to Issues and PRs are being set as warnings and will not fail the build.
This will change in the future as per the Chef Partner Cookbook Program guidelines.
***************************
EOH
else 
  prefix = "ERROR"
end

# Determine what the violations are
if violations[:pr][:count] > 0
  puts format("%s: %s Pull requests have not been looked at for %s or more days", prefix, violations[:pr][:count], options[:age])
  violations[:pr][:urls].each do |url|
    puts url
  end
  exitcode = options[:warn] ? 0 : 1
end

if violations[:issues][:count] > 0
  puts format("%s: %s issues have not been looked at for %s or more days", prefix, violations[:issues][:count], options[:age])
  violations[:issues][:urls].each do |url|
    puts url
  end
  exitcode = options[:warn] ? 0 : 1
end 

exit exitcode
