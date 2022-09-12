# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_roles_on_uid  (uid)
#
class Role < ApplicationRecord
  validates :uid, :name, presence: true, uniqueness: true
  scope :admin, -> { find_by('uid = ?', 'admin') }
end
