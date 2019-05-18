
## Object Classes
	
### METOC_EnvironmentCondition

Superclass for Environment Conditions and Layers. The conditions can be global in which case no RegionReference is provided or regional in which case a reference to a GeometryFeature published in the federation is required.

|Attribute Name|Datatype|Semantics|
|---|---|---|
|GeoReference|GeoReferenceVariant|Optional: If not provided the environment condition is global.| 
|Temperature|TemperatureDegreeCelsiusFloat32|| 

### WeatherCondition

If overlapping Atmospheric Conditions exists the following merging rules allies: 
Humidity, AirTemperature and BarometricPressure is calculated as the average of the overlapping conditions. 
Visibility is calculated as the minimum visibility distance of the overlapping conditions.

|Attribute Name|Datatype|Semantics|
|---|---|---|
|Wind|WindStruct|| 
|Precipitation|PrecipitationStruct|Required: No Precipitation, Rain, Snow or Hail| 
|Haze|HazeStruct|Smoke, Fog, etc.| 
|Humidity|PercentFloat32|Required: Normal value = 0,75| 
|BarometricPressure|AtmosphericPressureFloat32|Pressure measured in milibar or hectopascal (1 mbar = 1hPa).| 
|VisibilityRange|MeterFloat32|The distance at which an object or light can be clearly discerned.| 
|GeoReference|GeoReferenceVariant|Optional: If not provided the environment condition is global.| 
|Temperature|TemperatureDegreeCelsiusFloat32|| 

### TerrestrialCondition

If overlapping Atmospheric Conditions exists the following merging rules allies: 
Humidity, AirTemperature and BarometricPressure is calculated as the average of the overlapping conditions. 
Visibility is calculated as the minimum visibility distance of the overlapping conditions.

|Attribute Name|Datatype|Semantics|
|---|---|---|
|Snow|SnowStruct|| 
|Moisture|SurfaceMoistureEnum16|| 
|IceCondition|RoadIceConditionEnum16|| 
|Wind|WindStruct|| 
|Precipitation|PrecipitationStruct|Required: No Precipitation, Rain, Snow or Hail| 
|Haze|HazeStruct|Smoke, Fog, etc.| 
|Humidity|PercentFloat32|Required: Normal value = 0,75| 
|BarometricPressure|AtmosphericPressureFloat32|Pressure measured in milibar or hectopascal (1 mbar = 1hPa).| 
|VisibilityRange|MeterFloat32|The distance at which an object or light can be clearly discerned.| 
|GeoReference|GeoReferenceVariant|Optional: If not provided the environment condition is global.| 
|Temperature|TemperatureDegreeCelsiusFloat32|| 

### WaterSurfaceCondition

Condition of sea surface in the specified region.

|Attribute Name|Datatype|Semantics|
|---|---|---|
|SeaState|SeaStateEnum16|Required| 
|Salinity|PercentFloat32|Optional.| 
|Tide|MeterFloat32|Optional. The height relative to the MSL.| 
|Ice|IceStruct|Optional.| 
|Current|CurrentStruct|Optional. N/A if Ice| 
|Wave|WaveStruct|Optional. N/A if Ice| 
|Swell|WaveStruct|Optional. N/A if Ice| 
|Wind|WindStruct|| 
|Precipitation|PrecipitationStruct|Required: No Precipitation, Rain, Snow or Hail| 
|Haze|HazeStruct|Smoke, Fog, etc.| 
|Humidity|PercentFloat32|Required: Normal value = 0,75| 
|BarometricPressure|AtmosphericPressureFloat32|Pressure measured in milibar or hectopascal (1 mbar = 1hPa).| 
|VisibilityRange|MeterFloat32|The distance at which an object or light can be clearly discerned.| 
|GeoReference|GeoReferenceVariant|Optional: If not provided the environment condition is global.| 
|Temperature|TemperatureDegreeCelsiusFloat32|| 

### AtmosphericLayerCondition

If overlapping Atmospheric Conditions exists the following merging rules allies: 
Humidity, AirTemperature and BarometricPressure is calculated as the average of the overlapping conditions. 
Visibility is calculated as the minimum visibility distance of the overlapping conditions.

|Attribute Name|Datatype|Semantics|
|---|---|---|
|Layer|LayerStruct|Layer base represents the bottom of the atmospheric layer and layer base + thinckness represents the top of the layer.| 
|Cloud|CloudStruct|| 
|Wind|WindStruct|| 
|Precipitation|PrecipitationStruct|Required: No Precipitation, Rain, Snow or Hail| 
|Haze|HazeStruct|Smoke, Fog, etc.| 
|Humidity|PercentFloat32|Required: Normal value = 0,75| 
|BarometricPressure|AtmosphericPressureFloat32|Pressure measured in milibar or hectopascal (1 mbar = 1hPa).| 
|VisibilityRange|MeterFloat32|The distance at which an object or light can be clearly discerned.| 
|GeoReference|GeoReferenceVariant|Optional: If not provided the environment condition is global.| 
|Temperature|TemperatureDegreeCelsiusFloat32|| 

### WaterLayerCondition



|Attribute Name|Datatype|Semantics|
|---|---|---|
|Layer|LayerStruct|| 
|Current|CurrentStruct|| 
|Salinity|PercentFloat32|% salt in water| 
|GeoReference|GeoReferenceVariant|Optional: If not provided the environment condition is global.| 
|Temperature|TemperatureDegreeCelsiusFloat32|| 

## Datatypes

