# frozen_string_literal: true

module Web
  module Scraper
    class PageParser
      def initialize(attributes)
        @attributes = attributes || {}
      end

      def parse(urls)
        Parallel.map(Array(urls), in_threads: Web::Scraper.number_of_threads) { |url| parse_page(url) }.compact
      end

      private

      attr_reader :attributes

      def parse_page(url)
        PageFinder.find(url: url) do |page|
          attributes.each_with_object({}) do |(key, options), hsh|
            hsh[key] = options[:handler].call(page.xpath(options[:selector]))
          rescue StandardError => e
            Web::Scraper.logger&.error e
            hsh[key] = options[:default]
          end
        end
      end
    end
  end
end
