class ServiceKeibalabo
  require 'nokogiri'
  require 'open-uri'

  def setYear(target_year)
    @target_year = target_year
  end
  def setMonth(target_month)
    @target_month = target_month
  end
  def setDay(target_day)
    @target_day = target_day
  end
  def setFieldId(target_field_id)
    @target_field_id = target_field_id
  end

  def getPrograms12R
    url = String.new
    service_field = ServiceField.new
    url = 'http://keibalab.jp/db/race/' + @target_year + @target_month + @target_day
    @labo_programs_array = Array.new
    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML(open(url))
    doc.xpath("//table[@class='table table-bordered table-striped std11']//tr").each do |tr|
      parse_data = Hash.new
      if tr.search("th").text.empty? == false
        @ground_data_array = Array.new
        @ground_data_array = tr.search("th").text.match(/^\d+回(.+)\d+日目天候：.+ 芝：(.+) ダ：(.+)/)
        # 競馬場データを取得したら次の処理に移る
        service_field.setName(@ground_data_array[1])
        next
      end
#        parse_data['field_id'] = @ground_data_array[1] if @ground_data_array
      parse_data['field_id'] = service_field.getId

      # レースデータを取得
      if tr.search("td[1]").text.empty? == false
        parse_data['race_num'] = tr.search("td[1]").text.match(/^(\d+)R/)[1]
        td2_array = tr.search("td[2]").text.split("\n\t\t")
        parse_data['race_name'] = td2_array[0]
        if td2_array[2] =~ /[ダ|芝|障]/
          if td2_array[2] =~ /^芝/
            parse_data['ground_id'] = 1
          elsif td2_array[2] =~ /^ダ/
            parse_data['ground_id'] = 2
          elsif td2_array[2] =~ /^障/
            parse_data['ground_id'] = 3
          end
          parse_data['distance'] = td2_array[2].match(/[芝|ダ|障](\d+)m/)[1]
        else
          next
        end
        @labo_programs_array << parse_data
      else
        next
      end
    end
    return @labo_programs_array
  end
end
