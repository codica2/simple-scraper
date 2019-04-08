module Web
  module Scraper
    class PageFinder
      def self.find(url:, query:, headers:)
        default_options[:query] = query
        default_options[:headers] = headers
        yield(Nokogiri::HTML(HTTParty.get(url, default_options)))
      rescue StandardError => e
        Web::Scraper.logger&.error e
      end

      def self.default_options
        @default_options ||= {
          http_proxyaddr: Web::Scraper.configuration.proxy_addr,
          http_proxyport: Web::Scraper.configuration.proxy_port,
          http_proxyuser: Web::Scraper.configuration.proxy_user,
          http_proxypass: Web::Scraper.configuration.proxy_pass,
          verify: false
        }
      end
    end
  end
end
