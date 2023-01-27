class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 0 }

  after_save :update_comments_counter_for_post

  def update_comments_counter_for_post
    post.increment!(:comments_counter)
  end
end
