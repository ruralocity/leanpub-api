require "leanpub_api/version"
require "httparty"

module LeanpubAPI
  Dir[File.dirname(__FILE__) + '/leanpub_api/*.rb'].each do |file|
    require file
  end
end
