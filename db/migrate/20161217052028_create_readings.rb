class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.decimal :temperature
      t.decimal :humidity

      t.timestamps null: false
    end
  end
end
