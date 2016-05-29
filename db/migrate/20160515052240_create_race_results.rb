class CreateRaceResults < ActiveRecord::Migration
  def change
    create_table :race_results do |t|
      t.integer :horse_id, null: false
      t.integer :program_id, null: false
      t.integer :jockey_id, null: false
      t.integer :jockey_weight, null: false
      t.integer :weight, null: false
      t.integer :rank, null: false
      t.integer :uma_num, null: false
      t.integer :waku_num, null: false
      t.string :corner_3f, null: false
      t.string :corner_4f, null: false
      t.time :total_time, null: false
      t.time :time_3f, null: false
      t.string :chakusa, null: false
    end
  end
end
