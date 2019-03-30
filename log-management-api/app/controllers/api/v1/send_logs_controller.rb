module Api
  module V1
    class SendLogsController < ApplicationController

      def create
        unprocessable_data = false
        @data = []
        params[:_json].each do |log|
            @log_time = "#{log.partition(" ").first}"
            @log_data = "#{log.partition(" ").last}"
            log = Log.new(:log_time => @log_time, :log_data => @log_data)
            if log.save
                @data.push({status: 'SUCCESS', message: 'Stored log', data: log})
            else
                unprocessable_data = true
                @data.push({status: 'ERROR', message: 'Log not stored', data: log})
            end
        end

        if unprocessable_data == true
            render json: @data.to_json, status: :unprocessable_entity
        else
            render json: @data.to_json, status: :ok
        end
      end

      #private

      #def log_params (log)
          #log.permit(:log_data, :log_time)
      #end

    end
  end
end
