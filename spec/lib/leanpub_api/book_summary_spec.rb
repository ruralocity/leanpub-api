require_relative '../../spec_helper'

describe LeanpubAPI::BookSummary do
  describe "default attributes" do
    it "include HTTParty methods" do
      LeanpubAPI::BookSummary.must_include HTTParty
    end

    it "have the base URL set to the Leanpub API endpoint" do
      LeanpubAPI::BookSummary.base_uri.must_equal 'https://leanpub.com'
    end
  end

  describe "GET book info" do
    let(:summary) { LeanpubAPI::BookSummary.new(book_slug, api_key) }

    before :each do
      VCR.insert_cassette 'book_summary', record: :new_episodes
    end

    after :each do
      VCR.eject_cassette
    end

    it "has data" do
      summary.must_respond_to :info
    end

    it "parses the JSON response to a hash" do
      summary.info.must_be_instance_of Hash
    end

    it "performs the request and gets the data" do
      summary.info["author_string"].must_equal "Aaron Sumner"
      summary.info["title"].must_equal "Everyday Rails Testing with RSpec"
      summary.info["subtitle"].must_equal "A practical approach to test-driven development"
      summary.info["total_copies_sold"].must_equal 3513
      summary.info["total_revenue"].must_equal "12345.67"
      summary.info["minimum_price"].must_equal "14.0"
      summary.info["suggested_price"].must_equal "19.0"
    end

    describe "dynamic attributes" do
      before do
        summary.info
      end

      it "returns an attribute if present in the info" do
        summary.title.must_equal "Everyday Rails Testing with RSpec"
      end

      it "raises method missing if an attribute is not present in the info" do
        lambda { summary.bad_attribute }.must_raise NoMethodError
      end
    end

    describe "caching" do
      before do
        summary.info
        stub_request(:any, /leanpub.com/).to_timeout
      end

      it "caches the info" do
        summary.info.must_be_instance_of Hash
      end

      it "refreshes the info if forced" do
        lambda { summary.info(true) }.must_raise Timeout::Error
      end
    end
  end
end
