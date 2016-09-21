# Web Analysis App

Ruby on Rails & AngularJS application which works with dataset of page views for different URL's.

It displays two statistic reports:

1. Number of page views per URL, grouped by day, for the past 5 days;
2. Top 5 referrers for the top 10 URLs grouped by day, for the past 5 days.

Application uses RoR only to provide REST API. AngularJS client is independent and served by Gulp.

## Installation Instructions

To run a REST API server you need Rails and MySQL installed.

*/client* folder contains Angular client. To run it you'll need Npm and Bower installed.
```
bundle install
rails db:setup
/cd client
npm install
bower install
```

Run application from */client* folder using
```
gulp serve:full-stack
```
or alternatively
```
rails server
gulp serve
```

Application will be running on http://localhost:3001.
