Rails.application.routes.draw do
  devise_for :employees, controllers: {
    sessions: 'employees/sessions',
    registrations: 'employees/registrations'
  }

namespace :v1 do
  resources :employees do
    get 'search',on: :collection
    member do
      put 'update_by_employee'
      put 'approve'
      delete 'reject'
    end
  end
end
end
