class Post < ApplicationRecord
Roles = [ :admin , :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  attribute :likes_counter, :integer, default: 0
  attribute :comments_counter, :integer, default: 0

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter_for_user

  def update_posts_counter_for_user
    author.increment!(:posts_counter)
  end

  def decrement_posts_counter_for_user
    author.decrement!(:posts_counter)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
