class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :place_id, null: false # 馬場
      t.integer :year, null: false #開催年
      t.integer :month, null: false #開催月
      t.integer :day, null: false #開催日
      t.integer :num, null: false #レース番号
      t.string :name, null: false # レース名
      t.integer :distance, :default => 1000 # 距離
      t.integer :field_kind_id, null: false # 競馬場
#      t.integer :condition_id, null: false # 状態
    end
  end
end
