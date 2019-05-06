class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :sex
      t.string :animal
      t.integer :age
      t.string :location
      t.boolean :allergy
      t.string :size
      t.string :img_url
      t.timestamps
    end
  end
end
