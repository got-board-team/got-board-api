require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:players) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
