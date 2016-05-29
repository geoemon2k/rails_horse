class CreateJockeys < ActiveRecord::Migration
  def change
    create_table :jockeys do |t|
      t.string :name, null: false # 騎手名
    end
  end
end
