class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :sex, :animal, :age, :location, :allergy, :size, :img_url, :meetings


  def meetings
    self.object.meetings.map do |meeting|
      {id: meeting.id,
       adopter_id: meeting.adopter.id,
       adopter: meeting.adopter.name,
       date: meeting.datetime.strftime("%e %b %Y"),
       location: meeting.location,
       adopter_img_url: meeting.adopter.img_url}
     end
  end




end
