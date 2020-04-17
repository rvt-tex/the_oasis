class Review < ApplicationRecord

    belongs_to :client
    belongs_to :appointment

    validates :comment, presence: true
    validates :appointment, uniqueness: {scope: :client_id, message: "only one review required per appointment."}
end
