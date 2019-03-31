require 'date'

5.times do
  Log.create({
    log_data: Faker::Lorem.sentence,
    log_time: DateTime.parse(Faker::Date.between(5.year.ago, 4.years.ago).to_s).iso8601(6)
  })
end

4.times do
  Log.create({
    log_data: Faker::Lorem.sentence,
    log_time: DateTime.parse(Faker::Date.between(4.year.ago, 3.years.ago).to_s).iso8601(6)
  })
end

3.times do
  Log.create({
    log_data: Faker::Lorem.sentence,
    log_time: DateTime.parse(Faker::Date.between(3.year.ago, 2.years.ago).to_s).iso8601(6)
  })
end

2.times do
  Log.create({
    log_data: Faker::Lorem.sentence,
    log_time: DateTime.parse(Faker::Date.between(2.year.ago, 1.years.ago).to_s).iso8601(6)
  })
end

1.times do
  Log.create({
    log_data: Faker::Lorem.sentence,
    log_time: DateTime.parse(Faker::Date.between(1.year.ago, Time.now).to_s).iso8601(6)
  }) 
end
