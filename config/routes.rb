Rails.application.routes.draw do
  root to: redirect('/api-docs')

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    resources :reservations, only: [:index, :create]
    resources :items, path: '/dances', only: [:index, :create, :show, :destroy]
  end
end
