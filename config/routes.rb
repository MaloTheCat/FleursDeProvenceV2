Rails.application.routes.draw do
  root to: 'florists#home'

  resources :contacts, only: [:new, :create]
  get "/thanks" => "contacts#thanks"

  resources :compositions, only: [:show, :index] do
    # resources :orders, only: [:show, :new, :create, :index]
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  get "/thanks_purchase" => "orders#thanksPurchase"
  get "/checkout" => "orders#checkout" #, :defaults => { :format => 'json' }

  get 'evenement' => 'evenements#index'
  get 'policy' => 'florists#policy'
  get 'cgv' => 'florists#cgv'
  get 'fidelity' => 'florists#fidelity'

  # get 'order', to: 'orders#index'
  # get 'checkout' => "checkouts#show"
  # get 'billing' => "billing#show"
end
