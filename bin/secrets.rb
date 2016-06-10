require 'yaml'

secrets = YAML.load_file("secrets.yml")

File.open("jobs/maas-cookbook.yml") do |file|
  jjb_yml = file.readlines
  output = File.open("jobs/maas-cookbook-temp.yml", "w")
  jjb_yml.each do |line|
    output <<  line.gsub("auth-token: 'faketoken'","auth-token: '#{secrets['slack-auth-token']}'" )
  end
  output.close
end
