class AddAirTemperatureToSpecificGravity < ActiveRecord::Migration[6.1]
  def change
    add_column :specific_gravities, :air_temperature, :decimal
  end
end
