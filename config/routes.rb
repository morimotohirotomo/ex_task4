Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  resources :books
  devise_for :users, controllers: {
	sessions: 'users/sessions',
	registrations: 'users/registrations'
  }
  resources :users, only: [:show, :index, :edit, :update]
end
