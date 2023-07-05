class Character < ApplicationRecord
    include Kaminari::ActiveRecordExtension
  
    belongs_to :origin
    belongs_to :publisher
    has_and_belongs_to_many :powers

    
  end
  