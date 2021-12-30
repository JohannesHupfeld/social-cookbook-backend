class RecipeSerializer
  include JSONAPI::Serializer
  attributes :name, :ingredients, :instructions, :image_url, :user_id, :created_at, :updated_at, :comments

  belongs_to :user, serializer: UserSerializer
   # has_many :comments
   # has_many :users, through: :comments 
end
