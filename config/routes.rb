HangOverflow::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :cocktails do
  	resources :votes
  end
  resources :ingredients, :only => [:new]

  match '/auth/:provider/callback', :to => 'authentications#create'
end
