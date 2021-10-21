Rails.application.routes.draw do
  root to: 'florists#home'

  # resources :orders, only: [:show, :index, :new, :create]
  # resources :compositions, only: [:show, :index]

  resources :contacts, only: [:new, :create]
  get "/thanks" => "contacts#thanks"

  resources :compositions, only: [:show, :index] do
    resources :orders, only: [:show, :new, :create, :index]
  end

  # get "/order_thanks" => "orders#thanks"
  get "/thanks_purchase" => "orders#thanks"

  #works with <%#= link_to new_order_path(composition) do %> in INDEX COMPOSITION VIEW
  # scope "/compositions" do
  #   resources :orders, only: [:show, :new, :create, :index]
  # end

  get 'evenement' => 'evenements#index'
  get 'policy' => 'florists#policy'
  get 'cgv' => 'florists#cgv'
  get 'fidelity' => 'florists#fidelity'

  # get 'order', to: 'orders#index'
  # get 'checkout' => "checkouts#show"
  # get 'billing' => "billing#show"
end
