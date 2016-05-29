class ServiceSchedule
  def initialize
    @schedules = Schedule.all
  end

  def set(target_year = nil, target_month = nil, target_day = nil, target_field_id = nil)
    @target_year = target_year if target_year
    @target_month = target_month if target_month
    @target_day = target_day if target_day
    @target_field_id = target_field_id if target_field_id
  end
  def setYear(target_year)
    set(target_year)
  end
  def setMonth(target_month)
    set(nil, target_month)
  end
  def setDay(target_day)
    set(nil, nil, target_day)
  end
  def setFieldId(target_field_id)
    set(nil, nil, nil, target_field_id)
  end

  def get
    where_line = Hash.new
    where_line.store(:year, @target_year) if @target_year
    where_line.store(:month, @target_month) if @target_month
    where_line.store(:day, @target_day) if @target_day
    where_line.store(:field_id, @target_field_id) if @target_field_id
    return @schedules.where(where_line)
  end

  def put
    schedules = Array.new
    service_field = ServiceField.new
    service_sportsnavi = ServiceSportsNavi.new
    service_sportsnavi.setYear(@target_year)
    navi_schedule_array = service_sportsnavi.getSchedule
    navi_schedule_array.each do |schedule|
      #同じデータの場合はExceptionせずにスキップ
      service_field.setName(schedule['field'])
      schedules << Schedule.create({
        'field_id': service_field.getId,
        'year': schedule['year'],
        'month': sprintf("%02d", schedule['month']),
        'day': sprintf("%02d", schedule['day'])
        })

      service_keibalabo = ServiceKeibalabo.new
      service_keibalabo.setYear(schedule['year'])
      service_keibalabo.setMonth(sprintf("%02d", schedule['month']))
      service_keibalabo.setDay(sprintf("%02d", schedule['day']))
      service_keibalabo.setFieldId(service_field.getId)
      labo_program_array = service_keibalabo.getPrograms12R
      labo_program_array.each do |program|
        programs << Program.create({
          
          })
      end
    end
  end



#binding.pry
#      service_field.setName(jra_program['field'])
#    end
#binding.pry
#    Schedule.import schedules
#    return true
#  end
end
