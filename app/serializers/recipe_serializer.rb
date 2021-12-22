class RecipeSerializer
  include JSONAPI::Serializer
  attributes :name, :ingredients, :instructions, :image_url, :user_id, :created_at, :updated_at

  belongs_to :user
  has_many :comments
  has_many :users, through: :comments 
end
