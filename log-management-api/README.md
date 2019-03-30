# README

# Log Management API

The Log Management API is built using Ruby on Rails. The point of the project is to provide two endpoints -- send_logs and request_logs. 

## Project Architecture

The user can use the send_logs endpoint to send one or more log messages in the format:
```
        <timestamp> <log data>
        <timestamp> <log data>
        ...
```

The use can use the request_logs endpoint to request logs with a timestamp between a given range in the format:

```
    /request_logs?start=<start date and optional time>&end=<end date and optional time>
```

The start and end dates in the GET request should be in the format 'MM/DD/YYYYTHR:MN:SC'


There is one model in this project, the Logs model that contains a log date and a log message that gets stored in a mysql database. Both of the endpoings (SendLogs and RequestLogs) rely on date described by the Logs model.

## Setup

### Versions:
* Ruby Version 2.6.2
* Rails Version 6.0.0.beta3

### Getting started:
```
    cd log-management-api
    bundle install
    brew services start mysql
    mysql_secure_installation
        # set password to 'mysqlpassword'
    rake db:create
    rails db:migrate
    rals db:seed # optional fake data
    rails server
```

## Completed

* Make a POST request to the 'send_logs' endpoint for one or more log messages
* Make a GET request to the 'request_logs' endpoint with a start and receive any log messages with a timestamp within provided range

## Known Bugs
* Start and end timestamp sometimes are not interpretted correctly
* Allow for log messages with up to 9 digits after seconds, however, mysql database only stores up to 2 digits

## Future Work
* Build test suite to ensure log timestamp falls within user range
* Account for time zones
* Allow user to request logs based on other parameters such as ids, text within the log messages, etc
