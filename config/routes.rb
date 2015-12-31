Rails.application.routes.draw do
  resources :trades, only: [:create] do
    collection do
      get :last_tid
    end
  end

  post 'auth' => 'application#auth'
  root 'application#root'
end
