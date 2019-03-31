module Api
    module V1
        class RequestLogsControllerTest < ActionDispatch::IntegrationTest
            test "gets all log posts" do
                get "/api/v1/request_logs"
                assert_response :success
            end
        end
    end
end
