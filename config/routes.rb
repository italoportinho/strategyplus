Rails.application.routes.draw do
  root to: 'newsletters#show'
  get ':date', to: 'newsletters#show', as: :newsletter_show
  post 'subscribe', to: 'application#subscribe', as: :subscribe

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
