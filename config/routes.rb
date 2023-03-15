Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :employees, controllers: {
        sessions: 'employees/sessions',
        registrations: 'employees/registrations'
      }

  scope module: :v1 do
    resources :devices do
      get 'search?q=:search' => 'devices#search_implemention',on: :collection
    end
  end
	
	scope module: :v1 do
		resources :employees do
			put 'forgot_password' => 'employees#forgot_password', on: :collection
			put 'reset_password' => 'employees#reset_password', on: :collection
		end
	end
end
