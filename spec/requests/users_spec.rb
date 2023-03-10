require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:example) do
    @user = User.create(name: 'James', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        posts_counter: 1)
  end
  describe 'GET /index' do
    it 'returns http success, render index template and correct response body ' do
      get '/users'
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('<h1>MY BLOG</h1>')
    end
  end

  describe 'GET /show' do
    it 'returns http success, render show template and correct response body' do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(response.body).to include('<p class="user_bio">Teacher from Mexico.</p>')
    end
  end
end
