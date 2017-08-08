Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsered_posts, except: [:index]
  end

  resources :sponsered_post, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

 resources :users, only: [:new, :create]

 resources :sessions, only: [:new, :create, :destroy]

 post 'users/confirm' => 'users#confirm'

 get 'about' => 'welcome#about'

 get 'contact' => 'welcome/contact'

 get 'faq' => 'welcome/faq'

 root 'welcome#index' #could be rewritten as root({to: 'welcome#index'}) root is a method that takes a hash as an argument and is using the "implied hash" syntax.

end
