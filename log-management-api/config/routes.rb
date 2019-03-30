Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :request_logs
      post ':send_logs' => 'send_logs#create'
    end
  end
end
