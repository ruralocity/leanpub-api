module Leanpub
  class BookSummary
    include HTTParty
    base_uri 'https://leanpub.com'

    def initialize(book_slug, api_key)
      @book_slug = book_slug
      @api_key = api_key
    end

    def info(force = false)
      force ? @info = get_info : @info ||= get_info
    end

    def method_missing(name, *args, &block)
      info.has_key?(name.to_s) ? info[name.to_s] : super
    end

    private

    def get_info
      self.class.get(path)
    end

    def path
      "/#{@book_slug}.json?api_key=#{@api_key}"
    end
  end
end
