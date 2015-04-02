class Player < ActiveRecord::Base

  HOUSES = %w( Baratheon Lannister Stark Greyjoy Tyrell Martell )

  belongs_to :match

  validates :match_id, presence: true
  validates :house, presence: true,
    inclusion: {in: HOUSES},
    uniqueness: {scope: :match_id}

end
