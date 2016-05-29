module Urls
  attr_accessor :year, :month, :day, :plant
  class RacePrograms < Urls::Base
    def initialize(year=nil, month=nil, day=nil, plant=nil)
      @year, @month, @day, @plant = year, month, day, plant
    end

    def jra
      Settings.url[:jra] + "/keiba/calendar/#{@year.to_s}/#{@month.to_s}/#{sprintf("%02d", @month)}#{sprintf("%02d", @day)}.html"
    end
  end
end
