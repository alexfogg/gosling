Gosling::Application.routes.draw do
  root :to => 'home#index'

  resources :home, :only => [:index, :new, :create]

  get '/voice' => 'home#voice'



end
