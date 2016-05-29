class TrainingsController < ApplicationController
  def show
    @trainings = Training.where(horse_id: params[:id]).order('date DESC').limit(4)
  end
end
