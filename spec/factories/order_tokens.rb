FactoryGirl.define do
  factory :order_token do
    board_id 1
    player_id 1
    type "March"
    territory "bay_of_ice"
    x 1
    y 1
    faceup false
  end
end
