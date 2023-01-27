require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'My first post', author_id: 1, text: 'my post is greate', comments_counter: 0, likes_counter: 0)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Comments Counter should be greater than or equal to 0' do
    subject.comments_counter = -7
    expect(subject).to_not be_valid
  end

  it 'Comments Counter should be greater than or equal to 0' do
    subject.author_id = 1
    subject.comments_counter = '60'
    expect(subject).to_not be_valid
  end

  it 'likes Counter should be greater than or equal to 0' do
    subject.likes_counter = -12
    expect(subject).to_not be_valid
  end

  it 'likes Counter should be greater than or equal to 0' do
    subject.author_id = 1
    subject.likes_counter = '13'
    expect(subject).to_not be_valid
  end

  it 'author_id should be greater than or equal to 0' do
    expect(subject.author_id).to be_integer
  end

  it 'title should not be too long' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'Return last five posts for user' do
    expect(subject.five_most_recent_comments).to eq([])
  end
end
