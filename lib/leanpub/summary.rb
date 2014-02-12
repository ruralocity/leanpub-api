module Leanpub
  class Summary
    include HTTParty
    base_uri 'https://leanpub.com'
  end
end
