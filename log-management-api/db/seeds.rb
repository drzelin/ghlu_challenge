require 'date'

5.times do
  Log.create({
    log_data: Faker::Lorem.sentence,
    log_time: DateTime.parse(Faker::Date.between(5.year.ago, Time.now).to_s).iso8601(9)
  )
end
