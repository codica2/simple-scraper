module Web
  module Scraper
    class PageParser
      def initialize(attributes)
        @attributes = attributes || {}
      end

      def parse(url)
        PageFinder.find(url: url) do |page|
          attributes.each_with_object({}) do |(key, options), hsh|
            hsh[key] = options[:handler].call(page.xpath(options[:selector]))
          rescue StandardError => error
            p error.message
            hsh[key] = options[:default]
          end
        end
      end

      private

      attr_reader :attributes
    end
  end
end
