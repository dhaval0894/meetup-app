class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :contact
      t.text :suggestion

      t.timestamps null: false
    end
  end
end
