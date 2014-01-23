## Church Metrics Ruby

#### A ruby wrapper for the [Lifechurch.tv Church Metrics API](https://github.com/lifechurch/churchmetrics-api)

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

#### Examples:

    ChurchMetrics::Records.new.all

    ChurchMetrics::Users.new.find(id)


... more to come

