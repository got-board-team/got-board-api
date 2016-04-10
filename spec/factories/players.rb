FactoryGirl.define do
  factory :player do
    association :match
    house "Baratheon"

    trait :baratheon do
      house "Baratheon"
    end
    trait :lannister do
      house "Lannister"
    end
    trait :stark do
      house "Stark"
    end
    trait :greyjoy do
      house "Greyjoy"
    end
    trait :tyrell do
      house "Tyrell"
    end
    trait :martell do
      house "Martell"
    end
  end
end
