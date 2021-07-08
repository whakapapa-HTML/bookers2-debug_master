Rails.application.routes.draw do
  get 'categories/category'
  get 'likes/create'
  get 'likes/destroy'
  get 'searches/search'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    resources :relationships, only: [:create, :destroy]
      member do
          get :following, :followers
      end
    end
    
  resources :books do
    collection do
      get :newest,:ascending,:category,:category_books
    end
   resource :favorites, only: [:create,:destroy] 

   resources :book_comments, only: [:create, :destroy]
   end  
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  get 'search' => 'searches#search'
end