# Model documentation

All fields of schema will be preceded by the schema name, unless not practical.
Ex. User schema, password field = userPassword.

## User
```
'''
Multiple users on application, TODO created by user through interface 
userEmail: ==Example (example@provider.com)==
userGoals: == Goal instances belonging to the user == 
userName: ==UI display name==
userPassword: ==For secure login==
'''
type User @model @auth(rules: [{allow: public}]) {
  id: ID! 
  userEmail: AWSURL! 
  userGoals: [Goal] @hasMany(indexName: "byUser", fields: ["id"]) 
  userName: String!
  userPassword: String!
}

'''
Multiple goals per user, there should be 5 goals per day, one per category.
goalStart: ==Time which activity contrubutions begin for the day (12AM for most) == (Minus sleep, potentially need custom schema for sleep)
goalEnd: ==Time which activity contrubutions begin for the day (11:59PM for most) ==
goalCategory: == (TODO enum?): fitness, productivity, fuel, social, rest ==
goalCurrentDuration: == Summation of respective Activity.activityDuration == (TODO may be better as a service) 
goalTargetDuration: == User defined daily target for the respective category ==
goalPercentage:== CurrentDuration divided by TargetDuration == (Rethought for non-duration categories, maybe make custom datatypes based on category)
goalActivities: == Activity instances belonging to the day and category goal == 
'''
type Goal @model @auth(rules: [{allow: public}]) {
  id: ID!
  goalStart: AWSDateTime!
  goalEnd: AWSDateTime!
  goalCategory: String!
  goalCurrentDuration: Duration!
  goalTargetDuration: Duration!
  goalPercentage: Float
  goalActivities: [Activity] @hasMany(indexName: "byGoal", fields: ["id"])
  userID: ID! @index(name: "byUser")
}

'''
activityStart: == timestamp indicating start of activity ==
activityStart: == timestamp indicating end of activity ==
activityCategory: == (TODO enum?): fitness, productivity, fuel, social, rest ==
activityDuration: == elapsed time of activity (assuming no small breaks in between, yet) ==
activityMetrics: == Metric instances belonging to the activity ==

'''
type Activity @model @auth(rules: [{allow: public}]) {
  id: ID!
  activityStart: AWSDateTime!
  activityEnd: AWSDateTime!
  activtyCategory: String!
  activityDuration: Duration
  goalID: ID! @index(name: "byGoal")
  activityMetrics: [Metric] @manyToMany(relationName: "MetricActivity")
}

'''
timestamp: == Time the metric was sampled ==
activities: == Activity instances belonging to the metric ==
heartrate: == A health metric pulled from wearable tracker ==
location: == A physcial metric pulled from mobile tracker ==
'''
type Metric @model @auth(rules: [{allow: public}]) {
  id: ID!
  timestamp: AWSDateTime!
  activities: [Activity] @manyToMany(relationName: "MetricActivity")
  heartRate: Int
  location: String
}
'''
A custom datatype to facilitate data storage and manipulation
'''
type Duration {
  durationSeconds: Int
  durationMinutes: Int
  durationHours: Int
}
```
