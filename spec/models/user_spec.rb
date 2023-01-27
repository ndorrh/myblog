require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.new(name:'Oswald Ebu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am learning ruby on rails for the first time', posts_counter: 1)}

  before {subject.save}

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    expect(User.first.name).to eql 'Oswald Ebu'
  end

  it 'photo link should be present' do
    subject.photo = 'www.picture.come/img.png'
    expect(subject).to be_valid
  end

  it 'Posts Counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Posts Counter should be greater than or equal to 0' do
    subject.posts_counter = 15
    expect(subject).to be_valid
  end

  it 'Return last three posts for user' do
    expect(subject.three_most_recent_post).to eq([])
  end
end
