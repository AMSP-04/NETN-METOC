# NETN METOC
NATO Education and Training Network (NETN) Meteorological and Oceanographic (METOC) Module. 
        
This module is a specification of how to represent METOC related data to be shared among participants in a federated distributed simulation. The specification is based on IEEE 1516 High Level Architecture (HLA) Object Model Template (OMT) and primarily intended to support interoperability in a federated simulation (federation) based on HLA. An HLA OMT based Federation Object Model (FOM) is used to specify types of data and how it is encoded on the network. The NETN METOC FOM module is available as a XML file for use in HLA based federations.
        

## Purpose
The purpose of the NETN METOC module is to provide a standard way to exchange data related to weather conditions and primary effects of weather on terrain, on water surfaces, in the atmosphere and subsurface water conditions. The main objective is to provide a reference model that represents a core common subset of METOC related aspects and to allow extension of the module to incorporate additional detail if required. Therefore, the NETN METOC module shall be viewed as a reference FOM module where extensions are not only allowed but encouraged to fully meet federation specific requirements. However, any extension should also be considered as candidates for improving the NETN METOC module or candidates for new standard NETN modules.
        

## Scope
Current weather conditions impact simulations such as platforms and sensors on the ground, on the sea, under water and in the air. In a federated distributed simulation a correlated representation of these condistions is key to meet interoperability and model requirements. Different simulations require different fidelity of weather conditions with respect to data resolution and accuracy.

The NETN METOC focus on representation of weather conditions related surfaces and layers. The main difference is that a surface condition does not have a volume and only represents the conditions directly related to the surface of a piece of terrain or water. The layer conditions represent a volume of water or air and is specified with hight/depth from surface and layer thickness. Both concepts are also geographically positioned by reference to other concepts shared in the federation such as position of objects, areal objects or reference to terrain features such as roads etc. 

Based on these concepts different levels of fidelity in representing weather conditions can be achieved. Global conditions can be expressed as well as highly detailed conditions e.g. surrounding a specific aircraft.

The aspects and attributes of wather conditions included in the scope of the NETN METOC module is based on input from several sources and are designed to cover the most common levels of representation required by a large set of exising simulators.

Atmospheric Layer Conditions cover the following aspects: Temperature, Winds, Precipitation, Haze, Humidity, Barometric Pressure, Visibility Range and Clouds.

Water Layer Conditions cover the following aspects: Temperature, Salinity and Currents.

Terrestrial Surface Conditions cover the following aspects: Temperature, Winds, Precipitation, Haze, Humidity, Barometric Pressure, Visibility Range, Snow Condition, Moisture and Ice Condition

Water Surface Conditions cover the following aspects: Temperature, Winds, Precipitation, Haze, Humidity, Barometric Pressure, Visibility Range, Sea State, Salinity, Tide, Ice Conditions, Currents, Waves and Swell.
        
## Object Classes

Environment conditions are represented as object instances in the federation. Each instance is related to one of the following: Global condition (no GeoReference), condition related to specific object instance (RPR BaseEntity or Environment Object), explicitly defined geographical areas (Polygon or Circle) or a reference to WFS/GML identifier.

Environment Condition Objects are either surface based (terrestrial or water) or a layer (above terrain or below water surface).

Environment Condition Objects include either Weather attributes or Sub Surface (Water) attributes.

Environment Condition Objects are created by any federate to express need for environmental information. Ownership of environmental object attributes are divested to Weather Service federate(s) with the modelling responsibility of correlated environment conditions.
            

![][objectclasses]



|Object Class|Description|
|---|---|
|METOC_EnvironmentCondition|Superclass for Environment Conditions and Layers. The conditions can be global in which case no RegionReference is provided or regional in which case a reference to a GeometryFeature published in the federation is required.|
|WeatherCondition|If overlapping Atmospheric Conditions exists the following merging rules allies: |
|TerrestrialCondition|If overlapping Atmospheric Conditions exists the following merging rules allies: |
|WaterSurfaceCondition|Condition of sea surface in the specified region.|
|AtmosphericLayerCondition|If overlapping Atmospheric Conditions exists the following merging rules allies: |
|WaterLayerCondition||

### METOC_EnvironmentCondition

Superclass for Environment Conditions and Layers. The conditions can be global in which case no RegionReference is provided or regional in which case a reference to a GeometryFeature published in the federation is required.

|Attribute Name|Datatype|Description|
|---|---|---|
|GeoReference|GeoReferenceVariant|Optional: If not provided the environment condition is global.| 
|Temperature|TemperatureDegreeCelsiusFloat32|| 

### WeatherCondition

If overlapping Atmospheric Conditions exists the following merging rules allies: 
Humidity, AirTemperature and BarometricPressure is calculated as the average of the overlapping conditions. 
Visibility is calculated as the minimum visibility distance of the overlapping conditions.

|Attribute Name|Datatype|Description|
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

|Attribute Name|Datatype|Description|
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

|Attribute Name|Datatype|Description|
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

|Attribute Name|Datatype|Description|
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



