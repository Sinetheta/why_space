class CreatePassions < ActiveRecord::Migration[6.0]
  def change
    create_table :passions do |t|
      t.references :member, null: false, foreign_key: true
      t.references :website, null: false, foreign_key: true
      t.string :topic

      t.timestamps
    end
  end
end
