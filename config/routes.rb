Rails.application.routes.draw do

  devise_for :users
  root to: redirect("/users/sign_in")

  namespace :santa do
    resources :events
  end

end
