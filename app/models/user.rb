class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  attribute :posts_counter, :integer, default: 0
  attribute :role

  def admin?
    role == 'admin'
  end

  def customer?
    role == 'default'
  end

  has_one_attached :avatar
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_most_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
