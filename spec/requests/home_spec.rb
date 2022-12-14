require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  context 'when signed in as a user' do
    let!(:user) { FactoryBot.create(:user) }
    before(:each) do
      sign_in user
    end
    describe 'GET /index' do
      it 'returns http success' do
        get '/home/index'
        expect(response).to have_http_status(:success)
      end
    end
  end
end
