class GuardianSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :img_url, :pets


  def pets
    self.object.pets.map do |pet|
    {id: pet.id,
    name: pet.name,
    img_url: pet.img_url,
    age: pet.age
    }
    end
  end

end
