Rails.application.routes.draw do
  resources :posts
  get 'test_request' => 'posts#test', as: 'test_request'
  get 'get_churn' => 'posts#get_churn', as: 'get_churn'
  get 'get_scroll_history' => 'posts#get_scroll_history', as: 'get_scroll_history'
  get 'scroll_histories' => 'posts#scroll_histories', as: 'scroll_histories'
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
