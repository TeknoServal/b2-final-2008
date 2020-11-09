require 'rails_helper'

RSpec.describe PatientDoctor, type: :model do
  describe 'validations' do
    it do
      should validate_presence_of :patient_id
      should validate_presence_of :doctor_id
    end
  end

  describe 'relationships' do
    it do
      should belong_to :patient
      should belong_to :doctor
    end
  end
end
