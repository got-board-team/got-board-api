class Track < ActiveRecord::Base

  after_initialize :set_slots, if: Proc.new { |track| track.new_record? }

  belongs_to :match
  belongs_to :board

  def self.setup!(match, board, players)
    raise NotImplementedError
  end

  private

  # called after object initialization (on new records only)
  def set_slots
    raise NotImplementedError
  end

end
