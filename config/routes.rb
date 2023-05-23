Rails.application.routes.draw do
  root "phone_contacts#index"
  resources :phone_contacts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
