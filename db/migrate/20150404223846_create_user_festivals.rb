class CreateUserFestivals < ActiveRecord::Migration
  def change
    create_table :user_festivals do |t|
      t.string :user_id
      t.string :festival_id
      t.integer :relationship_type

      t.timestamps null: false
    end
  end
end
