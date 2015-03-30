class CreateFestivals < ActiveRecord::Migration
  def change
    create_table :festivals do |t|
      t.string :name
      t.string :slug
      t.datetime :start_date
      t.datetime :end_date
      t.string :img_url

      t.timestamps null: false
    end
  end
end
