# == Schema Information
#
# Table name: readings
#
#  id          :integer          not null, primary key
#  temperature :decimal(, )
#  humidity    :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Reading < ActiveRecord::Base
end
