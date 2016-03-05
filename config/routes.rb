Rails.application.routes.draw do
  constraints(uuid: /[a-z0-9\-]+/) do
    resources :switches, param: :uuid, only: [:show, :create, :update, :destroy] do
      resources :events, only: [:index, :show, :create]
    end
  end

  root "switches#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

