Rails.application.routes.draw do

  #STATIC
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  #get '/', to: 'static#index', as: 'root'
  
  #FLEX
  get '/welcome/:first_name', to: 'flex#welcome'
  #get '/gossip/:id', to: 'flex#gossip', as: 'details'
  get '/userprofile/:id', to: 'flex#userprofile', as: 'author'

  #GOSSIPS
  #get '/gossips/new', to: 'gossips#new'
  #post '/gossips', to: 'gossips#create'

  resources :cities, only: [:show]
  resources :users, only: [:show]
  resources :gossips, only: [:new, :create, :index, :show, :edit, :update, :destroy]


  
end    

