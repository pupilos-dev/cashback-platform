class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :advertiser_name, null: false
      t.string :url, null: false
      t.text :description, null: false
      t.date :starts_at, null: false
      t.date :ends_at
      t.boolean :premium, default: false
      t.boolean :enabled, default: false

      t.timestamps
    end
  end
end
