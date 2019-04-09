# Web Scraper

This is a fairly simple gem that will help you simplify the parsing of web pages

## How it works

Gem is based on several libraries that do most of the work
- [HTTParty](https://github.com/jnunemaker/httparty) HTTP client
- [Parallel](https://github.com/grosser/parallel) allows performing queries in multiple threads
- [Nokogiri](https://github.com/sparklemotion/nokogiri) Nokogiri is an HTML, XML, SAX, and Reader parser

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'web-scraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install web-scraper

## Usage

```ruby
require 'web/scraper'

scraper = Web::Scraper::PageParser.new(
    title: { selector: "//h1[@class='title']", handler: ->(els) { els.first.text }, default: 'Ruby' },
    summary: { selector: "//h2[@class='summary']", handler: ->(els) { els.first.text } },
    link: { selector: "//a[@class='link']", handler: ->(els) { els.first['href'] } },
    text_array: { selector: "//*[@class='link']", handler: ->(els) { els.map(&:text) } }
)

result1 = scraper.parse('https://www.codica.com/')
result2 = scraper.parse(['https://www.codica.com/1', 'https://www.codica.com/2'])
```
The response will be something like:
```json
[
  {
    "title": "scraped title text",
    "summary": "scraped summary text",
    "link": "https://www.codica.com/blog/top-ruby-gems-we-cant-live-without/",
    "text_array": ["text", "text" ...]
  },
  ...
]
```

### Scraper attributes

- *`title, summary, link, text_array`* - Random hash keys, they may be whatever you want
- *`selector`* - XPath by which desired elements will be found on the page
- *`handler`* - Any ruby object that can respond to `#call` method (`proc`, `lambda` or plain ruby class that has `#call` method defined). One argument will be passed to the handler which is an array of the elements found on the page. Each element is an instance of `Nokogiri::XML::Element`. Please read [Nokogiri](https://github.com/sparklemotion/nokogiri) docs for more info
- *`default`* - if the scraper cannot find the desired element using `selector`, the value provided for the `default` attribute will be returned.

### Query parameters and headers

```ruby
query = { page: 2 }
headers = { 'Authorization': 'Bearer' }
result = scraper.parse('https://www.codica.com/', query: query, headers: headers)
```

## Configuration

### Proxy

```ruby
Web::Scraper.configure do |config|
  config.proxy_addr = 'proxy.something.com'
  config.proxy_port = 80
  config.proxy_user = 'user:'
  config.proxy_pass = 'password'
end
```

### Logging

```ruby
Web::Scraper.configure do |config|
  config.logger = Logger.new('path/to/my/logs')
end
```
> By default the logging is turned off

### Multithreading

```ruby
Web::Scraper.configure do |config|
  config.number_of_threads = 20
end
```
> By default scraper works in 1 thread.

### Reset

You might need to reset configuration to defaults

```ruby
Web::Scraper.reset
```

> Now you can provided new configuration if needed

## License
web-scraper is Copyright © 2015-2019 Codica. It is released under the [MIT License](https://opensource.org/licenses/MIT).

## About Codica

[![Codica logo](https://www.codica.com/assets/images/logo/logo.svg)](https://www.codica.com)

web-scraper is maintained and funded by Codica. The names and logos for Codica are trademarks of Codica.

We love open source software! See [our other projects](https://github.com/codica2) or [hire us](https://www.codica.com/) to design, develop, and grow your product.