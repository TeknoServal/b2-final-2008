require 'rails_helper'

describe Hospital, type: :model do
  describe 'validations' do
    it do
      should validate_presence_of :name
    end
  end

  describe 'relationships' do
    it do
      should have_many :doctors
      should have_many(:patients).through(:doctors)
    end
  end

  describe 'instance_methods' do
    it '#doctor_amount' do
      @hospital = Hospital.create(name: 'bill')

      @doctor1 = @hospital.doctors.create!(name: 'Francis Harvestbringer', specialty: 'nasal spray', university: 'Harvard')
      @doctor2 = @hospital.doctors.create!(name: 'Gerald Harvestbringer', specialty: 'nasal infections', university: 'Harvard')
      @doctor3 = @hospital.doctors.create!(name: 'Emily Harvestbringer', specialty: 'nasal blockages', university: 'Harvard')

      expect(@hospital.doctor_amount).to eq(3)
    end

    it '#universities_represented' do
      @hospital = Hospital.create(name: 'bill')

      @doctor1 = @hospital.doctors.create!(name: 'Francis Harvestbringer', specialty: 'nasal spray', university: 'Harvard')
      @doctor2 = @hospital.doctors.create!(name: 'Gerald Harvestbringer', specialty: 'nasal infections', university: 'Cornell')
      @doctor3 = @hospital.doctors.create!(name: 'Emily Harvestbringer', specialty: 'nasal blockages', university: 'Harvard')

      expect(@hospital.universities_represented.length).to eq(2)
    end
  end
end
