Rails.application.routes.draw do

  get "user_menus/index"

  mount Reportx::Engine => "/reportx"
end
