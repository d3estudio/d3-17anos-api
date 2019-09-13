class CreateCheckins < ActiveRecord::Migration[5.2]
  def change
    create_table :checkins do |t|
      t.references :guest, foreign_key: true
      t.integer :seq

      t.timestamps
    end
  end
end
