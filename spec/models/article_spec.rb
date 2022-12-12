require 'rails_helper'

describe Article do

  let!(:user) { FactoryBot.create(:user) }

  describe 'factory' do
    let!(:article) { FactoryBot.build(:article) }

    it 'produces a valid object' do
      expect(article).to be_valid
    end
  end

  describe 'validations' do
    context 'without article unique id' do
      let!(:article) { FactoryBot.build(:article) }
      it 'is invalid' do
        article.article_unique_id = nil
        expect(article).not_to be_valid
      end
    end
  end
end
