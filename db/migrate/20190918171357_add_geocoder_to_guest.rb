class AddGeocoderToGuest < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :latitude, :decimal
    add_column :guests, :longitude, :decimal
  end
end
