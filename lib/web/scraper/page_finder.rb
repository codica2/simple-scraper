# frozen_string_literal: true

module Web
  module Scraper
    class PageFinder
      def self.find(url:)
        yield(Nokogiri::HTML(HTTParty.get(url)))
      rescue StandardError => error
        p error
      end
    end
  end
end
