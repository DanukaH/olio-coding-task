require 'rails_helper'

describe Like do
  describe 'factory' do
    let!(:article) { FactoryBot.build(:article) }
    let!(:user) { FactoryBot.build(:user) }
    let!(:like) { FactoryBot.build(:like, user: user, article: article) }

    it 'produces a valid object' do
      expect(like).to be_valid
    end
  end
end
