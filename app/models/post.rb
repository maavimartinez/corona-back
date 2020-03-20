class Post < ApplicationRecord
    belongs_to :user
    belongs_to :town

    validates :description, presence: true
    validates :title, presence: true
end
