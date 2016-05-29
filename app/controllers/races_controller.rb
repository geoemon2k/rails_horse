class RacesController < ApplicationController
  # レース番号からレース情報(開始前)を表示
  def before_detail
    @race_datas = RaceBefores.find(params[:id])
    action :before_detail
  end

  # レース番号からレース結果を表示
  def result_detail
    @race_datas = RaceResults.find(params[:id])
    action :result_detail
  end
end
