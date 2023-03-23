Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  scope module: :v1 do
    resources :devices do
      member do
        put 'assign'
        put  'unassign'
      end
    end
  end

	
	scope module: :v1 do
		resources :users do
			put 'forgot_password' => 'users#forgot_password', on: :collection
			put 'reset_password' => 'users#reset_password', on: :member
		end
	end
	
end

