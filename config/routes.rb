Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsered_posts, except: [:index]
  end

get 'about' => 'welcome#about'

 get 'contact' => 'welcome/contact'

 get 'faq' => 'welcome/faq'

 root 'welcome#index' #could be rewritten as root({to: 'welcome#index'}) root is a method that takes a hash as an argument and is using the "implied hash" syntax.

end
