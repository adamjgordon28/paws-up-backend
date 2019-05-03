class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :sex, :animal, :age, :location, :allergy, :size, :img_url, :guardian, :meetings


  def guardian
    {name: self.object.guardian.name,
    location: self.object.guardian.location,
    img_url: self.object.guardian.img_url
    }
  end

  def meetings
    self.object.meetings.map do |meeting|
      {adopter: meeting.adopter.name,
       date: meeting.datetime,
       location: meeting.location}
     end
  end
end
