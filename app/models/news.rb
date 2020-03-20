class News < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    validates :date_time, presence: true
    validates :source, presence: true
end
