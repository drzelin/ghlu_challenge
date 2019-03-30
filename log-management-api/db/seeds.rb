5.times do
  Log.create({
    log_data: "heroku[router]: at=info method=POST path=\"/v1/posts\" host=api.example.com request_id=12345 dyno=web.1 connect=0ms service=100ms status=200 bytes=358",
    log_time: "2016-02-11T23:05:03.803616+00:00"
    #
    # TODO: use Faker
    #log_data: Faker::Lorem.sentence 
    #log_time: Faker::Time.between(2.days.ago, Time.now, :all)       #=> "2014-09-19 07:03:30 -0700"

  })
end
