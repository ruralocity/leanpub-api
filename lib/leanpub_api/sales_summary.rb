module LeanpubAPI
  class SalesSummary < LeanpubAPI::Base
    private

    def path
      "/#{@book_slug}/sales.json?api_key=#{@api_key}"
    end
  end
end
