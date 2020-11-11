class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :from_member, null: false, foreign_key: { to_table: 'members' }
      t.references :to_member, null: false, foreign_key: { to_table: 'members' }

      t.timestamps

      t.index [:from_member_id, :to_member_id], unique: true
    end
  end
end
