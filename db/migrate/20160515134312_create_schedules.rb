class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :year, null: false #年
      t.integer :month, null: false # 月
      t.string :days, null: false # 開催日
    end
  end
end
