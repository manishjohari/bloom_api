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
class Glass < ApplicationRecord
  belongs_to :user
  belongs_to :frame
  belongs_to :lense

  before_validation :validate_frame_id, on: :create
  before_validation :validate_lense_id, on: :create

  after_commit :reduce_stock, on: :create


  def validate_frame_id
    errors.add(:frame_id, 'not found') unless frame
    errors.add(:frame_id, 'out of stock') if frame && frame.stock < 1
  end

  def validate_lense_id
    errors.add(:lense_id, 'not found') unless lense
    errors.add(:lense_id, 'out of stock') if lense && lense.stock < 1
  end

  def final_price
    frame_price + lense_price
  end

  def currency_code
    user.currency_code
  end

  def frame_price
    frame.price_in(currency_code)
  end

  def lense_price
    lense.price_in(currency_code)
  end

  def reduce_stock
    frame.reduce_stock
    lense.reduce_stock
  end

end
