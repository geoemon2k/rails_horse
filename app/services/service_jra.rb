module Scraper::RacePrograms
  class ServiceJra
  require 'nokogiri'
  require 'open-uri'

  def parseSchedule(target_year, target_month, target_day)
    url = 'http://www.jra.go.jp/keiba/calendar/' + target_year.to_s + '/' + target_month.to_s + '/' + sprintf("%02d", target_month) + sprintf("%02d", target_day) + '.html'
    doc = Nokogiri::HTML(open(url))

    @schedules = Array.new
    field_array = Array.new
    doc.xpath("//td[@class='cal-racec-cell']").each do |field|
      field_array.push(field.text)
    end

    doc.xpath("//tr[@class='nomal-race' or @class='grade-race']").each do |entry|
      schedule = Hash.new
      schedule['year'] = target_year
      schedule['month'] = target_month
      schedule['day'] = target_day
      if entry.search('th').text.delete("\s") =~ /^1R$/
        @field = field_array.shift
      end
      schedule['field'] = @field
      schedule['num'] = entry.search('th').text.delete("\s|R")
      name, category, distance_and_ground = String.new
      td_parse = entry.search('td').text.split("\n")
      for count in 1..td_parse.length do
        shift_data = td_parse.shift
        if shift_data =~ /^\s*\d歳|^\s*障害\d歳/
          category = shift_data
          distance_and_ground = td_parse.shift
          if td_parse.length > 0
            distance_and_ground_splits += td_parse.shift
          end
          break
        else
          name += shift_data
        end
      end
      if name.nil? == true || name.empty? == true
        name = category
      end
      schedule['name'] = name.strip
      schedule['category'] = category.strip
      distance_and_ground_splits = Array.new
      distance_and_ground_splits = distance_and_ground.split("\s")
      schedule['distance'] = distance_and_ground_splits[0].delete(',')
      schedule['ground'] = distance_and_ground_splits[1].match(/ダ|芝/)[0]
      @schedules << schedule
    end
     @schedules
  end
end
