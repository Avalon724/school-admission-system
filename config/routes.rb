Rails.application.routes.draw do
  #Root Path
  root to: "main#index"

  get "admin", to: "admin#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "section", to: "admin#index"
  get "section/edit", to: "admin#edit", as: :section_edit
  patch "section", to: "admin#update"
  get "section/:name", to: "admin#show", as: :section_show
  delete "section/:name", to: "admin#delete", as: :section_delete
  get "section_new", to: "admin#new"
  post "section_new", to: "admin#create"

  resources :students

  # resources :eligibles
  get "eligibles/:id/edit", to: "eligibles#edit", as: :edit_eligibles
  patch "eligibles/:id", to: "eligibles#update", as: :eligible
  get "eligibles/:section_id", to: "eligibles#new", as: :new_eligible
  post "eligibles/:section_id", to: "eligibles#create"
  delete "eligibles/:id", to: "eligibles#destroy", as: :delete_eligible

  delete "logout", to: "sessions#destroy"
end
