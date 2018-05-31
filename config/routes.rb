Rails.application.routes.draw do
  root 'welcome#index'
  # root 'welcome#construction'
  resources :welcome, only: [:index]
  resources :quotes, only: [:create, :new, :index]
  resources :blogs, except: [:show] do 
    collection do 
      get :search
    end
  end
  get "/blogs/:id(.format)" => "blogs#show"

  resources :reviews, except: [:show] do 
    collection do 
      get :search
    end
  end
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/dashboard' => 'dashboard#index'

  get "sitemap.xml" => "sitemaps#index", :format => "xml", :as => :sitemap
end
