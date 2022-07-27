# Model documentation

All fields of schema will be preceded by the schema name, unless not practical.
Ex. User schema, password field = userPassword.

## User
### Basic user data - Multiple users on application, TODO created by user through interface 
```graphql
type User @model @auth(rules: [{allow: public}]) {
  id: ID!
  
  #Ex. (example@provider.com)
  userEmail: AWSEmail! 
  #UI display name
  userName: String!
  #For secure login
  userPassword: String!
  
  #Goal instances belonging to the user
  userGoals: [Goal] @hasMany(indexName: "byUser", fields: ["id"]) 
}
```


## Goal
### Basic goal data - Multiple goals per user, there should be 5 goals per day, one per category.
```graphql
type Goal @model @auth(rules: [{allow: public}]) {
  id: ID!
  userID: ID! @index(name: "byUser")
  
  #Time which activity contrubutions begin for the day (12AM for most) (Minus sleep, potentially need custom schema for sleep)
  goalStart: AWSDateTime!
  #Time which activity contrubutions begin for the day (11:59PM for most)
  goalEnd: AWSDateTime
  #Enumeration
  goalCategory: CategoryTypes!
  #Summation of respective Activity.activityDuration (TODO may be better as a service) 
  goalCurrentDuration: Duration!
  #User defined daily target for the respective category
  goalTargetDuration: Duration!
  #CurrentDuration divided by TargetDuration == (Rethought for non-duration categories, maybe make custom datatypes based on category
  goalPercentage: Float
  #Activity instances belonging to the day and category goal
  goalActivities: [Activity] @hasMany(indexName: "byGoal", fields: ["id"])
  #Bi-directionally enabling relationship attribute
  goalOfUser: User @belongsTo
}
```


## Activity
### Basic activity data - Multiple activities per goal and multiple metrics per activity. 
```graphql
type Activity @model @auth(rules: [{allow: public}]) {
  id: ID!
  goalID: ID! @index(name: "byGoal")
  
  #timestamp indicating start of activity
  activityStart: AWSDateTime!
  #timestamp indicating end of activity
  activityEnd: AWSDateTime!
  #Enumeration value
  activityCategory: CategoryTypes!
  #elapsed time of activity (assuming no small breaks in between, yet)
  activityDuration: Duration
  #Metric instances belonging to the activity
  activityMetrics: [Metric] @manyToMany(relationName: "MetricActivity")
  #Bi-directionally enabling relationship attribute
  activityOfGoal: Goal @belongsTo
}

```


## Metric
### Detailed storage for anayltics relating to activity, multiple actvities can belong to the same metric (if activities overlap timestamp)
```graphql
type Metric @model @auth(rules: [{allow: public}]) {
  id: ID!
  
  #Time the metric was sampled
  metricTimestamp: AWSDateTime!
  #A physcial metric pulled from mobile tracker
  metricLocation: String
  #A health metric pulled from wearable tracker
  metricHeartRate: Int
  
  #Activity instances belonging to the metric
  metricActivities: [Activity] @manyToMany(relationName: "MetricActivity")
}
```


## Custom Types (this should probably be modularized elsewhere)
### Facilitate storage and manipulation
```graphql
type Duration {
  durationSeconds: Int
  durationMinutes: Int
  durationHours: Int
}

enum CategoryTypes {
  FITNESS
  FUEL
  PRODUCTIVITY
  SOCIAL
  REST
}
```