class MeetingSerializer < ActiveModel::Serializer
attributes :id, :adopter_id, :pet_id, :datetime, :location, :date, :created_at, :updated_at


  def date
    self.object.datetime.strftime("%e %b %Y")
  end

end
