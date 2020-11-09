require 'rails_helper'

describe 'Doctor show page' do
  before :each do
    @hospital = Hospital.new(name: 'charles memorial hospital')

    @doctor = @hospital.doctors.new(name: 'Francis Harvestbringer', specialty: 'nasal spray', university: 'Harvard')

    @patient1 = @doctor.patients.new(name: 'harry', age: 19)
    @patient1 = @doctor.patients.new(name: 'david', age: 24)
    @patient1 = @doctor.patients.new(name: 'guineveve', age: 31)
  end

  describe 'visit the show page' do
    visit "/doctors/#{@doctor.id}"

    expect(page).to have_content(@doctor.name)
    expect(page).to have_content(@doctor.specialty)
    expect(page).to have_content(@doctor.university)

    expect(page).to have_content(@doctor.hospital)

    @doctor.patients.each do |patient|
      expect(page).to have_content(patient.name)
    end

  end
end
