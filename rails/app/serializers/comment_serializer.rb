class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :recipe_id, :commentBody, :created_at

  belongs_to :user, serializer: UserSerializer
  # def user
  #   Comment.select('users.*').joins(:user).where(:users => {:id => object.user_id})[0]
  # end
end
