class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :user_id
      t.integer :friend_id

      t.timestamps null: false
    end
  end
end
