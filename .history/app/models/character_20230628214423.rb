class Character < ApplicationRecord
    include Kaminari::ActiveRecordExtension
  
    belongs_to :origin
    belongs_to :publisher

    
  end
  