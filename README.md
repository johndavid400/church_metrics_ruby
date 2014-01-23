# Church Metrics Ruby

### A ruby wrapper for the [Lifechurch.tv Church Metrics API](https://github.com/lifechurch/churchmetrics-api)

The original API uses curl to get the requests. This gem allows you to use Ruby to make the calls from your app.

## Setup

### Add to your project:

First, add to your Gemfile:

    gem 'church_metrics', :github => "johndavid400/church_metrics_ruby"

Then bundle

    bundle

### Setup API user and key

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

#### Verify that it works

Start a rails console:

    rails c

Verify api key:

    api = ChurchMetrics::API.new.key

    api.key # should return your API key

Make a test call:

    ChurchMetrics::Records.new.all # should return a list of all records (paginated)

## Usage

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

#### *all* and *find* are universal methods

All resources (except Churches) have the "all" and "find" methods available:

The *all* method will return a paginated list of all instances of a resource. This result is paginated (default = 30 results), and you can specify the page number you want to view as well as the number of results per page. See the examples below.

The *find* method requires the ID of the resource you are looking for.

### Examples:

    ChurchMetrics::ServiceTimes.new.all

    ChurchMetrics::Records.new.all

    ChurchMetrics::Records.new.all(:page => 2, :per_page => 100)

    ChurchMetrics::Users.new.find(id)

    ChurchMetrics::Events.new.find(id)


#### The churches resource has 2 methods: info and weekly_totals

To get information about your church:

    ChurchMetrics::Churches.new.info

To get weekly totals data for a given category:

    ChurchMetrics::Churches.new.weekly_totals(category_id, week={})

#### Additionally, the campuses resource has a weekly_totals method

    ChurchMetrics::Campuses.new.weekly_totals(category_id, week={})


### ...more to come
