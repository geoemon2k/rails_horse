class CaptureController < ApplicationController
  before_action :setTargetyearOptions, :setTargetmonthOptions, only: [:index]

  def index
  end

  # form用に値をセットする
  def setTargetyearOptions
    @target_year_options = [2014, 2015, 2016]
  end

  def setTargetmonthOptions
    @target_month_options = ['1-2Q','3-4Q',1,2,3,4,5,6,7,8,9,10,11,12]
  end
end
