Rails.application.routes.draw do
  get 'dashboard/index'
  get '/api/home', to: 'articles#home'
  get '/api/refresh', to: 'articles#refresh_data'
  root 'dashboard#index'
  resources :articles, except: [:new, :create, :edit]
end
