class Appointment < ApplicationRecord
  
  belongs_to :client
  belongs_to :treatment
  has_many :reviews
  has_many :clients, through: :reviews

end
