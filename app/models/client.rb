class Client < ApplicationRecord

    has_secure_password

    has_many :reviews
    has_many :appointments
    has_many :treatments, through: :appointments 
    has_many :reviewed_appointments, through: :reviews, source: :appointments 
end
