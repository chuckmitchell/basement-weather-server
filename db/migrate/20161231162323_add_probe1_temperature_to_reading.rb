class AddProbe1TemperatureToReading < ActiveRecord::Migration[6.1]
  def change
    add_column :readings, :probe1_temperature, :decimal, :default=>0.00
  end
end
