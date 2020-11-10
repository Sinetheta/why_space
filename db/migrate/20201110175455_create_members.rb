class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name

      t.timestamps
    end
  end
end
