class AddAirTemperatureToSpecificGravity < ActiveRecord::Migration
  def change
    add_column :specific_gravities, :air_temperature, :decimal
  end
end
