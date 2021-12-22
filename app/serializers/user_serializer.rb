class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :username

  has_many :recipes
  has_many :comments
end
