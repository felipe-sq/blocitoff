Rails.application.routes.draw do
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  devise_for :users, :controllers => { :sessions => "users/sessions" }
  resources :users

end
