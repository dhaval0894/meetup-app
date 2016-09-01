class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :technology
      t.text :agenda
      t.text :pre_requisite
      t.string :venue
      t.date :event_date

      t.timestamps null: false
    end
  end
end
