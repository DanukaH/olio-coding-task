require 'rails_helper'

describe User do
  describe 'factory' do
    let!(:user) { FactoryBot.build(:user) }

    it 'produces a valid object' do
      expect(user).to be_valid
    end
  end

  describe 'on create callback' do
    it 'creates the user profile' do
      new_user = User.create(email: 'test@user.com', password: '9$tJ47uqDsAEz@6n')
      expect(new_user).to be_valid
    end
  end

  describe 'validations' do
    context 'without email' do
      let!(:user) { FactoryBot.build(:user) }
      it 'is invalid' do
        user.email = nil
        expect(user).not_to be_valid
      end
    end
  end

  describe 'full_name' do
    context 'where first and last name are populated' do
      let!(:user) { FactoryBot.build(:user, first_name: 'this', last_name: 'user') }
      it 'returns first and last name concatenated with a space' do
        expect(user.full_name).to eq('this user')
      end
    end
  end
end
