class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :recipe

    validates :commentBody, presence: true
end
