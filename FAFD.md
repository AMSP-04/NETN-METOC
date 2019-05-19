## Examples

### Global Weather
To represent global weather without reference to a specific geographical area or location can 

, if no such reference is provided the weather condition is assumed to be global.

### Overlapping Conditions
If EnvironmentConditions with overlapping regions/locations exist the following rules applies: 

* Wind Speed, Wind Direction, Precipitation Intensity, Temperature, Humidity, BarometricPressure are calculated as the average in the overlapping EnvironmentConditions
* Visibility is calculated as the minimum visibility distance of the overlapping EnvironmentConditions.
* Conflicting precipitation types are resolved according to the following precedence: Snow, Hail, Rain, No Precipitation. E.g. If there is one overlapping Environment Condition with Snow the result is always Snow.
* For the same Haze type the average density should be used. Multipe overlapping EnvironmentConditions with different Haze type can exist.

