Rails.application.routes.draw do

 root to: 'tests#index'

 resources :tests

 resources :questions

 resources :tests do
   resources :questions, shallow: true
 end

 get '/show_question/:id', to: 'questions#show_question'

# post '/questions/new/:id', to: 'questions#new'

# get '/tests/:category/:title', to: 'tests#search', level: 2

 resources :questions do
   member do
     post :new
   end
 end
end
