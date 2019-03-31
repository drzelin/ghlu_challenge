require 'rails_helper'

RSpec.describe Api::V1::RequestLogsController do
    describe 'GET #index' do
        before do
            get :index
        end

        it 'returns a status message' do
            expect(response).to have_http_status(:success)
        end
    end
end
