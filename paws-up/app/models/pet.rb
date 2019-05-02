class Pet < ApplicationRecord
  belongs_to :guardian
  has_many :meetings
end
