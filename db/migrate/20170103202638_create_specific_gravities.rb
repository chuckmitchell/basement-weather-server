class CreateSpecificGravities < ActiveRecord::Migration[6.1]
  def change
    create_table :specific_gravities do |t|
      t.decimal :value, null:false
      t.string :type, null:false
      t.integer :batch_id, null:false

      t.timestamps null: false
    end
  end
end
