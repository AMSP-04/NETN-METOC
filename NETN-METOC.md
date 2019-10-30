# NETN-METOC

Copyright (C) 2019 NATO/OTAN.
This work is licensed under a [Creative Commons Attribution-NoDerivatives 4.0 International License](LICENCE.md).

## Introduction
This module is a specification of how to represent METOC related data to be shared among participants in a federated distributed simulation. The specification is based on IEEE 1516 High Level Architecture (HLA) Object Model Template (OMT) and primarily intended to support interoperability in a federated simulation (federation) based on HLA. An HLA OMT based Federation Object Model (FOM) is used to specify types of data and how it is encoded on the network. The NETN METOC FOM module is available as a XML file for use in HLA based federations.

### Purpose
The purpose of the NETN METOC module is to provide a standard way to exchange data related to weather conditions and primary effects of weather on terrain, on water surfaces, in the atmosphere and subsurface water conditions. The main objective is to provide a reference model that represents a core common subset of METOC related aspects and to allow extension of the module to incorporate additional detail if required. Therefore, the NETN METOC module shall be viewed as a reference FOM module where extensions are not only allowed but encouraged to fully meet federation specific requirements. However, any extension should also be considered as candidates for improving the NETN METOC module or candidates for new standard NETN modules.         

### Scope
Current weather conditions impact simulations such as platforms and sensors on the ground, on the sea, under water and in the air. In a federated distributed simulation a correlated representation of these condistions is key to meet interoperability and model requirements. Different simulations require different fidelity of weather conditions with respect to data resolution and accuracy.

The NETN METOC focus on representation of weather conditions related surfaces and layers. The main difference is that a surface condition does not have a volume and only represents the conditions directly related to the surface of a piece of terrain or water. The layer conditions represent a volume of water or air and is specified with hight/depth from surface and layer thickness. Both concepts are also geographically positioned by reference to other concepts shared in the federation such as position of objects, areal objects or reference to terrain features such as roads etc.

Based on these concepts different levels of fidelity in representing weather conditions can be achieved. Global conditions can be expressed as well as highly detailed conditions e.g. surrounding a specific aircraft.

The aspects and attributes of wather conditions included in the scope of the NETN METOC module is based on input from several sources and are designed to cover the most common levels of representation required by a large set of exising simulators.

### Overview
 
Environment Conditions are either surface based (land or water) or a layer (above terrain or below water surface) and include either Weather attributes or Sub Surface (Water) attributes. 

* Atmospheric Layer Conditions cover the following aspects: Temperature, Winds, Precipitation, Haze, Humidity, Barometric Pressure, Visibility Range and Clouds.

* Water Layer Conditions cover the following aspects: Temperature, Salinity and Currents.

* Land Surface Conditions cover the following aspects: Temperature, Winds, Precipitation, Haze, Humidity, Barometric Pressure, Visibility Range, Snow Condition, Moisture and Ice Condition

* Water Surface Conditions cover the following aspects: Temperature, Winds, Precipitation, Haze, Humidity, Barometric Pressure, Visibility Range, Sea State, Salinity, Tide, Ice Conditions, Currents, Waves and Swell. 

To exchange Environment Conditions the NETN-METOC offers two methods of interaction.

1. Pull: Request and Response pattern for Environment Conditions based on HLA Interaction Classes.
2. Push: Request for Continueous updates of Environment Condition based on HLA Interactions and then updates of HLA Object instance attributes.

Depending on federation design & agreements, one or both methods may be suitable.

## Environment Conditions

Environment Condition Objects are created by any federate to express need for environmental information. Ownership of environmental object attributes are divested to Weather Service federate(s) with the modelling responsibility of correlated environment conditions.

Environment conditions are represented as object instances in the federation. Each instance is related to one of the following: Global condition (no GeoReference), condition related to specific object instance (RPR BaseEntity or Environment Object), explicitly defined geographical areas (Polygon or Circle) or a reference to WFS/GML identifier. 

![][objectclasses]
	

[objectclasses]: ./objectclasses.png


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

<!--

title Trafficability

Simulator<-Weather Service:Register/DiscoverObjectInstance(MM#1, "METOC_Model")

Simulator<-Weather Service:Update/ReflectAttributeInstance(MM#1, UUID, )

Simulator->Weather Service:METOC_Request(id, false, "FV30", "LandSurfaceCondition")


Simulator<-Weather Service:RegisterObjectInstance("LandSurfaceCondition")

Simulator<-Weather Service:UpdateAttributeValues(uuid, moisture, snow, precipitation, visibilityrange)

Simulator<-Weather Service:METOC_Response(id, uuid)

-->