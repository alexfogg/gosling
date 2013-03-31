Gosling::Application.routes.draw do
  root :to => 'home#index'

  resources :home, :only => [:index, :new, :create]

  get '/refresh' => 'home#refresh'

  get '/call' => 'home#call'

  post '/voice' => 'home#voice'

end
