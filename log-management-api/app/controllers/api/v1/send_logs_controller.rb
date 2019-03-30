module Api
  module V1
    class SendLogsController < ApplicationController

      def create 
        log = Log.new(log_params)
        if log.save
          render json: {status: 'SUCCESS', message: 'Stored log', data: log}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Could not store log', data: log.errors}, status: :unprocessable_entity
        end
      end

      private

      def log_params
        params.permit(:log_data, :log_time)
      end

    end
  end
end
