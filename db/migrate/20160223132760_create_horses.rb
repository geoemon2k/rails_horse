class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name, null: false # 馬名
      t.integer :birth_year, null: false # 生まれ年
      t.string :sex, null: false # 性別
    end
  end
end
