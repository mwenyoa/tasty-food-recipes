require 'rails_helper'

RSpec.describe 'PublicReceipes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/public_receipes/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/public_receipes/show'
      expect(response).to have_http_status(:success)
    end
  end
end
