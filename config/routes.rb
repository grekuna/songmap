Rails.application.routes.draw do
  get '/songs', to: 'songs#index'
  get '/songs/test', to: 'songs#test'
  post '/songs', to: 'songs#create'
  root to: "songs#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
