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

end
