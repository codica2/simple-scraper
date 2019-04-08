# frozen_string_literal: true

module Web
  module Scraper
    class PageFinder
      def self.find(url:)
        yield(Nokogiri::HTML(HTTParty.get(url)))
      rescue StandardError => e
        Web::Scraper.logger&.error e
      end
    end
  end
end
