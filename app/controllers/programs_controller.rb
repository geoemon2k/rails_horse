class ProgramsController < ApplicationController
  before_action :setTargetyearOptions, :setTargetmonthOptions, only: [:index, :list, :capture]

  def index
    @fields = Field.all
    @target_day = params[:target_day] if params[:target_day]
    @target_month = params[:target_month] if params[:target_month]
    @target_year = params[:target_year] if params[:target_year]
    if @target_year && @target_month 
      @programs = Program.select('day', 'field_id').where(:year => @target_year, :month => @target_month).uniq
    end
  end

  def list
    @fields = Field.all
    @target_day = params[:target_day] if params[:target_day]
    @target_month = params[:target_month] if params[:target_month]
    @target_year = params[:target_year] if params[:target_year]
    @target_field_id = params[:target_field_id] if params[:target_field_id]
    @programs = Program.where(:year => @target_year, :month => @target_month, :day => @target_day, :field_id => @target_field_id)
  end

  def capture
    binding.pry
    Scraper::RacePrograms::Jra.new(capture_params)
  end

  def show
    @target_day = params[:target_day] if params[:target_day]
    @target_month = params[:target_month] if params[:target_month]
    @target_year = params[:target_year] if params[:target_year]
    @target_field_id = params[:target_field_id] if params[:target_field_id]
    @programs = Program.where(:year => @target_year, :month => @target_month, :day => @target_day, :field_id => @target_field_id)
    binding.pry
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def capture_params
      params.permit(:year, :month, :day)
    end

    # form用に値をセットする
    def setTargetyearOptions
      @target_year_options = [2014, 2015, 2016]
    end

    def setTargetmonthOptions  
      @target_month_options = [1,2,3,4,5,6,7,8,9,10,11,12]
    end
end
