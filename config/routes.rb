Rails.application.routes.draw do
  root to: 'florists#home'

  resources :contacts, only: [:new, :create]
  get "/thanks" => "contacts#thanks"

  resources :compositions, only: [:show, :index]

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  resources :webhooks, only: [:create]

  # post "orders/create", to: "orders#create"#, :defaults => { format: 'json' }

  get "/thanks_purchase" => "orders#thanksPurchase"
  get "/fails_purchase" => "orders#failsPurchase"
  get "/checkout" => "orders#checkout" #, :defaults => { :format => 'json' }

  get 'evenement' => 'evenements#index'
  get 'policy' => 'florists#policy'
  get 'cgv' => 'florists#cgv'
  get 'fidelity' => 'florists#fidelity'
end
