require_relative '../lib/leanpub'

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.config do |config|
  config.cassette_library_dir = 'spec/fixtures/leanpub_cassettes'
  config.stub_with :webmock
end
