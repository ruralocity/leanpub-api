module LeanpubAPI
  class BookSummary < LeanpubAPI::Base
    private

    def path
      "/#{@book_slug}.json?api_key=#{@api_key}"
    end
  end
end
