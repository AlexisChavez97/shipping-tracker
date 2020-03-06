Rails.application.routes.draw do
  resource :trackers, only: :show
end
