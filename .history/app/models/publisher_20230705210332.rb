class Publisher < ApplicationRecord
    has_many :characters

    # validate :name, presence: true
    validates :deck, presence: true    

end
  