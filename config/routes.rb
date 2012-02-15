KinTwit::Application.routes.draw do
  match '/login'        => "session#login",        :as => :login
  match '/finish_login' => "session#finish_login", :as => :finish_login
  match '/logout'       => "session#logout",       :as => :logout

  match '/timeline'     => "tweets#timeline",      :as => :timeline
  match '/mentions'     => "tweets#mentions",      :as => :mentions
  match '/compose'      => "tweets#new",           :as => :new_tweet, :via => [:get, :post]

  root :to => "home#index"
  
end

