require 'rails_helper'

describe 'Doctor show page' do
  before :each do
    @hospital = Hospital.create!(name: 'charles memorial hospital')

    @doctor = @hospital.doctors.create!(name: 'Francis Harvestbringer', specialty: 'nasal spray', university: 'Harvard')

    @patient1 = @doctor.patients.create!(name: 'harry', age: 19)
    @patient2 = @doctor.patients.create!(name: 'david', age: 24)
    @patient3 = @doctor.patients.create!(name: 'guineveve', age: 31)
  end

  describe 'visit the show page' do
    it do
      visit "/doctors/#{@doctor.id}"

      expect(page).to have_content(@doctor.name)
      expect(page).to have_content(@doctor.specialty)
      expect(page).to have_content(@doctor.university)

      expect(page).to have_content(@doctor.hospital.name)

      @doctor.patients.each do |patient|
        within("#patient-#{patient.id}") do
          expect(page).to have_content(patient.name)
        end
      end
    end

    it 'can remove patients' do
      visit "/doctors/#{@doctor.id}"

      @doctor.patients.each do |patient|
        within("#patient-#{patient.id}") do
          expect(page).to have_content(patient.name)
          expect(page).to have_button('Remove patient')
        end
      end

      within("#patient-#{@patient1.id}") do
        click_button('Remove patient')
      end

      expect(page).to_not have_content(@patient1.name)
    end
  end
end
