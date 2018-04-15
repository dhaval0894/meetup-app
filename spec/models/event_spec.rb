require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'has a valid factory' do
    event = build(:event)
    expect(event).to be_valid
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:venue) }
  it { is_expected.to validate_presence_of(:event_date) }
end