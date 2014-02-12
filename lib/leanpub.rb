require "leanpub/version"
require "httparty"

module Leanpub
  Dir[File.dirname(__FILE__) + '/leanpub/*.rb'].each do |file|
    require file
  end
end
