class CreateBatches < ActiveRecord::Migration[6.1]
  def change
    create_table :batches do |t|
      t.string :name, null:false
      t.text :details

      t.timestamps null: false
    end
  end
end
