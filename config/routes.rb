Rails.application.routes.draw do
  root 'welcome#index'
  # root 'welcome#construction'
  resources :welcome, only: [:index]
  resources :quotes, only: [:create, :new, :index]

  get "sitemap.xml" => "sitemaps#index", :format => "xml", :as => :sitemap
end
