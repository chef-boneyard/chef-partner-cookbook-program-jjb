require 'pathname'
require './bin/secrets.rb'
task :default => [:secrets, :jjb]

desc "run the secrets.rb"
task :secrets do
  ruby "bin/secrets.rb"
end

desc "run the jjb application"
task :jjb do
  Dir.glob('jobs/temp/*.yml') do |item|
    absolute_path = Pathname.new(File.expand_path(item))
    file_name = absolute_path.basename
    if file_name == 'temp-00_macros.yml'
      puts "skipping #{file_name}"
    else
      sh "jenkins-jobs --conf ../jenkins_jobs.ini update jobs/00_macros.yml:jobs/temp/#{file_name}"
    end
  end
  sh "rm jobs/temp/temp-*"
end

desc "clean up any temp files"
task :clean do
  sh "rm jobs/temp/temp-*"
end
