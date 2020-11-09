require 'rails_helper'

describe Patient, type: :model do
  describe 'validations' do
    it do
      should validate_presence_of :name
      should validate_presence_of :age
    end
  end

  describe 'relationships' do
    it do
      should have_many :patient_doctors
      should have_many(:doctors).through(:patient_doctors)
    end
  end

  # describe 'instance_methods' do
  #   it '#delete_refs' do
  #     @hospital = Hospital.create!(name: 'charles memorial hospital')

  #     @doctor = @hospital.doctors.create!(name: 'Francis Harvestbringer', specialty: 'nasal spray', university: 'Harvard')

  #     @patient1 = @doctor.patients.create!(name: 'harry', age: 19)
  #     @patient2 = @doctor.patients.create!(name: 'david', age: 24)
  #     @patient3 = @doctor.patients.create!(name: 'guineveve', age: 31)

  #     @patient1.delete_refs

  #     expect(@patient.patient_doctors).to eq([])
  #   end
  # end
end
