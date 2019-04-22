module Simple
  module Scraper
    class Finder
      def self.find(url:, query: {}, headers: {})
        default_options[:query] = query
        default_options[:headers] = headers
        yield(Nokogiri::HTML(HTTParty.get(url, default_options)))
      rescue StandardError => e
        Simple::Scraper.logger&.error e
      end

      def self.default_options
        @default_options ||= {
          http_proxyaddr: Simple::Scraper.configuration.proxy_addr,
          http_proxyport: Simple::Scraper.configuration.proxy_port,
          http_proxyuser: Simple::Scraper.configuration.proxy_user,
          http_proxypass: Simple::Scraper.configuration.proxy_pass,
          verify: false
        }
      end
    end
  end
end
