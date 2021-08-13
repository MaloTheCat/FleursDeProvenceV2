Rails.application.routes.draw do
  root to: 'florists#home'
  get 'florists/:id', to: 'florists#home', as: :florist
end
