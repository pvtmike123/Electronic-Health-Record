Rails.application.routes.draw do
  devise_for :users
  resources :patients
  resources :searches
  root 'home#index'

  scope module: "event" do
   get "check_in/:event_date_id", to: "event#check_in", as: :check_in
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
