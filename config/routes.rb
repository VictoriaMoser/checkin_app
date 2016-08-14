Rails.application.routes.draw do
  
  root 'user#home'

  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destroy'
  get 'timeout', to: 'session#timeout'

  get 'checkin_frontdesk', to: 'user#checkin_frontdesk'

  get 'checkin_success', to: 'user#checkin_success'

  get 'home', to: 'user#home'

  get 'index', to: 'user#index'#, as: 'login'

  get 'payment', to: 'user#payment'

  get 'personal_form', to: 'user#personal_form'

  get 'update_insurance', to: 'user#update_insurance'

  get 'update_personal', to: 'user#update_personal'

  get 'upload_doc', to: 'user#upload_doc'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
