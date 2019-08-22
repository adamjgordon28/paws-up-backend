class CreateAdopters < ActiveRecord::Migration[5.2]
  def change
    create_table :adopters do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.integer :age
      t.string :location
      t.string :residence_type
      t.boolean :allergy
      t.boolean :other_pets
      t.string :img_url
      t.timestamps
    end
  end
end
