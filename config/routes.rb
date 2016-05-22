DigestGem::Engine.routes.draw do

  resources :additional_product_infos
  resources :books
  resources :related_contents
  resources :tools
  resources :trip_curves
  resources :settings
  resources :search
  resources :supplemental_digest
  root :to => 'books#index'
end
