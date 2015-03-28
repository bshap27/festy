class CreateFestivalDays < ActiveRecord::Migration
  def change
    create_table :festival_days do |t|
      t.string :name
      t.integer :jambaseid
      t.datetime :date
      t.integer :festival_id

      t.timestamps null: false
    end
  end
end
