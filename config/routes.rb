Rails.application.routes.draw do
  resources :events
  resources :meetings
  devise_for :users
  resources :patients
  resources :searches
  resources :logs

  resources :conversations do
    resources :messages
  end

  root 'home#index'
  get 'calendar' => 'calendar#index', as: 'calendar'
  get 'about' => 'about#index', as: 'about'
  get 'help' => 'help#index', as: 'help'

  scope module: "event" do
   get "check_in/:event_date_id", to: "event#check_in", as: :check_in
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
