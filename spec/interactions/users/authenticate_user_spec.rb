require 'rails_helper'

describe AuthenticateUser, type: :interactions do


  context 'when user exists' do
    let(:user) { create(:user) }

    subject { described_class.run(user.attributes).result }

    it 'finds for a user' do
      is_expected.to eq(user)
    end
  end

  context 'when user does not exists' do
    let(:attrs) { { 'first_name' => 'John', 'last_name' => 'Doe', 'email' => 'johndoe@mail.com', 'token' => 'some' } }

    subject { described_class.run(attrs).result }

    it 'creates a new user with the given inputs' do
      expect{ subject }.to change(User, :count).by(1)
      expect(subject.attributes).to include(attrs)
    end
  end

end
