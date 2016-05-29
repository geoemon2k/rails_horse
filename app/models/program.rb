class Program < ActiveRecord::Base
  belongs_to :ground
  belongs_to :field
  belongs_to :category
  belongs_to :condition
  has_one :race_result
  has_many :schedule
end
