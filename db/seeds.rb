# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@hospital = Hospital.create!(name: 'charles memorial hospital')

@doctor = @hospital.doctors.create!(name: 'Francis Harvestbringer', specialty: 'nasal spray', university: 'Harvard')

@patient1 = @doctor.patients.create!(name: 'harry', age: 19)
@patient2 = @doctor.patients.create!(name: 'david', age: 24)
@patient3 = @doctor.patients.create!(name: 'guineveve', age: 31)
