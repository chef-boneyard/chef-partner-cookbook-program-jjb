require './bin/secrets.rb'
#task :default => [:secrets]

desc "run the secrets.rb"
task :secrets do
  ruby "secrets.rb"
end

desc "run the jjb application"
task :jjb do
  sh "jenkins-jobs --conf jenkins_jobs.ini update jobs/maas-cookbook-temp.yml"
end
