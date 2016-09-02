Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    get '/participants/new' => 'events#register'
    post '/participants' => 'events#register_participant'
    get '/speakers/new' => 'events#speaker'
    post '/speakers' => 'events#add_speaker'
  end  
end
