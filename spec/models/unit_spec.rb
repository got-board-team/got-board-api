require 'rails_helper'

describe Unit, type: :model do
  describe 'type verification' do
    it 'initialize without errors with a valid type' do
      expect{ subject = described_class.new(type: 'Footman') }.to_not raise_error
    end

    it 'raise error when invalid type' do
      expect{ described_class.new(type: 'SomethingInvalid') }.to raise_error(ActiveRecord::SubclassNotFound)
    end
  end
end
