# == Schema Information
#
# Table name: glasses
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  frame_id   :bigint
#  lense_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_glasses_on_frame_id  (frame_id)
#  index_glasses_on_lense_id  (lense_id)
#  index_glasses_on_user_id   (user_id)
#
class GlassSerializer < ActiveModel::Serializer
  attributes :frame_id, :lense_id, :currency_code, :final_price, :price_breakdown

  def currency_code
    object.currency_code
  end

  def final_price
    object.final_price
  end

  def price_breakdown
    {
      frame_price: frame_price,
      lense_price: lense_price
    }
  end

  def frame_price
    object.frame_price
  end

  def lense_price
    object.lense_price
  end

end
