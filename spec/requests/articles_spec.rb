require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  article = JSON.parse('{
        "id": 12,
        "title": "Test Title",
        "description": "Test Description",
        "reactions": {
            "likes": 0,
            "by_user": false,
            "views": 18,
            "impressions": 3571
        }
      }')

  context 'when signed in as a user' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:article) { FactoryBot.create(:article) }
    before(:each) do
      sign_in user
    end

    let(:valid_attributes) do
      { article_unique_id: 12,
        like_count: 1
      }
    end

    describe 'GET /index' do
      it 'returns http success' do
        get articles_url
        expect(response).to have_http_status(:success)
      end
    end
  end
end
