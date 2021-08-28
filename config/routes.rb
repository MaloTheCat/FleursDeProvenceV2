Rails.application.routes.draw do
  root to: 'florists#home'
  # get ':id', to: 'florists#home', as: :florist

  # resource :florists, only: [:home, :composition, :evenement, :contact, :cgv] do
  # end

  # get ':id', to: 'contacts#new'
  get 'order', to: 'orders#show'
  get 'composition', to: 'compositions#index'
  get 'evenement', to: 'evenements#index'
  get 'contact', to: 'contacts#new'
    resource :contacts, only: [:new, :create] do
      get "/thanks" => "contacts#thanks"
    end

  # get 'composition' => 'florists#composition', as: :'florist_composition'
  # get 'evenement' => 'florists#evenement', as: :'florist_evenement'
  # get 'contact' => 'florists#contact', as: :'florist_contact'
  # get 'cgv' => 'florists#cgv', as: :'florist_cgv'

end
