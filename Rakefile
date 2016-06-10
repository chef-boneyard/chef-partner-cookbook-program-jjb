require './bin/secrets.rb'
#task :default => [:secrets]

desc "run the secrets.rb"
task :secrets do
  ruby "bin/secrets.rb"
end

desc "run the jjb application"
task :jjb do
  sh "jenkins-jobs --conf ../jenkins_jobs.ini update jobs/temp/*"
  #sh "rm jobs/temp*"
end

desc "clean up any temp files"
task :clean do
  sh "rm jobs/temp/*"
end
