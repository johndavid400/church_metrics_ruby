# Church Metrics Ruby

### A ruby wrapper for the [Lifechurch.tv Church Metrics API](https://github.com/lifechurch/churchmetrics-api)

This wrapper creates Ruby methods for the Church Metrics API, holding to the naming of the original API methods.

#### All methods are namespaced under ChurchMetrics::

#### List of Resources available:

* Campuses
* Categories
* Churches
* Events
* Projections
* Records
* Regions
* ServiceTimes
* Users

All resources (except Churches) have the "all" and "find" methods available:

## Examples:

    ChurchMetrics::Records.new.all

    ChurchMetrics::Users.new.find(id)

#### The churches resource has 2 methods: info and weekly_totals

To get information about your church:

    ChurchMetrics::Churches.new.info

To get weekly totals data for a given cateogry:

    ChurchMetrics::Churches.new.weekly_totals(category_id, week={})

## Setup

#### Add to your project:

First, add to your Gemfile:

    gem 'church_metrics', :github => "johndavid400/church_metrics_ruby"

Then bundle

    bundle

#### Setup API user and key

Next, add your Lifechurch.tv Church Metrics API user and key to your .bashrc script:

    vim ~/.bashrc

Add to the top of the file:

    export CHURCH_METRICS_USER="your_api_user_email_here"
    export CHURCH_METRICS_KEY="your_api_key_here"

Alternatively, you can add an initializer file to your Rails app to set these variables:

    vim config/initializers/church_metrics.rb

Add the following:

    Rails.configuration.church_metrics_user = "your_api_user_email_here"
    Rails.configuration.church_metrics_api_key = "your_api_key_here"

The gem will look to your .bashrc first, then to the Rails config variables - either will work.

#### Test

Start a rails console:

    rails c

Verify api key:

    api = ChurchMetrics::API.new.key

    api.key # should return your API key

Make a test call:

    ChurchMetrics::Records.new.all # should return a list of all records (paginated)


