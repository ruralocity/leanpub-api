# Leanpub API wrapper for Ruby

A simple Ruby wrapper for the [Leanpub API](https://leanpub.com/help/api). Currently supports the API's book and sales summary functions, with aspirations to do
more.

**Disclaimer:** Leanpub is a service of Ruboss Technology Corporation, a
corporation incorporated in British Columbia, Canada. I self-publish a book
using their service, but am otherwise not affiliated with them in any way.

## Requirements

This library has been tested against the following Ruby versions:

- 2.0.0

## Installation

Add this line to your application's Gemfile:

    gem 'leanpub_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install leanpub_api

## Usage

You'll need your book slug and API key values, both of which can be retrieved
by [accessing your Leanpub account](https://leanpub.com/dashboard).

The gem currently supports the Leanpub API's book summary functions.

```ruby
require 'leanpub_api'

book = LeanpubAPI::BookSummary.new('<book-slug>', '<api-key>')

puts book.title
puts book.subtitle
puts book.slug
puts book.author_string
puts book.url
puts book.title_page_url
puts book.minimum_price
puts book.suggested_price
puts book.total_copies_sold
puts book.total_revenue
puts book.possible_reader_count
```

You can also get the sales summary for a Leanpub book.

```ruby
require 'leanpub_api'

sales = LeanpubAPI::SalesSummary.new('<book-slug>', '<api-key>')

puts sales.book
puts sales.url
puts sales.total_author_royalties
puts sales.total_book_royalties
puts sales.num_happy_readers
puts sales.num_happy_paid_purchases
puts sales.num_refunded_purchases
puts sales.unpaid_royalties
puts sales.royalties_currently_due
puts sales.royalties_due_on_first_of_next_month
puts sales.paid_royalties
```

## Development

Tests expect a `.env` file at the project's root, with the following
environment variables:

- `LEANPUB_BOOK_SLUG` Your book's Leanpub slug
- `LEANPUB_API_KEY` Your Leanpub API key

## TODO

Add wrappers for other API functionality:

- All sales data
- Preview functions
- Publish functions
- Preview/publish job status
- Coupon management

Test against other Rubies

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes, with tests (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
