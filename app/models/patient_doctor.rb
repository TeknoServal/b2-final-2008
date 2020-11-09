class PatientDoctor < ApplicationRecord
  validates_presence_of :patient_id, :doctor_id

  belongs_to :patient, dependent: :destroy
  belongs_to :doctor, dependent: :destroy
end
