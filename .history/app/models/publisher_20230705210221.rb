class Publisher < ApplicationRecord
    has_many :characters

    validate :name, presence:
    validates :deck, presence: true    

end
  