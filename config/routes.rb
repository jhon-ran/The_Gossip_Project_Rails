Rails.application.routes.draw do
  root 'home#gossip'
  
  get 'user/show'
  
  get 'home/gossip'
  
  get 'home/show_gossip', to: 'home#show_gossip'

  get 'welcome/:first_name', to: 'welcome#first_name'

  get '/team', to: 'static#team'

  get '/contact', to: 'static#contact'
  
  
end
