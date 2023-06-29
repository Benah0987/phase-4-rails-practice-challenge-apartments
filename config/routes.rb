Rails.application.routes.draw do
  resources :apartments, except: [:new, :edit] do
    resources :tenants, only: [:index, :create]
    resources :leases, only: [:index, :create]
  end

  resources :tenants, except: [:new, :edit] do
    resources :leases, only: [:index]
  end

  resources :leases, only: [:destroy, :show, :update]

  # Additional custom routes if needed

end
