class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :sex, :animal, :age, :location, :allergy, :size, :img_url, :meetings


  def meetings
    self.object.meetings.map do |meeting|
      {adopter: meeting.adopter.name,
       date: meeting.datetime,
       location: meeting.location}
     end
  end
end
