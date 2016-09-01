class Event < ActiveRecord::Base
	has_many :participants
	has_one :speaker
end
