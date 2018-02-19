Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "visualizations/:id", to: "application#visualization"
  root "application#index"
end
