require 'nokogiri'
require 'httparty'
require 'parallel'

require 'web/scraper/version'
require 'web/scraper/configuration'
require 'web/scraper/page_finder'
require 'web/scraper/page_parser'

module Web
  module Scraper
    class << self
      attr_writer :configuration, :logger
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.reset
      @configuration = Configuration.new
    end

    def self.configure
      yield(configuration)
    end

    def self.logger
      configuration.logger
    end
  end
end
