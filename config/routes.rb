Rails.application.routes.draw do

  get 'tweets/:tweet_id/likes' => 'likes#create'
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'
  
  get 'rooms/show'
  devise_for :users

  resources :users, :only => [:index, :show]
 
  resources :tweets do
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
 end


  
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 

  root 'tweets#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get 'tweets/BTS' => 'tweets#BTS'
  get 'tweets/TWICE' => 'tweets#TWICE'
  get 'tweets/IVE' => 'tweets#IVE'
  get 'tweets/aespa' => 'tweets#aespa'
  get 'tweets/BABYMONSTER' => 'tweets#BABYMONSTER'
  get 'tweets/BOYNEXTDOOR' => 'tweets#BOYNEXTDOOR'
  
end


