require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:example) do
    @user = User.create(name: 'James', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        posts_counter: 1)
    @post = Post.create(title: 'My first post', author_id: @user.id, text: 'my post is greate', comments_counter: 0,
                        likes_counter: 0)
  end
  describe 'GET /index' do
    it 'returns http success, render index template and correct response body' do
      get "/users/#{@post.author_id}/posts"
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    it 'returns http success, render show template and correct response body' do
      get "/users/#{@post.author_id}/posts/#{@post.id}"
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(response.body).to include('This is a  posts for a given user')
    end
  end
end
