Gosling::Application.routes.draw do
  root :to => 'home#index'

  resources :home, :only => [:index, :new, :create]


  post '/call' => 'home#call'

  post '/voice' => 'home#voice'

  post '/message' => 'home#message'

end
