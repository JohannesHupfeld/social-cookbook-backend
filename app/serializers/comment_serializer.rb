class CommentSerializer
  include JSONAPI::Serializer
  attributes :content, :created_at, :updated_at

  belongs_to :recipe
  belongs_to :user
end
