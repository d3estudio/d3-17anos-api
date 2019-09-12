class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :slug, index: { unique: true }
      t.string :tag_nfc, index: { unique: true }
      t.string :name
      t.string :nickname
      t.string :description
      t.string :greeting
      t.string :phone
      t.string :address
      t.string :address_number
      t.string :address_complement
      t.string :zip
      t.string :city
      t.string :state
      t.string :picture
      t.string :email
      t.integer :bond
      t.datetime :joined_at
      t.datetime :left_at

      t.timestamps
    end
  end
end
