class Origin < ApplicationRecord
    has_many :characters

    validates :name, presence: true, uniqueness: true
    validates :api_detail_url, presence: true
  end
  