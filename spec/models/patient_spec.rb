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
end
