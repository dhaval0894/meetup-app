class AddIndexToForeignKeys < ActiveRecord::Migration
  def change
  	add_index :participants, :event_id
  	add_index :speakers, :event_id
  end
end
