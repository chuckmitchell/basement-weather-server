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

# Represents a delicious batch of beer (or wine I guess).
class Batch < ApplicationRecord
  include ActionView::Helpers::DateHelper

  has_many :specific_gravities

  def alcohol_content
    return nil unless original_gravity && final_gravity

    # Use temperature corrected values if available.
    if original_gravity.temperature && final_gravity.temperature
      og = original_gravity.corrected_value
      fg = final_gravity.corrected_value
    else
      og = original_gravity.value
      fg = final_gravity.value
    end
    abv = (76.08 * (og - fg) / (1.775 - og)) * (fg / 0.794)

    return nil if abv < 0.00
    abv
  end

  def status
    status = ''

    return status unless original_gravity && final_gravity

    if final_gravity.stage == 'Intermediate'
      status << "Still fermenting after #{time_ago_in_words original_gravity.created_at}"
    end

    if final_gravity.stage == 'Bottling'
      status << "Bottled after #{distance_of_time_in_words original_gravity.created_at, final_gravity.created_at}"
    end

    status
  end

  def original_gravity
    specific_gravities.find_by(stage: 'Starting Primary')
  end

  def final_gravity
    final_measurement = specific_gravities.find_by(stage: 'Bottling')

    final_measurement = specific_gravities.where(stage: 'Intermediate').last unless final_measurement
    final_measurement
  end
end
