## Examples

### Global Conditions
To represent global environment conditions use any environment condition object but without referencing a specific geographical area or location. 
Without the GeoReference the interpretation is that the condition applies everywhere.
Multiple global weather objects may exists with a few or more attributes updated. To calculate the resulting global conditions the merging rules of overlapping conditions applies.

### Region Referenced Conditions

### Entity Referenced Conditions

### Layered Conditions

### Overlapping Conditions
If EnvironmentConditions with overlapping regions/locations exist the following rules applies: 

* Wind Speed, Wind Direction, Precipitation Intensity, Temperature, Humidity, BarometricPressure, Snow Depth, Snow Density are calculated as the average in the overlapping EnvironmentConditions
* Visibility is calculated as the minimum visibility distance of the overlapping EnvironmentConditions.
* Conflicting precipitation types are resolved according to the following precedence: Snow, Hail, Rain, No Precipitation. E.g. If there is one overlapping Environment Condition with Snow the result is always Snow.
* For the same Haze type the average density should be used. Multipe overlapping EnvironmentConditions with different Haze type can exist.
* Moisture is calculated as the highest enumerated value making the resulting value the one with most moisture.
* LandSurface ice condition is calculated as the highest enumerated value making the resulting value the one with most severe ice condition.

### Data Distribution Management Services

### CIGI
