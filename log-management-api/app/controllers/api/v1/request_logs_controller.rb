module Api
  module V1
    class RequestLogsController < ApplicationController
      def index
        logs = Log.order('log_time DESC');
        render json: {status: 'SUCCESS', message: 'Loaded logs', data: logs}, status: :ok
      end

      def show
        log = Log.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded log', data: log}, status: :ok
      end
    end
  end
end
