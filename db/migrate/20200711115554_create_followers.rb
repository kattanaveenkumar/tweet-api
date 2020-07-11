class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.integer :followed_by_id
      t.integer :following_to_id

      t.timestamps
    end
  end
end
