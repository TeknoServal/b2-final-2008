Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/doctors/:id', to: 'doctors#show', as: :doctor_show

  get '/hospitals/:id', to: 'hospitals#show'

  post '/patients/delete/:id', to: 'patients#delete', as: :patient_delete
end
