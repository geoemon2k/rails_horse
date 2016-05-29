class CreateTrainingFields < ActiveRecord::Migration
  def change
    create_table :training_fields do |t|
      t.string :name, null: false # 調教場所
      t.time :avg_6f, null: true # 6F平均タイム
      t.time :avg_5f, null: true # 5F平均タイム
      t.time :avg_4f, null: true # 4F平均タイム
      t.time :avg_3f, null: false # 3F平均タイム
      t.time :avg_2f, null: false # 2F平均タイム
      t.time :avg_1f, null: false # 1F平均タイム
    end
  end
end
