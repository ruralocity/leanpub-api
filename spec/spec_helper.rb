require_relative '../lib/leanpub_api'

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require 'dotenv'

Dotenv.load

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/leanpub_cassettes'
  config.hook_into :webmock

  config.filter_sensitive_data("<LEANPUB_BOOK_SLUG>") do
    book_slug
  end

  config.filter_sensitive_data("<LEANPUB_API_KEY>") do
    api_key
  end
end

def book_slug
  ENV.fetch 'LEANPUB_BOOK_SLUG'
end

def api_key
  ENV.fetch 'LEANPUB_API_KEY'
end
