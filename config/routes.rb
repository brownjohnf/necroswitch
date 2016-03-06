Rails.application.routes.draw do
  constraints(key: /[a-z0-9\-]+/) do
    resources :api_keys, only: [:create, :show, :destroy]
  end

  constraints(uuid: /[a-z0-9\-]+/) do
    resources :switches, param: :uuid, only: [:index, :show, :create, :update, :destroy] do
      resources :events, only: [:index, :show, :create]
    end
  end

  root "switches#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

