require 'nokogiri'
require 'httparty'
require 'parallel'

require 'web/scraper/version'
require 'web/scraper/page_finder'
require 'web/scraper/page_parser'

module Web
  module Scraper
    class << self
      attr_accessor :logger
      attr_writer :number_of_threads

      def number_of_threads
        @number_of_threads ||= 1
      end
    end
  end
end
