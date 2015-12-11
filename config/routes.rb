Rails.application.routes.draw do
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'

  devise_for :users
  resources :users

end
