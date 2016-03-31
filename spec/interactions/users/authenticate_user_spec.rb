require 'rails_helper'

describe AuthenticateUser, type: :interactions do
  let(:attrs) do
    { 'email' => 'doe@mail.com', 'token' => '3f9831e372a2e3c029e8d3ffb5', 'first_name' => 'John', 'last_name' => 'Doe' }
  end

  context 'when user exists' do
    let(:user) { create(:user, token: 'e062620bfb432bae093f2aa42988b5b1') }

    subject { described_class.run(attrs.merge(email: user.email)).result }

    it 'find the user' do
      expect(subject.id).to eq(user.id)
    end

    it 'update the user' do
      subject
      expect(user.reload.token).to eq('3f9831e372a2e3c029e8d3ffb5')
    end
  end

  context 'when user does not exists' do
    subject { described_class.run(attrs).result }

    it 'creates a new user with the given inputs' do
      expect{ subject }.to change(User, :count).by(1)
      expect(subject.attributes).to include(attrs)
    end
  end

end
