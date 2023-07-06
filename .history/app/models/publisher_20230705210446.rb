class Publisher < ApplicationRecord
    has_many :characters

    
    validates :deck, presence: true    

end
  