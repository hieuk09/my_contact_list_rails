Rails.application.routes.draw do
  resources :contacts, only: [:index, :edit, :update, :destroy]

  mount API::V1::Root => '/api'
  root 'contacts#index'
end
