require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before(:example) do
    @user1 = User.create(
      name: 'John Doe',
      bio: 'Aspiring FullStack Dev',
      photo: 'https://unsplash.com/photos/NDCy2-9JhUs',
      posts_counter: 2
    )

    @user2 = User.create(
      name: 'Eburian',
      bio: 'FullStack Dev',
      photo: 'https://unsplash.com/photos/hodKTZow_Kk',
      posts_counter: 3
    )
  end

  describe 'user index paged' do
    it 'displays correct username' do
      visit users_path
      expect(page).to have_content('John Doe')
      expect(page).to have_content('Eburian')
      expect(page).to_not have_content('Geometry')
    end

    it 'shows user profile photo' do
      visit users_path
      expect(page).to have_css("img[src*='https://unsplash.com/photos/NDCy2-9JhUs']")
      expect(page).to have_css("img[src*='https://unsplash.com/photos/hodKTZow_Kk']")
    end

    it 'shows the correct number of posts' do
      visit users_path

      expect(page).to have_content('Number of posts: 2')
      expect(page).to have_content('Number of posts: 3')
    end

    it 'shows the user_path when clicked' do
      visit users_path
      click_link 'John Doe'
      expect(page).to have_current_path(user_path(@user1))
    end

    it 'it shows the bio in show path' do
      visit users_path
      click_link 'Eburian'
      expect(page).to have_content('FullStack Dev')
    end
  end
end
