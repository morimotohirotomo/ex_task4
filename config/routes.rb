Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  resources :books do
    resource :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  devise_for :users, controllers: {
	sessions: 'users/sessions',
	registrations: 'users/registrations'
  }
  resources :users, only: [:show, :index, :edit, :update] do
    member do
      get :following, :follower
    end
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end
