ThirtySecondLaugh::Application.routes.draw do
  
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks"
  } do
    post "logout" => "devise/sessions#destroy"
  end

  # get 'update-fb-like/:id', :to => 'clips#update_fb', :as => :update_fb
  root :to => 'welcome#index'
  
  resources :clips do
    collection do
      get 'popular'
      get 'latest'
      get 'tv'
      post :rate
      get 'preload_left_video'
      get 'preload_right_video'
    end
    member do
      get 'update_modal'
      put 'add_collect'
      put 'remove_collect'
    end
  end

  get 'category/:category', :to => 'category#index', :as=> :clips_category
  post 'clips/search', :to => 'clips#search', :as=> :clips_search
  get 'add_tag(/:tag)', :to => 'clips#add_tag', :as => :add_tag
  resources :users
end
