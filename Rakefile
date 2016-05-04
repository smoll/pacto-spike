begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

desc "Run generate, then validate, then validate w/ Pacto-provided stub"
task :all do
  ENV.delete "STUB_PROVIDER"
  ENV["PACTO_MODE"] = "generate"
  Rake::Task["spec"].invoke

  Rake::Task["spec"].reenable
  ENV.delete "STUB_PROVIDER"
  ENV["PACTO_MODE"] = "validate"
  Rake::Task["spec"].invoke

  Rake::Task["spec"].reenable
  ENV["PACTO_MODE"] = "validate"
  ENV["STUB_PROVIDER"] = "true"
  Rake::Task["spec"].invoke
end

task default: :all
