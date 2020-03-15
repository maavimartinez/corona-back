class Town < ApplicationRecord
    belongs_to :city
    has_many :shops
end
