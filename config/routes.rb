Rails.application.routes.draw do
  root to: 'florists#home'
  get 'florists/:id', to: 'florists#home', as: :florist
  # get 'florists/:id', to: 'florists#home'

  get 'florists/:id/composition' => 'florists#composition', as: :'florist_composition'
  get 'florists/:id/evenement' => 'florists#evenement', as: :'florist_evenement'
  get 'florists/:id/contact' => 'florists#contact', as: :'florist_contact'
  get 'florists/:id/cgv' => 'florists#cgv', as: :'florist_cgv'
end
