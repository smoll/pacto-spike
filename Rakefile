begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

task :all do
  ENV["PACTO_MODE"] = "generate"
  Rake::Task["spec"].invoke

  Rake::Task["spec"].reenable
  ENV["PACTO_MODE"] = "validate"
  Rake::Task["spec"].invoke

  Rake::Task["spec"].reenable
  ENV["PACTO_MODE"] = "validate"
  ENV["STUB_PROVIDER"] = "true"
  Rake::Task["spec"].invoke
end

task :default => :all
