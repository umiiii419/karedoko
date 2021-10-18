Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    resources :genres, only: [:index, :create, :edit,   :update]
    resources :shops,  only: [:index, :new,    :create, :show, :edit, :update]
    resources :users,  only: [:index, :edit,   :update, :destroy]
  end

  scope module: :public do
    root to:  "homes#top"
    get       "/about",               to: 'homes#about'
    get       "/users/my_page/:id",   to: 'users#show',       as: 'users_my_page'
    get       "/users/reviews/:id",   to: 'users#reviews',    as: 'users_reviews'
    get       "/users/unsubscribe",   to: 'users#unsubscribe'
    patch     "/users/withdrawal",    to: 'users#withdrawal'
    resource  :users,                 only: [:edit,  :update]
    get       "/shops/search_result", to: 'shops#search_result'
    get       "/shops/rank",          to: 'shops#rank'
    resources :shops,                 only: [:index, :show]   do
      resources :reviews,             only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end

  devise_for :users, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
