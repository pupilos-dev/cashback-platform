require 'rails_helper'
require_dependency 'validators/http_url_validator.rb'

RSpec.describe HttpUrlValidator do
  context "when URL is valid" do
    let(:valid_url) { "https://www.google.com.br/" }

    it "check valid http url" do
      expect(described_class.compliant?(valid_url)).to be(true)
    end
  end

  context "when URL is invalid" do
    let(:invalid_http_url) { "www.google.com"}
    let(:invalid_url) { "google.com" }

    it "check invalid http url" do
      expect(described_class.compliant?(invalid_http_url)).to be(false)
    end

    it "check invalid url" do
      expect(described_class.compliant?(invalid_url)).to be(false)
    end
  end
end
