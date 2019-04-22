module Simple
  module Scraper
    class Configuration
      attr_accessor :proxy_addr,
                    :proxy_port,
                    :proxy_user,
                    :proxy_pass,
                    :number_of_threads,
                    :logger

      def initialize
        @proxy_addr = nil
        @proxy_port = nil
        @proxy_user = nil
        @proxy_pass = nil
        @logger = nil
        @number_of_threads = 1
      end
    end
  end
end