|Attribute Name|Datatype|Description|
|---|---|---|
|Layer|LayerStruct|| 
|Current|CurrentStruct|| 
|Salinity|PercentFloat32|% salt in water| 
|GeoReference|GeoReferenceVariant|Optional: If not provided the environment condition is global.| 
|Temperature|TemperatureDegreeCelsiusFloat32|| 

## Datatypes

### Simple Datatypes
|Datatype Name|Representation|Units|Description|
|---|---|---|---|
|PrecipitationIntensityFloat32|HLAfloat32BE|mm/hour|Light rain — when the precipitation rate is < 2.5 mm (0.098 in) per hour. Moderate rain — when the precipitation rate is between 2.5 mm (0.098 in) - 7.6 mm (0.30 in) or 10 mm (0.39 in) per hour. Heavy rain — when the precipitation rate is > 7.6 mm (0.30 in) per hour, or between 10 mm (0.39 in) and 50 mm (2.0 in) per hour. Violent rain — when the precipitation rate is > 50 mm (2.0 in) per hour.|
|AtmosphericPressureFloat32|HLAfloat32BE|hPa|Pressure mesured in Milibar or Hecto Pascal. 1 mbar = 1 hPa|
|SpeedFloat32|HLAfloat32BE|m/s|Speed in meters per second.|
|DegreesFloat32|HLAfloat32BE|Degrees|Degrees from True North. 0-360 or -180 to 180. 0 = True North.|

### PrecipitationTypeEnum16
Type of precipitation. Default is NoPrecipitation.

|Enumerator Name|Value|
|---|---|
| NoPrecipitation | 0| 
| Rain | 1| 
| Snow | 2| 
| Hail | 3| 

### CloudTypeEnum16
Classification of different types of clouds.

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

### RoadIceConditionEnum16
Ice condition for roads.

|Enumerator Name|Value|
|---|---|
| None | 0| 
| Patches | 1| 
| BlackIce | 2| 
| Slush | 3| 
| SheetIce | 4| 
| ExtremeSheetIce | 5| 

### SurfaceMoistureEnum16
Road surface wetness ot soil moisture

|Enumerator Name|Value|
|---|---|
| Dry | 0| 
| Wet | 1| 
| Flooded | 2| 
| HeavilyFlooded | 3| 

### SeaStateEnum16
Sate of the sea measured in Douglas Sea Scale.

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

|Field Name|Datatype|Description|
|---|---|---|
|Length|MeterFloat32|Distance from a particular phase on a wave to the same phase on an adjacent wave.|
|Height|MeterFloat32|Average vertical distance between trough and crest produced by the wave.|
|Period|TimeSecondInteger32||
|Direction|DegreesFloat32|The value of this parameter shall be applied as the 
direction in which the wave propagates. Degrees 0-360. True North.|

### CurrentStruct

|Field Name|Datatype|Description|
|---|---|---|
|Direction|DegreesFloat32||
|Speed|SpeedFloat32||

### IceStruct

|Field Name|Datatype|Description|
|---|---|---|
|Type|||
|Thickness|MeterFloat32||
|Coverage|PercentFloat32||

### CloudStruct

|Field Name|Datatype|Description|
|---|---|---|
|Type|CloudTypeEnum16||
|Coverage|PercentFloat32||
|Density|Density|g/m3|

### LayerStruct

|Field Name|Datatype|Description|
|---|---|---|
|Base|MeterFloat32|0=MSL|
|Thickness|MeterFloat32|Positive value|

### WindStruct

|Field Name|Datatype|Description|
|---|---|---|
|Direction|DegreesFloat32|Required: Direction in degrees clockwise from due north.|
|HorizontalSpeed|SpeedFloat32|Required: Wind speed (m/s) in the specified WindDirection.|
|VerticalSpeed|SpeedFloat32|Optional: Wind speed in m/s. Negative number is  a downdraft. Default is 0.|

### PrecipitationStruct

|Field Name|Datatype|Description|
|---|---|---|
|Type|PrecipitationTypeEnum16|Required: No Precipitation, Rain, Snow or Hail|
|Intensity|PrecipitationIntensityFloat32|Optional: Amount in mm/per hour. Default is 0 mm/hour.|

### SnowStruct

|Field Name|Datatype|Description|
|---|---|---|
|Depth|MeterFloat32||
|Density||kg/m3|

### HazeStruct

|Field Name|Datatype|Description|
|---|---|---|
|Type|HazeTypeEnum||
|Density|HazeDensity||

### GeoReferenceVariant
**Discriminant** GeoReferenceType
**Datatype** GeoReferenceTypeEnum

|Enumerator|Name|Datatype|Description|
|---|---|---|---|
|[RPR_BaseEntity..RPR_EnvironmentObject] |  Object | EntityIdentifierStruct| | 
|Polygon |  Polygon | | | 
|Circle |  Circle | | | 
|GML |  GML | GMLidenfitifer| | 



[objectclasses]: https://github.com/AMSP-04/NETN-METOC/blob/master/NETN-METOC_v0.4%20Object%20Class%20Tree.png "Object Classes"
