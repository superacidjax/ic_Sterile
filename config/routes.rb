Icouch::Application.routes.draw do

  root to: 'dashboards#show'

  devise_for :accounts

  get 'client_dashboard', to: 'dashboards/clients#show', as: 'client_dashboard'
  get 'counselor_dashboard', to: 'dashboards/counselors#show', as: 'counselor_dashboard'
  get 'admin_dashboard', to: 'dashboards/admin#show', as: 'admin_dashboard'
  #get ':id', to: 'counselors#show', as: :slug, constraints: {id: /\d+/}

  resources :counseling_sessions do
    collection do
      get :cancel
      post :schedule
    end
  end

  resources :payment_notifications do
    member do
      post :receive_ipn
    end
    collection do
      get :thank_you
      get :cancel
    end
  end

  namespace :client do
    resource :account do
      resource :additional_information
      resources :counselors, only: :index
      resource :personal_information
      resources :purchases
    end
  end

  resources :counselors, only: [:index, :show] do
    collection do
      get :search
    end
  end

  namespace :counselor do
    resources :clients, only: [:index, :show]
    resource :account do
      resource :professional_information, controller: 'accounts/professional_information'
      resource :session_preference do
        put :update_schedule
      end
      get :join_thanks
    end
  end

  namespace :admin do
    match 'ui(/:action)', controller: 'ui'
    resource :password, except: [:index, :new, :show, :destroy], controller: 'password'
    resources :counselors, :clients, only: [:index, :show, :update, :edit] do
      member do
        get :notes
        delete :reject
        put :approve
        put :deactivate
        put :reactivate
      end
    end
  end

  match '/depression', to: "pages#depression", as: :depression
  match '/anxiety', to: "pages#anxiety", as: :anxiety
  match '/stress', to: "pages#stress", as: :stress
  match 'my_counselors', to: "counselors#my_counselors", as: :my_counselors
  match '/privacy_policy', to: 'pages#privacy_policy', as: :privacy_policy
  match '/terms_of_service', to: 'pages#terms_of_service', as: :terms_of_service
  match '/faqs', to: 'pages#faqs', as: :faqs
  match 'uploads/*path', to: 'uploads#show'
  match '/about_online_counseling', to: 'pages#about_online_counseling', as: :about_online_counseling
  match '/about_us', to: 'pages#about_us', as: :about_us
  match '/client_terms_of_service', to: 'pages#client_terms_of_service', as: :client_terms_of_service
  match '/contact', to: 'pages#contact', as: :contact
  match '/how_does_therapy_work', to: 'pages#how_does_therapy_work', as: :how_does_therapy_work
  match '/ethical_code', to: 'pages#ethical_code', as: :ethical_code
  match '/the_lounge', to: 'pages#the_lounge', as: :the_lounge
  match '/therapy_styles', to: 'pages#therapy_styles', as: :therapy_styles
  match '/counselor_info', to: 'pages#counselor_info', as: :counselor_info
  match '/counselor_lounge', to: 'pages#counselor_lounge', as: :counselor_lounge
  match '/counselor_first_steps', to: 'pages#counselor_first_steps', as: :counselor_first_steps
  match 'about_icouch_security', to: 'pages#about_icouch_security', as: :about_icouch_security
  match 'about_icouch_therapists', to: 'pages#about_icouch_therapists', as: :about_icouch_therapists
  match 'how_icouch_works', to: 'pages#how_icouch_works', as: :how_icouch_works
  match 'meet_the_petersons', to: 'pages#meet_the_petersons', as: :meet_the_petersons
  match 'meet_emma', to: 'pages#meet_emma', as: :meet_emma
  match 'meet_enrico_and_julie', to: 'pages#meet_enrico_and_julie', as: :meet_enrico_and_julie
  match 'meet_martin', to: 'pages#meet_martin', as: :meet_martin
  match "sitemap_index.xml.gz", :controller => "sitemap", :action => "index"
  match 'heartbeat', to: proc { [200, {}, ''.chars] }

end
