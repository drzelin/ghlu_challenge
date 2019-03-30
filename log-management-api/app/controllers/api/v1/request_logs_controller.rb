require 'date'

module Api
  module V1

    class RequestLogsController < ApplicationController

      def index
        logs = Log.order('log_time DESC');
        json_response(logs)
      end

      def show
        begin
            start = DateTime.parse(params[:start]).iso8601(6)
            finish = DateTime.parse(params[:end]).iso8601(6)
            logs = Log.where('log_time BETWEEN ? AND ?', start, finish)
            json_response(logs)
        rescue ArgumentError
            json_response(params, :bad_request)
        end
      end

    end
  end
end
