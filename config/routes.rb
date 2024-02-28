Rails.application.routes.draw do

  resources :badges
  root to: 'tests#index'

  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    post 'gist', to: "gists#create", on: :member
    get 'gist', to: "gists#create", on: :member
  end

  namespace :admin do
    get 'gists', to: "gists#index"
    resources :tests do
        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index
        end
      end

      resources :badges
    end
  end
