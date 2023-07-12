class User < ApplicationRecord
  has_secure_password validations: false
  has_one_attached :avatar

  validates :full_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create
  validates :name, presence: true

  has_many :recipes
  has_many :comments, dependent: :destroy
end
