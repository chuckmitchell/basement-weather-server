# == Schema Information
#
# Table name: specific_gravities
#
#  id              :integer          not null, primary key
#  value           :decimal(, )      not null
#  stage           :string           not null
#  batch_id        :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  air_temperature :decimal(, )
#

class SpecificGravity < ActiveRecord::Base

  belongs_to :batch

  STAGES = ["Starting Primary", "Intermediate", "Bottling"]

end
