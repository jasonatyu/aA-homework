class Note < ApplicationRecord
    validates :field, :track_id, :user_id, presence: true 

    belongs_to :user 
    belongs_to :track 
end
