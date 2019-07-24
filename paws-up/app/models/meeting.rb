class Meeting < ApplicationRecord
  validate :meeting_cannot_be_in_the_past
  def meeting_cannot_be_in_the_past
    if datetime < Date.today
      errors.add(:datetime, "meeting cannot be in the past")
    end
  end
  belongs_to :adopter
  belongs_to :pet
end
