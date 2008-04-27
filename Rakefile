require 'rake'
require 'rake/rdoctask'

PROJECTS = %w(anvil-db anvil-gen anvil-gui anvil)

Dir["#{File.dirname(__FILE__)}/*/lib/version.rb"].each do |version_path|
  require version_path
end

%w(install package spec).each do |task_name|
  desc "Run #{task_name} for all projects"
  task task_name do
    PROJECTS.each do |project|
      system %(cd #{project} && rake #{task_name})
    end
  end
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = 'Anvil Framework'
  rdoc.options << '--line-numbers' << '--inline-source' << '-A cattr_accessor=object'
  rdoc.options << '--charset' << 'utf-8'
  rdoc.rdoc_files.include("README")
  PROJECTS.each do |project|
    rdoc.rdoc_files.include("#{project}/CHANGELOG", "#{project}/MIT-LICENSE", "#{project}/TODO")
    rdoc.rdoc_files.include("#{project}/lib/**/*.rb")
  end
end

desc 'send rdoc to rubyforge'
task :rf_doc do
  sh %{sudo chmod -R 755 doc}
  sh %{/usr/bin/scp -r -p doc/* lancelot@rubyforge.org:/var/www/gforge-projects/anvil}
end