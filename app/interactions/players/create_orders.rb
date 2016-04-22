class CreateOrders < ActiveInteraction::Base
  object :player

  def execute
    March.create!(player: player, board: board)
    MarchM.create!(player: player, board: board)
    MarchP.create!(player: player, board: board)
    ConsolidateP.create!(player: player, board: board)
    Consolidate.create!(player: player, board: board)
    Consolidate.create!(player: player, board: board)
    Defend.create!(player: player, board: board)
    Defend.create!(player: player, board: board)
    DefendP.create!(player: player, board: board)
    Raid.create!(player: player, board: board)
    Raid.create!(player: player, board: board)
    RaidP.create!(player: player, board: board)
    Support.create!(player: player, board: board)
    Support.create!(player: player, board: board)
    SupportP.create!(player: player, board: board)
    player.order_tokens
  end


  private

  def board
    player.match.board
  end
end
