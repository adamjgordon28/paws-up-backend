class Pet < ApplicationRecord
  has_many :meetings, :dependent => :destroy
end
