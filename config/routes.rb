Rails.application.routes.draw do
  resources :posts

get 'about' => 'welcome#about'

 get 'contact' => 'welcome/contact'

 get 'faq' => 'welcome/faq'

 root 'welcome#index' #could be rewritten as root({to: 'welcome#index'}) root is a method that takes a hash as an argument and is using the "implied hash" syntax.

end
