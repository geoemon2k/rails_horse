module Scraper
  class RacePrograms < Scraper::Base
# [{
#   year: 年
#   month: 月
#   day: 日
#   plant: 競馬場
#   num: レース番号
#   name: レース名
#   category: クラス
#   distance: 距離
#   field: フィールド
#   handy: ハンデ
#   limit: 限定
#   time: 発送時間
# }]
  private
    def convert_plant(plant)
      '阪神' if plant =~ /阪/
      '京都' if plant =~ /淀/
      '東京' if plant =~ /東/
      '中京' if plant =~ /名/
    end
  end
end
