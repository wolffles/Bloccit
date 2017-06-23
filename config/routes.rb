Rails.application.routes.draw do
 get 'welcome/index'

 get 'welcome/about'

 get 'welcome/contact'

 root 'welcome#index' #could be rewritten as root({to: 'welcome#index'}) root is a method that takes a hash as an argument and is using the "implied hash" syntax.

end
