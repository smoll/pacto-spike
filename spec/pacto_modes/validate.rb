contracts = Pacto.load_contracts(Pacto.configuration.contracts_path, 'https://api.github.com:443')

if ENV['STUB_PROVIDERS']
  contracts.stub_providers
else
  # Hit the live service
  WebMock.allow_net_connect!
end

Pacto.validate!
