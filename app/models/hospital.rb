class Hospital < ApplicationRecord
  validates_presence_of :name

  has_many :doctors

  def doctor_amount
    doctors.count
  end
end
