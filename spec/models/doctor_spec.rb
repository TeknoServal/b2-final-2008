require 'rails_helper'

describe Doctor, type: :model do
  describe 'validations' do
    it do
      should validate_presence_of :name
      should validate_presence_of :specialty
      should validate_presence_of :university
    end
  end

  describe 'relationships' do
    it do
      should belong_to :hospital
      should have_many :patient_doctors
      should have_many(:patients).through(:patient_doctors)
    end
  end
end
