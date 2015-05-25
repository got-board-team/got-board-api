FactoryGirl.define do
  factory :unit do
    board nil
    type "Footman"
    territory "winterfell"
    x 1
    y 1
    routed false

    factory :footman, class: Footman do
      type "Footman"
    end

    factory :knight, class: Knight do
      type "Knight"
    end

    factory :siege_engine, class: SiegeEngine do
      type "SiegeEngine"
    end

    factory :boat, class: Boat do
      type "Boat"
    end
  end

end
