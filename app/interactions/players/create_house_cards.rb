class CreateHouseCards < ActiveInteraction::Base
  object :player

  def execute
    player.house_cards.create!(HOUSE_CARDS[player.house])
  end

  HOUSE_CARDS = {
    Baratheon: [
      { name: "patchface" },
      { name: "melisandre" },
      { name: "salladhor" },
      { name: "brienne" },
      { name: "davos" },
      { name: "renly" },
      { name: "stannis" },
    ],
    Lannister: [
      { name: "cersei" },
      { name: "tyrion" },
      { name: "hound" },
      { name: "jaime" },
      { name: "gregor" },
      { name: "tywin" },
    ],
    Stark: [
      { name: "Eddard Stark" },
      { name: "Robb Stark" },
      { name: "Roose Bolton" },
      { name: "Greatjon Umber" },
      { name: "The Blackfish" },
      { name: "Ser Rodrick Cassel" },
      { name: "Catelyn Stark" },
    ],
    Greyjoy: [
      { name: "aeron" },
      { name: "asha" },
      { name: "dagmar" },
      { name: "balon" },
      { name: "theon" },
      { name: "victorian" },
      { name: "euron" },
    ],
    Tyrell: [
      { name: "queen" },
      { name: "alester" },
      { name: "margaery" },
      { name: "garlan" },
      { name: "randyll" },
      { name: "loras" },
      { name: "mace" },
    ],
    Martell: [
      { name: "doran" },
      { name: "arianne" },
      { name: "nymeria" },
      { name: "darkstar" },
      { name: "obara" },
      { name: "areo" },
      { name: "redviper" },
    ],
  }.with_indifferent_access.freeze
end
