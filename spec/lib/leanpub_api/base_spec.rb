require_relative '../../spec_helper'

describe LeanpubAPI::Base do
  describe "default attributes" do
    it "include HTTParty methods" do
      LeanpubAPI::BookSummary.must_include HTTParty
    end

    it "have the base URL set to the Leanpub API endpoint" do
      LeanpubAPI::BookSummary.base_uri.must_equal 'https://leanpub.com'
    end
  end
end
