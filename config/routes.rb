# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :seasons do
    get :events, on: :member
    get :staff, on: :member
    resources :vouchers
    resources :squads
  end
  resources :events do
    get :members, on: :member
  end

  resources :users do
    get :profile, on: :member
    post :join_to_event, on: :member
    delete :leave_event, on: :member

    resources :profile
    resources :wishes
  end

  namespace :admin do
    resources :users do
      get :import, on: :collection
      put :op_user, on: :member
      put :deop_user, on: :member
      post :import_from_file, on: :collection
      post :join_to_event, on: :member
      delete :leave_event, on: :member
    end

    resources :seasons do
      # resources :events, only: [:index]

      get :events, on: :member
      get :event_list, on: :member
      get :staff, on: :member
      get :adult_list, on: :member
      put :open_chat, on: :member
      put :close_chat, on: :member
      post :add_event, on: :member
      put :start_season, on: :member
      delete :delete_event, on: :member

      resources :vouchers do
        get :import, on: :collection
        post :import_from_file, on: :collection
      end
      resources :contracts do
        post :accept, on: :member
        delete :delete_employee, on: :member
      end
      resources :comments
      resources :attachments, only: %i[index new create]
    end

    resources :events do
      get :members, on: :member
      delete :kick_user, on: :member
    end
  end

  root 'welcome#index'
end
