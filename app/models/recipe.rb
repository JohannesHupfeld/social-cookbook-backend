class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments 

  validates :name, :user, presence: true
end
