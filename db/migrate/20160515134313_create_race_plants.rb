class CreateRacePlants < ActiveRecord::Migration
  def change
    create_table :race_plants do |t|
      t.string :name, null: false #名前
      t.string :direction, null: false #周り
    end
  end
end
