FactoryGirl.define do
  factory :order_token do
    board_id 1
    player_id 1
    type ""
    territory "MyString"
    x 1
    y 1
    routed false
  end
end
