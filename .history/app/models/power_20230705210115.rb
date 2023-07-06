class Power < ApplicationRecord
    has_and_belongs_to_many :characters

    validates :power_name, presence: true, uniqueness: true
    validates :description, presence: true
   
  end
  