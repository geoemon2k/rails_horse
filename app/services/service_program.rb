class ServiceProgram

  def initialize
    @programs = Program.all
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

  def put

  end

  def get
    where_line = Hash.new
    where_line.store(:year, @target_year) if @target_year
    where_line.store(:month, @target_month) if @target_month
    where_line.store(:day, @target_day) if @target_day
    where_line.store(:field_id, @target_field_id) if @target_field_id
    return @programs.where(where_line)
  end
end
