class RenameAirTempToTemp < ActiveRecord::Migration[6.1]
  def change
    rename_column :specific_gravities, :air_temperature, :temperature
  end
end
