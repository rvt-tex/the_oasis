class Appointment < ApplicationRecord
  
  belongs_to :client
  belongs_to :treatment
  has_many :reviews, dependent: :destroy
  has_many :clients, through: :reviews

  validates :treatment, :desired_time, :desired_date, presence: true

  accepts_nested_attributes_for :client, :reviews

  validate :desired_date_cannot_be_in_the_past

  def desired_date_cannot_be_in_the_past
    if desired_date.present? && desired_date < Date.today
    errors.add(:desired_date, "can't be in the past")
    end
  end 

  scope :alpha, -> { order(:desired_date) }

  def appointment_count
    @appointment_count ||= appointments.count
  end

  def one_review_per_appointment
    today_review = client.reviews.select do |p|
      p.created_at.try(:to_date) == Date.today
    end
    
    if today_review.size > 1
      errors.add(:review_id, " your only required to write one review per appoinment.")
    end
  end

end
