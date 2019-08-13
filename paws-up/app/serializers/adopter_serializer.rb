class AdopterSerializer < ActiveModel::Serializer
attributes :id, :name, :username, :age, :location, :allergy, :img_url, :meetings, :residence_type, :other_pets


  def meetings
    self.object.meetings.map do |meeting|
      {id: meeting.id,
       pet_id: meeting.pet.id,
       pet: meeting.pet.name,
       date: meeting.datetime.strftime("%e %b %Y"),
       location: meeting.location,
       pet_img_url: meeting.pet.img_url}
     end
  end

end
