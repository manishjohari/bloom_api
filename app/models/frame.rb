# == Schema Information
#
# Table name: frames
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  status      :integer          default("active")
#  stock       :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Frame < ApplicationRecord
  include PriceData

  enum :status, { active: 1, inactive: 2 }

  scope :active, -> { where(status: 1) }

end
