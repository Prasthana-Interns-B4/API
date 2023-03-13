Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :employees, controllers: {
        sessions: 'employees/sessions',
        registrations: 'employees/registrations'
      }

  namespace :v1 do
    resources :devices

  end

end
