class AddForeignKey < ActiveRecord::Migration
  def change
  	add_column :participants, :event_id, :integer
  	add_foreign_key :participants, :events

  	add_column :speakers, :event_id, :integer
  	add_foreign_key :speakers, :events
  end
end
