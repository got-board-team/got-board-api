class HouseCard < ActiveRecord::Base
  pusherable :house_card

  belongs_to :board
  belongs_to :player
end
