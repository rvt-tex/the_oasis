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

end
