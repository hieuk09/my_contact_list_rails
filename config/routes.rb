Rails.application.routes.draw do
  resources :contacts

  mount API::V1::Root => '/api'
  root 'contacts#index'
end
