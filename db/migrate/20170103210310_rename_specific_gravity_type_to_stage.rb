class RenameSpecificGravityTypeToStage < ActiveRecord::Migration[6.1]
  def change
    rename_column :specific_gravities, :type, :stage
  end
end
