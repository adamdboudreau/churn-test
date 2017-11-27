Rails.application.routes.draw do
  resources :posts
  get 'test_request' => 'posts#test', as: 'test_request'
  get 'get_churn' => 'posts#get_churn', as: 'get_churn'
  get 'get_scroll_history' => 'posts#get_scroll_history', as: 'get_scroll_history'
  get 'scroll_histories' => 'posts#scroll_histories', as: 'scroll_histories'
  get 'test_content_api' => 'posts#test_content_api', as: 'test_content_api'
  post 'test_content_api_call' => 'posts#test_content_api_call', as: 'test_content_api_call'

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
