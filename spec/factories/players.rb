FactoryGirl.define do
  factory :player do
    association :match
    house "Baratheon"
  end

end
