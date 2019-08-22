class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.integer :adopter_id
      t.integer :pet_id
      t.datetime :datetime
      t.string :location
      t.timestamps
    end
  end
end
