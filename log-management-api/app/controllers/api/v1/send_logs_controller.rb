require 'date'

module Api
  module V1
    class SendLogsController < ApplicationController

      def create
        Rails.logger.debug("#{request.raw_post}")
        unprocessable_data = false
        @data = []
        request.raw_post.each_line do |log|
            begin
                @log_time = DateTime.parse("#{log.partition(" ").first}").iso8601(9)
            rescue ArgumentError
                @data.push({status: 'ERROR', message: 'Valid date must be provided', data: log})
                next
            end

            @log_data = "#{log.partition(" ").last}"
            log = Log.new(:log_time => @log_time, :log_data => @log_data)
            if log.save
                @data.push({status: 'SUCCESS', message: 'Stored log data and time', data: log})
            else
                unprocessable_data = true
                @data.push({status: 'ERROR', message: 'Log data and time not stored', data: log})
            end
        end

        if unprocessable_data == true
            render json: @data.to_json, status: :unprocessable_entity
        else
            render json: @data.to_json, status: :ok
        end
      end
    end
  end
end
