class Territory
  include ActiveModel::SerializerSupport
  include ActiveRecord::AttributeAssignment

  attr_reader :board
  attr_accessor :id, :slug, :path

  def initialize(board)
    @board = board
  end

  def units
    @board.units.by_territory(slug)
  end
end
