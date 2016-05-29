class RaceResultsController < ApplicationController
  def show
#    binding.pry
    @program = Program.find(params[:id])
    @race_results = RaceResult.order_find(params[:id])
  end

  private
    def race_results_param
      params.require(:race_results).permit(:id)
    end
end
