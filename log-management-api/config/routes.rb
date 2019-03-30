Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get ':request_logs' => 'request_logs#index'
      get ':request_logs/:start/:end' => 'request_logs#show'
      post ':send_logs' => 'send_logs#create'
    end
  end
end
