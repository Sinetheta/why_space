class CreateWebsites < ActiveRecord::Migration[6.0]
  def change
    create_table :websites do |t|
      t.references :member, null: false, foreign_key: true
      t.string :full_url
      t.string :short_url

      t.timestamps
    end
  end
end
