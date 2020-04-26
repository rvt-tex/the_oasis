class Review < ApplicationRecord

    belongs_to :client
    belongs_to :appointment

    validates :comment, presence: true
    validates :appointment, uniqueness: {scope: :client_id, message: "needs only one review. Please select a different appointment"}

end
