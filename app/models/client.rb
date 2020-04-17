class Client < ApplicationRecord

    has_secure_password

    has_many :reviews
    has_many :appointments
    has_many :treatments, through: :appointments 
    has_many :reviewed_appointments, through: :reviews, source: :appointments 

    validates_presence_of :first_name, :last_name, format: { with: /\A[a-zA-Z]+\Z/ }, message:"Cannot be blank"
    validates_numericality_of :phone, on: :create
    validates :email, format: {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: {message:"already belongs to an existing account"}

    

    def self.appointments_status
        joins(:appointments).where("appointments.created_at < ?", Time.now)
    end

    def self.most_selected_treatment
        joins(:appointments).group(:treatment_id).order("count(treatment_id) DESC").limit(3)
    end

end
