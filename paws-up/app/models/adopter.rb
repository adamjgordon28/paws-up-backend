class Adopter < ApplicationRecord
  has_many :meetings
  has_secure_password
end
