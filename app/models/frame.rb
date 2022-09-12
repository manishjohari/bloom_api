# == Schema Information
#
# Table name: frames
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  price       :float
#  status      :integer          default("active")
#  stock       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Frame < ApplicationRecord
  include PriceData

  enum :status, { active: 1, inactive: 2 }

  scope :active, -> { where(status: 1) }

end
