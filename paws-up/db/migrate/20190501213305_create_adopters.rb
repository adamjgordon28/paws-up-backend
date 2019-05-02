class CreateAdopters < ActiveRecord::Migration[5.2]
  def change
    create_table :adopters do |t|
      t.string :name
      t.integer :age
      t.string :location
      t.string :residence_type
      t.boolean :allergy
      t.boolean :pet
      t.timestamps
    end
  end
end
