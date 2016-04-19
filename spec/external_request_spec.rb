require 'spec_helper'
require 'uri'
require 'net/http'

describe 'External request' do
  it 'queries FactoryGirl contributors on Github' do
    uri = URI('https://api.github.com/repos/thoughtbot/factory_girl/contributors')
    response = do_request(uri)

    expect(response).to be_an_instance_of(Net::HTTPOK)

    if ENV['PACTO_MODE'] == 'validate'
      expect(Pacto).to_not have_failed_investigations
      expect(Pacto).to_not have_unmatched_requests
    end
  end

  def do_request(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'
    request = Net::HTTP::Get.new(uri.request_uri)
    http.request(request)
  end
end
