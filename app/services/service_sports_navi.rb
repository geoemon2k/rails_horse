class ServiceSportsNavi
  require 'nokogiri'
  require 'open-uri'

  def setYear(target_year)
    @target_year = target_year
  end


  def getSchedule
    url = String.new
    @navi_schedule_array = Array.new
#    [1,2,3,4,5,6,7,8,9,10,11,12].each do |target_month|
    [1].each do |target_month|
      url = 'http://keiba.yahoo.co.jp/schedule/list/' + @target_year + '/?month=' + target_month.to_s

      # htmlをパース(解析)してオブジェクトを生成
      doc = Nokogiri::HTML(open(url))
      doc.xpath("//table[@class='scheLs mgnBS']//tr").each do |tr|
        parse_data = Hash.new
        if tr.search("td[1]").text.empty? == false
          parse_data['year'] = @target_year
          parse_data['month'] = target_month.to_s
          parse_data['day'] = tr.search("td[1]").text.match(/^\d+/)[0]
          parse_data['field'] = tr.search("td[2]").text.match(/^\d+回(..)\d+日/)[1]
          @navi_schedule_array << parse_data
        else
          next
        end
      end
    end
    return @navi_schedule_array
  end
end
