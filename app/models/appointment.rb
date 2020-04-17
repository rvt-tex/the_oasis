class Appointment < ApplicationRecord
  
  belongs_to :client
  belongs_to :treatment
  has_many :reviews
  has_many :clients, through: :reviews

  alidates :treatment, :desired_time, :desired_date, presence: true


  validate :desired_date_cannot_be_in_the_past
 
  def desired_date_cannot_be_in_thepast
    if desired_date.present? && desired_date < Date.today
    errors.add(:desired_date, "can't be in the past")
    end
  end 

end
