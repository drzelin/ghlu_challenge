module Api
    module V1
        class RequestLogsControllerTest < ActionDispatch::IntegrationTest
            test "gets all log posts" do
                get api_v1_request_logs_url
                assert_response :success
            end
        end
    end
end
