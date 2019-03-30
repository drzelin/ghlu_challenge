require 'date'

module Api
  module V1

    class RequestLogsController < ApplicationController

      def index
        logs = Log.order('log_time DESC');
        render json: {status: 'SUCCESS', message: 'Loaded logs', data: logs}, status: :ok
      end

      def show
        begin
            start = DateTime.parse(params[:start]).iso8601(6)
            finish = DateTime.parse(params[:end]).iso8601(6)
            logs = Log.where('log_time BETWEEN ? AND ?', start, finish)
            render json: {status: 'SUCCESS', message: 'Loaded logs', data: logs}, status: :ok
        rescue ArgumentError
            render json: {status: 'ERROR', message: 'Did not load logs', data: params}, status: :bad_request
        end
      end

    end
  end
end
