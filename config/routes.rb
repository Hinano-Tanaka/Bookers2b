Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  root to: "homes#top"
  get 'home/about' => "homes#about"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  post "users" => "books#create"
  post "books" => "books#create"
  post "users/:id" => "books#create"
  post "books/:id" => "books#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
