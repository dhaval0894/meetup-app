FactoryGirl.define do
  factory :event do
    name         { Faker::Name.name }
    description  { Faker::Lorem.sentence }
    technology   { Faker::Lorem.word }
    agenda       { Faker::Lorem.sentence }
    venue        { Faker::Address.street_address }
    event_date   { Faker::Date.forward }
  end

  factory :invalid_event, parent: :event do
    name         { nil }
  end
end
