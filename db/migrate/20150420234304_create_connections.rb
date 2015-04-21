class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :follower_id
      t.integer :target_id

      t.timestamps null: false
    end
  end
end
