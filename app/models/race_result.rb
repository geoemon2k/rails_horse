class RaceResult < ActiveRecord::Base
  belongs_to :program
  belongs_to :jockey
  belongs_to :horse
  def self.order_find(program_id)
    RaceResult.where(program_id: program_id).order(:rank)
  end
end
