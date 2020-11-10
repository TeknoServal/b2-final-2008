Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/doctors/:id', to: 'doctors#show', as: :doctor_show

  get '/hospitals/:id', to: 'hospitals#show'

  post '/patient_doctors/delete/:id', to: 'patient_doctors#delete', as: :patient_relation_delete

  get '/patients', to: 'patients#index'
end
