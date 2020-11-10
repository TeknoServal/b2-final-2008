class PatientDoctorsController < ApplicationController
  def delete
    relation = PatientDoctor.find(params[:id])
    doc_id = relation.doctor_id

    relation.delete

    redirect_to doctor_show_path(doc_id)
  end
end
