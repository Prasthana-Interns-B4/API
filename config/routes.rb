Rails.application.routes.draw do
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
	match '*unmatched', to: 'application#not_found_route', via: :all
end
