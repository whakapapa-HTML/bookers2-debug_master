Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    resources :relationships, only: [:create, :destroy]
      member do
          get :following, :followers
      end
    end
   resources :books do
    resource :favorites, only: [:create,:destroy] do
      collection do
        post 'index_create'
        delete 'index_destroy'
        
      end
    end
     resources :book_comments, only: [:create, :destroy]
   end  
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  get 'search' => 'searches#search'
end