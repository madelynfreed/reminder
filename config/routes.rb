Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/reminders/pending' => 'reminders#pending'
  resources :reminders do
    collection do
      post '/:id/acknowledge' => 'reminders#acknowledge'
    end
  end

  root 'welcome#index'
end
