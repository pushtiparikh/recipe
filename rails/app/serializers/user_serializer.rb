class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :full_name, :name, :email, :password, :password_confirmation, :avatar, :recipes

  has_many :recipes, serializer: RecipeSerializer
  def recipes
    object.recipes
  end

  def avatar
    rails_blob_path(object.avatar, only_path: true) if object.avatar.attached?
  end
end
