Rails.application.routes.draw do
  root to: 'florists#home'

  # get 'order', to: 'orders#show'
  resources :orders, only: [:show, :index, :new, :create]
  # get 'compositions', to: 'compositions#index'
  # get 'composition/:id', to: 'compositions#show'
  resources :compositions, only: [:show, :index]
  get 'evenement', to: 'evenements#index'
  get 'contact', to: 'contacts#new'
  resource :contacts, only: [:new, :create] do
    get "/thanks" => "contacts#thanks"
  end
  # get 'order', to: 'orders#index'
  get 'policy' => 'florists#policy'
  get 'cgv' => 'florists#cgv'
end

  # get ':id', to: 'florists#home', as: :florist

  # resource :florists, only: [:home, :composition, :evenement, :contact, :cgv] do
  # end
  # get 'composition' => 'florists#composition', as: :'florist_composition'
  # get 'evenement' => 'florists#evenement', as: :'florist_evenement'
  # get 'contact' => 'florists#contact', as: :'florist_contact'
