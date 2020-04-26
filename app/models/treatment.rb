class Treatment < ApplicationRecord

    has_many :appointments
    has_many :clients, through: :appointments 

    def self.most_popular_treatment
        treatment_id = Appointment.group(:treatment_id).count.max_by { |k, v| v}[0]
        self.find(treatment_id)
    end 
    
end
