Rails.application.routes.draw do
  devise_for :employees, controllers: {
    sessions: 'employees/sessions',
    registrations: 'employees/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
