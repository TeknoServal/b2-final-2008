class PatientsController < ApplicationController
  def delete
    patient = Patient.find(params[:id])

    patient.patient_doctors.each do |pdoc|
      pdoc.delete
    end
    patient.delete

    redirect_to doctor_show_path(params[:doc_id].to_s)
  end
end
