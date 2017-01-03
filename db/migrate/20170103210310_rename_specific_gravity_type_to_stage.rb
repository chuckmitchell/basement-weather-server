class RenameSpecificGravityTypeToStage < ActiveRecord::Migration
  def change
    rename_column :specific_gravities, :type, :stage
  end
end
