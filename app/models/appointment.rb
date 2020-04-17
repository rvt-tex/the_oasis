class Appointment < ApplicationRecord
  
  belongs_to :client
  belongs_to :treatment
  has_many :reviews
  has_many :clients, through: :reviews

  validates :treatment, :desired_time, :desired_date, presence: true


  validate :desired_date_cannot_be_in_the_past

  def desired_date_cannot_be_in_the_past
    if desired_date.present? && desired_date < Date.today
    errors.add(:desired_date, "can't be in the past")
    end
  end 

  def self.upcoming_appointments
    appointments.order(desired_date: :desc).select { |a| a.desired_date > (DateTime.now) }
  end

  scope :alpha, -> { order(:desired_time) }

  def appointment_count
    @appointment_count ||= appointments.count
  end

end
