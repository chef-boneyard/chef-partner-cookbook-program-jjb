require 'pathname'
require 'yaml'

secrets = YAML.load_file("secrets.yml")

Dir.glob('jobs/*.yml') do |item|
  next if item == '.' or item == '..'
  next if item == 'temp-*'
  File.open(item) do |file|
    jjb_yml = file.readlines
    absolute_path = Pathname.new(File.expand_path(item))
    file_name = absolute_path.basename   
    output = File.open("jobs/temp/temp-#{file_name}", "w")
    jjb_yml.each do |line|
      output <<  line.gsub("auth-token: 'SLACK-AUTH-TOKEN'","auth-token: '#{secrets['slack-auth-token']}'" )
    end
    output.close
  end
end
