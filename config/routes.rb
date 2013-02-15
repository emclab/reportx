Reportx::Engine.routes.draw do

  resources :report_types
  resources :report_templates do
    resources :template_appendixes
    resources :template_contents
    resources :template_forewords
    member do
      get :update_appendix_content
      put :update_appendix_content_result
      get :update_foreword_content
      put :update_foreword_content_result
      get :update_template_content
      put :update_template_content_result
    end
  end
end
