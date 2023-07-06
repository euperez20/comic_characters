class Character < ApplicationRecord
    include Kaminari::ActiveRecordExtension
  
    belongs_to :origin
    belongs_to :publisher
    has_and_belongs_to_many :powers

    validates :name, presence: true, uniqueness: true
    validates :count_of_issue_appearances, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :origin_id, presence: true
    validates :publisher_id, presence: true
    validates :powers, presence: true
    
  end
  