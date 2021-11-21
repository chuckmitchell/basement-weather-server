Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :readings

  resources :batches do
    resources :specific_gravities
  end

  root 'readings#index'
end
