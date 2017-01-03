class RenameAirTempToTemp < ActiveRecord::Migration
  def change
    rename_column :specific_gravities, :air_temperature, :temperature
  end
end
