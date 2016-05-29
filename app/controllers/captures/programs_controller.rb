class Captures::ProgramsController < ApplicationController
  before_action :setTargetyears, only: [:index, :create]

  def index
    render :index
  end

  def create
    binding.pry
#    service_capture_jra = ServiceCaptureJra.new(capture_prams)
    service_field = ServiceField.new
    service_ground = ServiceGround.new
    service_jra = ServiceJra.new
    target_year = params[:target_year]

    target_monthes = Array.new
    if params[:target_month] == '1-2Q'
      target_monthes = [1,2,3,4,5]
    elsif params[:target_month] == '3-4Q'
      target_monthes = [6,7,8,9,10,11,12]
    else      target_monthes.push(params[:target_month])
    end
    target_monthes.each do |target_month|
      callender = Callender.find_by(:year => target_year, :month => target_month)
      callender[:days].split(',').each do |target_day|

        service_jra.parseSchedule(target_year, target_month, target_day).each do |jra_schedule|
          service_field.setName(jra_schedule['field'])
          service_ground.setName(jra_schedule['ground'])
          program = Program.new(
            'name' => jra_schedule['name'],
            'distance' => jra_schedule['distance'],
            'year' => jra_schedule['year'],
            'month' => jra_schedule['month'],
            'day' => jra_schedule['day'],
            'num' => jra_schedule['num'],
            'field_id' => service_field.getId,
            'ground_id' => service_ground.getId
            )
          program.save!
        end
      end
    end
    render :index, :locals => { :result => true }
  end

  private
  def set_program
    @program = Program.new
  end

  # form用に値をセットする
  def setTargetyears
    @target_years = Schedule.all.pluck(:year).uniq
  end
  def setTargetyears
    @target_months = [1,2,3,4,5,6,7,8,9,10,11,12]
  end
end
