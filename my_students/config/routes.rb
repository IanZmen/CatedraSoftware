Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/students", to: "students#index"
  post "/students", to: "students#create"
  get "/students/:id", to: "students#show"
  patch "/students/:id", to: "students#update"
  delete "/students/:id", to: "students#destroy"
  get "/students/filter/:score", to: "students#filter"
end
