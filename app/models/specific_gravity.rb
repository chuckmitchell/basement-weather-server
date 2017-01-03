# == Schema Information
#
# Table name: specific_gravities
#
#  id          :integer          not null, primary key
#  value       :decimal(, )      not null
#  stage       :string           not null
#  batch_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  temperature :decimal(, )
#

class SpecificGravity < ActiveRecord::Base

  belongs_to :batch

  STAGES = ["Starting Primary", "Intermediate", "Bottling"]
  CALIBRATION_TEMP_F = 59

  def corrected_value
    return value if !temperature

    temp_f = to_fahrenheit
    return value*((1.00130346-0.000134722124*temp_f+0.00000204052596*temp_f**2-0.00000000232820948*temp_f**3)/(1.00130346-0.000134722124*CALIBRATION_TEMP_F+0.00000204052596*CALIBRATION_TEMP_F**2-0.00000000232820948*CALIBRATION_TEMP_F**3))

  end

  def to_fahrenheit
    (temperature * 1.8) + 32
  end

end
