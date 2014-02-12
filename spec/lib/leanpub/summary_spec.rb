require_relative '../../spec_helper'

describe Leanpub::Summary do
  describe "default attributes" do
    it "include HTTParty methods" do
      Leanpub::Summary.must_include HTTParty
    end

    it "have the base URL set to the Leanpub API endpoint" do
      Leanpub::Summary.base_uri.must_equal 'https://leanpub.com'
    end
  end
end