Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  scope module: :public do
    resource :users, only: [:edit, :update]
    get "/users/my_page", to: 'users#show'
    get "/users/unsubscribe", to: 'users#unsubscribe'
    patch "/users/withdrawal", to: 'users#withdrawal'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
