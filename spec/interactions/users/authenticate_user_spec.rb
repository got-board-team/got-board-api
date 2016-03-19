require 'rails_helper'

describe AuthenticateUser, type: :interactions do

  let!(:user) { FactoryGirl.create(:user) }

  subject { UserService.authenticate!(user.email) }

  it 'finds for a user' do
    expect(User).to receive(:find_by).with({email: user.email})
    expect(subject).to eq(user)
  end

  context 'when user exists' do
    it 'returns user'
  end

  context 'when user does not exists' do
    it 'creates a new user'
  end

end
