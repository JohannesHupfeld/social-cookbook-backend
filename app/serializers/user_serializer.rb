class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :username

  has_many :recipes, serializer: RecipeSerializer
  has_many :comments
end
