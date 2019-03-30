require 'date'

module Api
  module V1

    class RequestLogsController < ApplicationController

      def index
        logs = Log.order('log_time DESC');
        render json: {status: 'SUCCESS', message: 'Loaded logs', data: logs}, status: :ok
      end

      def show
        @start = DateTime.parse(params[:start]).iso8601(6)
        @end = DateTime.parse(params[:end]).iso8601(6)
        log = Log.where('log_time BETWEEN ? AND ?', @start, @end)
        render json: log 
      end

    end
  end
end
