class PatientDoctor < ApplicationRecord
  validates_presence_of :patient_id, :doctor_id

  belongs_to :patient
  belongs_to :doctor
end
