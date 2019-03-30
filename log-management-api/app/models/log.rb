class Log < ApplicationRecord
  validates :log_data, presence: true
  validates :log_time, presence: true
end
