class MatchesSerializer < ActiveModel::Serializer
  attributes :id, :player_count

  def player_count
    object.players.count
  end
end
