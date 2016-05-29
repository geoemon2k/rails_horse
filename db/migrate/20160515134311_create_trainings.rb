class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.integer :horse_id, null: false # 馬id
      t.date :date, null: false # 調教日
      t.time :time_6f, null: false # 6ハロン
      t.time :time_5f, null: false # 5ハロン
      t.time :time_4f, null: false # 4ハロン
      t.time :time_3f, null: false # 3ハロン
      t.time :time_2f, null: false # 2ハロン
      t.time :time_1f, null: false # 1ハロン
      t.integer :field_id, null: false # トレーニングコース
      t.string :jockey, null: false # 乗った人
      t.integer :status, null: false # 馬の状態
    end
  end
end
