# == Schema Information
#
# Table name: users
#
#  id                              :bigint           not null, primary key
#  authentication_token            :string
#  authentication_token_updated_at :datetime
#  currency_code                   :string           default("usd"), not null
#  email                           :string           default(""), not null
#  encrypted_password              :string           default(""), not null
#  remember_created_at             :datetime
#  reset_password_sent_at          :datetime
#  reset_password_token            :string
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  role_id                         :integer
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ValidCurrencies = %w(usd gbp eur jud jpy)

  validates :currency_code, inclusion:{ in: ValidCurrencies, message: "must be one of #{ValidCurrencies.join(', ')}"}

  belongs_to :role, optional: true
  has_many :glasses

  ['admin'].each do |uid|
    # user.is_admin?
    define_method "is_#{uid.underscore}?" do
      role&.uid == uid
    end
  end

  def reset_authentication_token!
    update(
      authentication_token: Devise.friendly_token,
      authentication_token_updated_at: Time.zone.now,
    )
  end

  def user_info
    {
      user_id: id,
      email: email,
      auth_token: authentication_token
    }
  end
end
