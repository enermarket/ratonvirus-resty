require 'spec_helper'

RSpec.describe Ratonvirus::Scanner::Resty, :vcr do
  
  describe '#executable?' do
    it {expect(Ratonvirus::Scanner::Resty.executable?).to be_truthy  }
  end

  describe '#run_scan' do
    let(:run) { subject.method(:run_scan) }

    context "with unexisting file" do
      let(:path) { ratonvirus_file_fixture("foo.pdf") }

      it "results to antiviurs_file_not_found error" do
        expect(subject.virus?(path)).to be_truthy
        expect(subject.errors).to contain_exactly(:antivirus_file_not_found)
      end
    end

    context "with existing clean file" do
      let(:path) { ratonvirus_file_fixture("clean_file.pdf") }
      
      it "results scanning to pass without errors" do
        expect(subject.virus?(path)).to be_falsy
      end

      context "when there is an exception" do
        it "results to antivirus_client_error error" do
          expect(Ratonvirus::AntivirusCheckService).to receive(:new).and_raise("Example")
          expect(subject.virus?(path)).to be(true)
          expect(subject.errors).to contain_exactly(:antivirus_client_error)
        end
      end
    end

    context "with existing infected file" do
      let(:path) { ratonvirus_file_fixture("infected_file.pdf") }

      it "results to antivirus_virus_detected error" do
        expect(subject.virus?(path)).to be(true)
        expect(subject.errors).to contain_exactly(:antivirus_virus_detected)
      end

      context "when there is an exception" do
        it "results to antivirus_client_error error" do
          expect(Ratonvirus::AntivirusCheckService).to receive(:new).and_raise("Example")
          expect(subject.virus?(path)).to be(true)
          expect(subject.errors).to contain_exactly(:antivirus_client_error)
        end
      end
    end
  end
end