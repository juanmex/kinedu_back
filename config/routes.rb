Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :assistants
    resources :activities
    resources :babies do
      resources :activity_logs, :only => [:index]
    end

    post "activity_logs", to: "activity_logs#create", as: "create_activity_log"
    put "activity_logs/:id", to: "activity_logs#update", as: "update_activity_log"
    get "activity_logs/:id", to: "activity_logs#show", as: "show_activity_log"
  end
end
