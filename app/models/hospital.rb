class Hospital < ApplicationRecord
  validates_presence_of :name

  has_many :doctors
  has_many :patients, through: :doctors

  def doctor_amount
    doctors.count
  end

  def universities_represented
    doctors.select(:university).distinct
  end
end
