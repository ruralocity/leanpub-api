require_relative '../../spec_helper'

describe LeanpubAPI::SalesSummary do
  describe "GET sales summary info" do
    let(:summary) { LeanpubAPI::SalesSummary.new(book_slug, api_key) }

    before :each do
      VCR.insert_cassette 'sales_summary', record: :new_episodes
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
      summary.info["book"].must_equal "everydayrailsrspec"
      summary.info["url"].must_equal "https://leanpub.com/everydayrailsrspec"
      summary.info["total_author_royalties"].must_equal "23456.78"
      summary.info["total_book_royalties"].must_equal "3456.78"
      summary.info["num_happy_readers"].must_equal 3534
      summary.info["num_happy_paid_purchases"].must_equal 3522
      summary.info["num_refunded_purchases"].must_equal 12
      summary.info["unpaid_royalties"].must_equal "1208.75"
      summary.info["royalties_currently_due"].must_equal "0.0"
      summary.info["royalties_due_on_first_of_next_month"].must_equal "1208.75"
      summary.info["paid_royalties"].must_equal "12345.67"
    end

    describe "dynamic attributes" do
      before do
        summary.info
      end

      it "returns an attribute if present in the info" do
        summary.num_happy_readers.must_equal 3534
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
