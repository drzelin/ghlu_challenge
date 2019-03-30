# README

# Problem Specifications

* Build a simple API in Ruby on Rails capable of storing and retrieving log data. 
* The app should have two endpoints, 
    * one that accepts and stores one or more lines of log data
    * one that retrieves log lines between a given start and end time. 

* Logs sent to the app will be in the format:

```
    <timestamp> <log data>
```

For example:

```
    2016-02-11T23:05:03.803616+00:00 heroku[router]: at=info method=POST path="/v1/posts" host=api.example.com request_id=12345 dyno=web.1 connect=0ms service=100ms status=200 bytes=358

```

# Log Management API

The Log Management API is built using Ruby on Rails. The point of the project is to provide two endpoints -- send_logs and request_logs. 

The Log Management API uses a mysql database to store the log timestamp and log data.

There is one model in this project, the Logs model that contains a log date and a log message that gets stored in a mysql database. Both of the endpoings (SendLogs and RequestLogs) rely on date described by the Logs model.

There are two controllers for manging the logs. The first, SendLogsController, handles iterating through the log messages from the body of the POST request, verifying that the first string on every line is a timestampe, and stores the data in the logs database. The second, RequestLogsController, either retrieves all of the logs if no range is provided, or retrieves all logs within a range if both the start and end timestamp are provided in the GET request.

## API Specfications 

### METHODS
#### Viewing all the log messages
```
    GET /api/v1/request_logs
```
Returns a JSON object containing all of the logs in stored in the mysql database logs table.


#### Viewing log messages within a given range
```
    GET /api/v1/request_logs/<start date and optional time>/<end date and optional time>
```
Returns the logs with a timestamp between a given range. The start and end dates in the GET request require at least a year, month, and day in the formation YYYY-MM-DD. GET requests sent to the app must be in the format: 

Example:
```
    http://localhost:3000/api/v1/request_logs/2018-2-1T05:00/2019-3-2
```
This GET request is requesting all logs between February 1, 2018 at 5 am and March 2, 2019.

#### Storing log messages
```
    POST /api/v1/send_logs
```

Body in format:
```
    <timestamp> <log data>
    <timestamp> <log data>
    ...
```
The user can use the send_logs endpoint to send one or more log messages in the format:


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

## Design Decisions

* If a subset of the log messages provided in a POST request is invalid (does not start with a timestamp), the rest of the log messages will be stored, but the response status will be :bad_request. In the response message, the information about which log messages are invalid is provided.
* An example of a single POST request was provided in the specs; however, not for multiple. The format for multiple log messages is described in the 'Storing log messages' section of this README
* The user is also allowed to request all of the logs, which was not specified in the problem specifications.
* The method in which the user inputs the range was not described in the specifications. The chosen method is described in the 'Viewing log messages within a given range' section of this README.
* The format of the timetamps was not specified in the specifications. Because the specification example had 6 digits following the seconds, the rest of the applications follows that format.

## Known Bugs
* Start and end timestamp sometimes are not interpretted correctly
* Allow for log messages with up to 9 digits after seconds, however, mysql database only stores up to 2 digits

## Future Work
* Build test suite to ensure log timestamp falls within user range
* Allow user to request logs based on other parameters such as ids, text within the log messages, etc.
