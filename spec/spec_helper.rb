require 'pacto'
require 'pacto/rspec'

Pacto.configure do |config|
  config.contracts_path = 'contracts'
end

RSpec.configure do |c|
end

pacto_mode = ENV['PACTO_MODE']
require "pacto_modes/#{pacto_mode}" if pacto_mode

WebMock.allow_net_connect!
