Rails.application.routes.draw do
<<<<<<< HEAD
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
=======
>>>>>>> dev
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

<<<<<<< HEAD
	
	scope module: :v1 do
		resources :users do
			put 'forgot_password' => 'users#forgot_password', on: :collection
			put 'reset_password' => 'users#reset_password', on: :member
		end
	end
	
=======
  scope module: :v1 do
    resources :users do
			collection do
      	post '/create_employee',to:'users#create'
      	get 'pending',to:'users#pending'
				put 'forgot_password',to: 'users#forgot_password'
      end
			member do
        put 'approve'
        delete 'reject',to:'users#destroy'
				put 'reset_password', to:'users#reset_password'
      end
    end

  end
>>>>>>> dev
end

