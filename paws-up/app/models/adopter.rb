class Adopter < ApplicationRecord
  has_many :meetings, :dependent => :destroy
  validates :username, uniqueness: true
  has_secure_password
end
