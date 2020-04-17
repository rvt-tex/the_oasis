class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :treatment
end
