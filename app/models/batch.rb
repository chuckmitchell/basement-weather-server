# == Schema Information
#
# Table name: batches
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  details    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Batch < ActiveRecord::Base

  has_many :specific_gravities

  def alcohol_content
    original_measurement = specific_gravities.where(stage: "Starting Primary").first
    final_measurement = specific_gravities.where(stage: "Bottling").first

    return nil unless original_measurement || final_measurement

    if original_measurement.air_temperature || final_measurement.air_temperature
      og = original_measurement.corrected_value
      fg = final_measurement.corrected_value
    else
      og = original_measurement.value
      fg = final_measurement.value
    end

    abv = (76.08 * (og-fg) / (1.775-og)) * (fg / 0.794)

    return nil if abv < 0.00

    return abv
  end

end
