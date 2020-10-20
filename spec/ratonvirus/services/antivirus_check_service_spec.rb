require 'spec_helper'

RSpec.describe Ratonvirus::AntivirusCheckService, :vcr do
  describe 'scan' do
    describe 'antivirus free scan' do
      let(:scan_response) { Ratonvirus::AntivirusCheckService.new(ratonvirus_file_fixture('clean_file.pdf')).call }

      it 'return false for virus check' do
        expect(scan_response.parsed_response).to be_kind_of(Hash)
        expect(scan_response).to respond_to(:virus?)
        expect(scan_response.virus?).to be_falsy
      end
    end

    describe 'antivirus errorfull scan' do
      let(:scan_response) { Ratonvirus::AntivirusCheckService.new(ratonvirus_file_fixture('infected_file.pdf')).call }

      it 'return true for virus check' do
        expect(scan_response.parsed_response).to be_kind_of(Hash)
        expect(scan_response).to respond_to(:virus?)
        expect(scan_response.virus?).to be_truthy
      end
    end

    describe 'antivirus scan without a file' do
      let(:scan_response) { Ratonvirus::AntivirusCheckService.new('').call }

      it 'return true for virus check' do
        expect(scan_response.parsed_response).to be_nil
      end
    end
  end
end