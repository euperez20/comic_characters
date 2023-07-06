class Publisher < ApplicationRecord
    has_many :characters

    validate 
    validates :deck, presence: true    

end
  