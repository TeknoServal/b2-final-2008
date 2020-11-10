require 'rails_helper'

describe 'Hospital show page' do
  before :each do
    @hospital = Hospital.create!(name: 'charles memorial hospital')

    @doctor1 = @hospital.doctors.create!(name: 'Francis Harvestbringer', specialty: 'nasal spray', university: 'Harvard')
    @doctor2 = @hospital.doctors.create!(name: 'Gerald Harvestbringer', specialty: 'nasal infections', university: 'Harvard')
    @doctor3 = @hospital.doctors.create!(name: 'Emily Harvestbringer', specialty: 'nasal blockages', university: 'Harvard')

    @patient1 = @doctor1.patients.create!(name: 'harry', age: 19)
    @patient1 = @doctor2.patients.create!(name: 'david', age: 24)
    @patient1 = @doctor3.patients.create!(name: 'guineveve', age: 31)
  end

  describe 'visit the show page' do
    it do
      visit "/hospitals/#{@hospital.id}"

      expect(page).to have_content(@hospital.name)
      expect(page).to have_content(@hospital.doctors.length.to_s)



      @hospital.doctors.each do |doctor|
        expect(page).to have_content(doctor.university).once
      end
    end
  end
end
