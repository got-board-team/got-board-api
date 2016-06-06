class AddInfluenceTracksToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :iron_throne_track, :string, array: true, default: ['baratheon', 'lannister', 'stark', 'greyjoy', 'tyrell', 'martell']
    add_column :matches, :fiefdoms_track, :string, array: true, default: ['baratheon', 'lannister', 'stark', 'greyjoy', 'martell', 'tyrell']
    add_column :matches, :kings_court_track, :string, array: true, default: ['lannister', 'baratheon', 'stark', 'greyjoy', 'tyrell', 'martell']
  end
end
