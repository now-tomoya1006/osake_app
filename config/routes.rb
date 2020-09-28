Rails.application.routes.draw do

  
  devise_for :users
  root :to => 'home#top'
  get '/home/about' => "home#about", as:"about"
  
      resources :users, only:[:new,:index,:show, :update, :edit] 
        
      resources :sakes, only:[:new, :create, :index, :show, :destroy, :edit, :update, ] do
      resources :sake_comments, only: [:create, :destroy]
       resource :favorites, only: [:create, :destroy]
      end
      
end