### Simple Datatypes
|Datatype Name|Representation|Units|Semantics|
|---|---|---|---|
|PrecipitationIntensityFloat32|HLAfloat32BE|mm/hour|Light rain — when the precipitation rate is < 2.5 mm (0.098 in) per hour 
Moderate rain — when the precipitation rate is between 2.5 mm (0.098 in) - 7.6 mm (0.30 in) or 10 mm (0.39 in) per hour[106][107] 
Heavy rain — when the precipitation rate is > 7.6 mm (0.30 in) per hour,[106] or between 10 mm (0.39 in) and 50 mm (2.0 in) per hour[107] 
Violent rain — when the precipitation rate is > 50 mm (2.0 in) per hour[107]|
|AtmosphericPressureFloat32|HLAfloat32BE|hPa|Pressure mesured in Milibar or Hecto Pascal. 1 mbar = 1 hPa|
|SpeedFloat32|HLAfloat32BE|m/s|Speed in meters per second.|
|DegreesFloat32|HLAfloat32BE|Degrees|Degrees from True North. 0-360 or -180 to 180. 0 = True North.|

### PrecipitationTypeEnum16Type of precipitation. Default is NoPrecipitation.

|Enumerator Name|Value|
|---|---|
| NoPrecipitation | 0| 
| Rain | 1| 
| Snow | 2| 
| Hail | 3| 

### CloudTypeEnum16Classification of different types of clouds.

|Enumerator Name|Value|
|---|---|
| None | 0| 
| Altocumulus | 1| 
| Altostratus | 2| 
| Cirrocumulus | 3| 
| Cirrostratus | 4| 
| Cirrus | 5| 
| Cumulonimbus | 6| 
| Cumulus | 7| 
| Nimbostratus | 8| 
| Stratocumulus | 9| 
| Stratus | 10| 
| Other | 11| 

### RoadIceConditionEnum16Ice condition for roads.

|Enumerator Name|Value|
|---|---|
| None | 0| 
| Patches | 1| 
| BlackIce | 2| 
| Slush | 3| 
| SheetIce | 4| 
| ExtremeSheetIce | 5| 

### SurfaceMoistureEnum16Road surface wetness ot soil moisture

|Enumerator Name|Value|
|---|---|
| Dry | 0| 
| Wet | 1| 
| Flooded | 2| 
| HeavilyFlooded | 3| 

### SeaStateEnum16Sate of the sea measured in Douglas Sea Scale.

|Enumerator Name|Value|
|---|---|
| Calm_glassy | 0| 
| Calm_rippled | 1| 
| Smooth_wavelets | 2| 
| Slight | 3| 
| Moderate | 4| 
| Rough | 5| 
| Very_Rough | 6| 
| High | 7| 
| Very_High | 8| 
| Phenomenal | 9| 

### GeoReferenceTypeEnum

|Enumerator Name|Value|
|---|---|
| RPR_BaseEntity | 1| 
| RPR_EnvironmentObject | 2| 
| Circle | 3| 
| Polygon | 4| 
| GML | 5| 

### WaveStruct

|Field Name|Datatype|Semantics|
|---|---|---|
|Length|MeterFloat32|Distance from a particular phase on a wave to the same phase on an adjacent wave.|
|Height|MeterFloat32|Average vertical distance between trough and crest produced by the wave.|
|Period|TimeSecondInteger32||
|Direction|DegreesFloat32|The value of this parameter shall be applied as the 
direction in which the wave propagates. Degrees 0-360. True North.|

### IceStruct

|Field Name|Datatype|Semantics|
|---|---|---|

### CurrentStruct

|Field Name|Datatype|Semantics|
|---|---|---|
|Direction|DegreesFloat32||
|Speed|SpeedFloat32||

### IceStruct

|Field Name|Datatype|Semantics|
|---|---|---|
|Type|||
|Thickness|MeterFloat32||
|Coverage|PercentFloat32||

### CloudStruct

|Field Name|Datatype|Semantics|
|---|---|---|
|Type|CloudTypeEnum16||
|Coverage|PercentFloat32||
|Density|Density|g/m3|

### LayerStruct

|Field Name|Datatype|Semantics|
|---|---|---|
|Base|MeterFloat32|0=MSL|
|Thickness|MeterFloat32|Positive value|

### WindStruct

|Field Name|Datatype|Semantics|
|---|---|---|
|Direction|DegreesFloat32|Required: Direction in degrees clockwise from due north.|
|HorizontalSpeed|SpeedFloat32|Required: Wind speed (m/s) in the specified WindDirection.|
|VerticalSpeed|SpeedFloat32|Optional: Wind speed in m/s. Negative number is  a downdraft. Default is 0.|

### PrecipitationStruct

|Field Name|Datatype|Semantics|
|---|---|---|
|Type|PrecipitationTypeEnum16|Required: No Precipitation, Rain, Snow or Hail|
|Intensity|PrecipitationIntensityFloat32|Optional: Amount in mm/per hour. Default is 0 mm/hour.|

### SnowStruct

|Field Name|Datatype|Semantics|
|---|---|---|
|Depth|MeterFloat32||
|Density||kg/m3|

### HazeStruct

|Field Name|Datatype|Semantics|
|---|---|---|
|Type|HazeTypeEnum||
|Density|HazeDensity||

### GeoReferenceVariant
**Discriminant** GeoReferenceType
**Datatype** GeoReferenceTypeEnum

|Enumerator|Name|Datatype|Semantics|
|---|---|---|---|
|[RPR_BaseEntity..RPR_EnvironmentObject] |  Object | EntityIdentifierStruct| | 
|Polygon |  Polygon | | | 
|Circle |  Circle | | | 
|GML |  GML | GMLidenfitifer| | 
