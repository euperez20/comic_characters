class Character < ApplicationRecord
    belongs_to :origin
    belongs_to :publisher

    include Kaminari::ActiveRecordExtension
  end
  