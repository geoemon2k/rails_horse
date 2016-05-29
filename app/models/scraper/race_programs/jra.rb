module Scraper
  class RacePrograms
    class Jra < Scraper::RacePrograms
      private
        def initialize(year=1999, month=1, day=1)
          @year, @month, @day = year, month, day
          @url = Urls::RacePrograms.new(@year, @month, @day).jra
        end

        def parse(params)
          programs = plant_array = Array.new
          # 場所の取得
          params.xpath("//td[@class='cal-racec-cell']").each do |parse_data|
            plant_array.push(parse_data.text)
          end

          params.xpath("//tr[@class='nomal-race' or @class='grade-race']").each do |parse_data|
            program = {year: year, month: month, day: day}

            # 第一レースになったらplantを入れ替える
            if parse_data.search('th').text.strip =~ /^1R$/
              # レース毎に毎回利用するのでインスタンス変数化
              @plant = plant_array.shift
            end
            program[:plant] = @plant

            # レース番号
            program[:num] = parse_data.search('th').text.delete("\s|R").to_i

            # レース名
            td_parse = parse_data.search('td').text.split("\n")
            program[:name] = td_parse.shift.strip
            # カテゴリ
            if td_parse[0] =~ /\d歳/
              program[:category] = td_parse.shift.strip
            else
              program[:category] = program[:name]
            end

            matches = Array.new
            td_parse.shift.gsub(/\(|（|\)|）/, ' ').split("\s").each do |split_data|
              program[:distance] = split_data.delete(',').to_i if split_data =~ /\d+,\d+/
              program[:field] = split_data if split_data =~ /芝|ダ/
              if split_data =~ /\d+\:\d+/
                split_data.match(/(定量?|ハンデ?|別定?)*(\d+\:\d+)/) do |md|  
                  program[:handy] = md[1]
                  program[:time] = md[2]
                end
              end
              program[:limit] = split_data if split_data =~ /牝/
            end
            programs << program
          end
          programs
        end
    end
  end
end
