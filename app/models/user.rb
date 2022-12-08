# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  company         :string
#  email           :string
#  first_name      :string
#  industry        :string
#  last_name       :string
#  password_digest :string
#  role            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
