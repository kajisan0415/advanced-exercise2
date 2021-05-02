Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
     member do 
        get :followed, :followers
      end
     end
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
  end

  resources :relationships, only: %I[create destroy]
  
 
  
end