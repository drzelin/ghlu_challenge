require 'date'

module Api
  module V1
    class SendLogsController < ApplicationController

      def create
        @return_status = :ok 
        @data = []
        request.raw_post.each_line do |log|

            # Extracts the timestamp from the message, and converts it into the iso8601 format
            begin
                @log_time = DateTime.parse("#{log.partition(" ").first}").iso8601(6)
            rescue ArgumentError
                @return_status = :bad_request
                @data.push({message: 'Valid date and time must be provided', data: log})
                next
            end

            @log_data = "#{log.partition(" ").last}"

            # Stores the timestamp and log data using the Log model
            log = Log.new(:log_time => @log_time, :log_data => @log_data)
            if log.save
                @data.push({message: 'Stored log data and time', data: log})
            else
                @return_status = :bad_request
                @data.push({message: 'Log data and time not stored', data: log})
            end
        end

        json_response(@data, @return_status)
      end
    end
  end
end
