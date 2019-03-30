require 'test_helper'

class LogTest < ActiveSupport::TestCase
    def setup
        @log = logs(:valid)
    end

    test 'valid log' do
        assert @log.valid?
    end

    test 'invalid without log_time' do
        @log.log_time = nil
        refute @log.valid?, 'saved log without a timestamp'
        assert_not_nil @log.errors[:log_time], 'no validation error for log_time present'
    end

    test 'invalid without log_data' do
        @log.log_data = nil
        refute @log.valid?, 'log is valid without data'
        assert_not_nil @log.errors[:log_data], 'no validation error for log_data present'
    end
end
