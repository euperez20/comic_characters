class Publisher < ApplicationRecord
    has_many :characters

    validates :deck, presence: true
    
    validates :location_city, presence: true
    validates :location_state, presence: true
    validates :location_name, presence: true
    validates :api_detail_url, presence: true
end
  