Rails.application.routes.draw do
  root "task_lists#index"

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  get "/about" => "abouts#about"

  # get "/task_lists/new" => "task_lists#new"
  # post "/task_lists" => "task_lists#create"
  # get "/task_lists/:id/edit", to: "task_lists#edit"
  # patch "/task_lists/:id", to: "task_lists#update"
  # put "/task_lists/:id", to: "task_lists#update", as: :task_list

  resources :task_lists do
    resources :tasks
  end

  # post "/tasks", to: "tasks#create"
end
