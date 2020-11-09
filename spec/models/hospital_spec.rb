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
      should have_many(:universities).through(:doctors)
    end
  end
end
