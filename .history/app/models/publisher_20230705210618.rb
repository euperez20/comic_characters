class Publisher < ApplicationRecord
    has_many :characters

    validates :name, presence: true, uniqueness: true 
    validates :deck, presence: true    

end
  