class Match < ActiveRecord::Base

  has_many :players
  has_one :board

end
