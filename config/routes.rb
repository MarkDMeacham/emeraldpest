Rails.application.routes.draw do
  # root 'welcome#index'
  root 'welcome#construction'
  resources :quotes, only: [:create, :new]
end
