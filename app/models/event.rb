# Event Model
class Event < ActiveRecord::Base
  has_many :participants
  has_one :speaker

  validates_presence_of :name, :description, :venue, :event_date
end
