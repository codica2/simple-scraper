require 'nokogiri'
require 'httparty'

require 'web/scraper/version'
require 'web/scraper/page_finder'
require 'web/scraper/page_parser'

module Web
  module Scraper
    class Error < StandardError; end

    class << self
      attr_accessor :logger
    end
  end
end
