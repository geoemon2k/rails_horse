module Scraper
  class Base
    require 'nokogiri'
    require 'open-uri'

    attr_accessor :url, :year, :month, :day

    def all
      raise 'url is not set' until @url
      parse(open_url)
    end

    private
      def parse(params)
      end
    
      def open_url
        Nokogiri::HTML(open(@url))
      end
  end
end
