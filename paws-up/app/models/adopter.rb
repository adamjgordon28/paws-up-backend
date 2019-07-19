class Adopter < ApplicationRecord
  has_many :meetings
  validates :username, uniqueness: true
  has_secure_password
end
