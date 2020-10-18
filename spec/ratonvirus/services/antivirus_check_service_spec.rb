require 'spec_helper'

RSpec.describe Ratonvirus::AntivirusCheckService do
  describe 'scan' do
    let(:scan_response) { Ratonvirus::AntivirusCheckService.new('./test.pdf').call }

    describe 'antivirus free scan' do
      before(:each) do
        stub_request(:post, "http://localhost:9000/scan").
        to_return(status: 200, body: '{"Status": "OK", "Description": ""}', headers: {})
      end

      after(:each) { WebMock.reset! }

      it 'return false for virus check' do
        expect(scan_response.parsed_response).to be_kind_of(Hash)
        expect(scan_response).to respond_to(:virus?)
        expect(scan_response.virus?).to be_falsy
      end
    end

    describe 'antivirus errorfull scan' do
      before(:each) do
        stub_request(:post, "http://localhost:9000/scan").
        to_return(status: 406, body: '{"Status": "FOUND", "Description": "Eicar-Test-Signature"}', headers: {})
      end

      after(:each) { WebMock.reset! }

      it 'return true for virus check' do
        expect(scan_response.parsed_response).to be_kind_of(Hash)
        expect(scan_response).to respond_to(:virus?)
        expect(scan_response.virus?).to be_truthy
      end
    end
  end
end