class Publisher < ApplicationRecord
    has_many :characters

    validate :name
    validates :deck, presence: true    

end
  