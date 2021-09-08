Rails.application.routes.draw do

  resources :batches do
    resources :specific_gravities
  end

  resources :readings


  root 'readings#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
