class HorsesController < ApplicationController
  before_action :set_horse, only: [:show, :edit, :update, :destroy]

  def index
    @horses = Horse.all
  end

  def new
#    @horse = Horse.new
  end

  def show
    set_horse
  end

  def create
    @horse = Horse.new(horse_params)
    @horse.save!
    @horses = Horse.all # viewの為に仕方なく。。。
    action :index
  end

  private
   # Use callbacks to share common setup or constraints between actions.
    def set_horse
      @horse = Horse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horse_params
#      params.fetch(:horse, {}).symbolize_keys
      params.require(:horse).permit(:name, :birth_year, :sex)
    end
end
