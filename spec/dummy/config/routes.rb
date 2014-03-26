Rails.application.routes.draw do

  mount Redditor::Engine => "/redditor"

  resources :articles, only: [:show]

  namespace :admin do
    resources :articles
  end
end
