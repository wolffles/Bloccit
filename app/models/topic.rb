class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :sponsered_posts, dependent: :destroy

  validates :name, length: {minimum: 5}, presence: true
  validates :description, length: {minimum: 20}, presence: true
end
