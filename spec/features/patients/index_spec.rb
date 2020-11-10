require 'rails_helper'

describe 'Patient index page' do
  before :each do
    @hospital = Hospital.create!(name: 'charles memorial hospital')

    @doctor1 = @hospital.doctors.create!(name: 'Francis Harvestbringer', specialty: 'nasal spray', university: 'Harvard')
    @doctor2 = @hospital.doctors.create!(name: 'Gerald Harvestbringer', specialty: 'nasal infections', university: 'Harvard')
    @doctor3 = @hospital.doctors.create!(name: 'Emily Harvestbringer', specialty: 'nasal blockages', university: 'Harvard')

    @patient1 = @doctor1.patients.create!(name: 'harry', age: 19)
    @patient2 = @doctor2.patients.create!(name: 'david', age: 17)
    @patient3 = @doctor3.patients.create!(name: 'guineveve', age: 31)
  end

  describe 'visit the index page' do
    it do
      visit "/patients"

      Patient.all.each do |patient|
        within("#patient-#{patient.id}") do
          expect(page).to have_content(patient.name)
        end
      end

      expect(page.all('.patient-block').collect(&:text)).to eq(Patient.all.order(:age).map(&:name))
    end
  end
end
