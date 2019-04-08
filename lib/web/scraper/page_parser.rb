module Web
  module Scraper
    class PageParser
      attr_reader :attributes

      def initialize(attributes)
        @attributes = attributes || {}
      end

      def parse(urls, query: {}, headers: {})
        Parallel.map(Array(urls), in_threads: Web::Scraper.configuration.number_of_threads) do |url|
          PageFinder.find(url: url, query: query, headers: headers) do |page|
            attributes.each_with_object({}) do |(key, options), hsh|
              hsh[key] = options[:handler].call(page.xpath(options[:selector]))
            rescue StandardError => e
              Web::Scraper.logger&.error e
              hsh[key] = options[:default]
            end
          end
        end.compact
      end
    end
  end
end
