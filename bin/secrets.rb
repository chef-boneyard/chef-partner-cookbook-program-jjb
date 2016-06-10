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
    File.open("jobs/temp/temp-#{file_name}", "w") do |output|
      jjb_yml.each do |line|
        if line[/auth-token/ ]
          line.sub!("auth-token: 'SLACK-AUTH-TOKEN'","auth-token: '#{secrets['slack-auth-token']}'" )
        end
        if line[/build-server-url/ ]
          line.sub!("build-server-url: 'SLACK-BUILD-SERVER-URL'","build-server-url: '#{secrets['slack-build-server-url']}'" )
        end
        output.puts line
      end
    end
  end
end
