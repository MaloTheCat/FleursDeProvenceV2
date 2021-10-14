Rails.application.routes.draw do
  root to: 'florists#home'

  resources :orders, only: [:show, :index, :new, :create]
  resources :compositions, only: [:show, :index]
  resources :contacts, only: [:new, :create] do
    get "/thanks" => "contacts#thanks"
  end
  resources :compositions, only: [:show] do
    resources :orders, only: [:show, :new, :create]
  end

  get 'evenement' => 'evenements#index'
  get 'contact' => 'contacts#new'
  get 'policy' => 'florists#policy'
  get 'cgv' => 'florists#cgv'

  # get 'order', to: 'orders#index'
  # get 'checkout' => "checkouts#show"
  # get 'billing' => "billing#show"
end

  # get ':id', to: 'florists#home', as: :florist

  # resource :florists, only: [:home, :composition, :evenement, :contact, :cgv] do
  # end
  # get 'composition' => 'florists#composition', as: :'florist_composition'
  # get 'evenement' => 'florists#evenement', as: :'florist_evenement'
  # get 'contact' => 'florists#contact', as: :'florist_contact'
