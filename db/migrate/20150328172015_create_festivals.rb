class CreateFestivals < ActiveRecord::Migration
  def change
    create_table :festivals do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
