class Post < ApplicationRecord
    belongs_to :user
    belongs_to :town

    validates :description, presence: true
    validates :date_time, presence:true 

end
