require 'rails_helper'

describe Unit, type: :model do
  it do
    expect(subject).to validate_inclusion_of(:type).
      in_array %w(Footman Knight Boat SiegeEngine)
  end
end
