# == Schema Information
#
# Table name: readings
#
#  id                 :integer          not null, primary key
#  temperature        :decimal(, )
#  humidity           :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  probe1_temperature :decimal(, )      default(0.0)
#
# Temperature, humidity and probe temperature with a timestamp.
class Reading < ApplicationRecord
end
