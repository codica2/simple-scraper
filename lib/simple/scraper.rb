require 'nokogiri'
require 'httparty'
require 'parallel'

require 'simple/scraper/version'
require 'simple/scraper/configuration'
require 'simple/scraper/finder'
require 'simple/scraper/parser'

module Simple
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
