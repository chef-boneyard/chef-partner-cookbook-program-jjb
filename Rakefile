require './bin/secrets.rb'
task :default => [:secrets, :jjb]

desc "run the secrets.rb"
task :secrets do
  ruby "bin/secrets.rb"
end

desc "run the jjb application"
task :jjb do
  ignore = ['jobs/temp/temp-00_macros.yml']
  jobs_defs = Dir.glob('jobs/temp/*.yml')
  jobs_defs -= ignore
  puts jobs_defs
  jobs_defs.each do |item|
    absolute_path = Pathname.new(File.expand_path(item))
    file_name = absolute_path.basename
    sh "jenkins-jobs --conf ../jenkins_jobs.ini update jobs/00_macros.yml:jobs/temp/#{file_name}"
  end
  sh "rm jobs/temp/temp-*"
end

desc "clean up any temp files"
task :clean do
  sh "rm jobs/temp/temp-*"
end
