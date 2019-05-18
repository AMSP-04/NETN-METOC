# NETN METOC
NATO Education and Training Network (NETN) Meteorological and Oceanographic (METOC) Module

This module is a specification of how to represent METOC related data to be shared among participants in a federated distributed simulation. The specification is based on IEEE 1516 High Level Architecture (HLA) Object Model Template (OMT) and primarily intended to support interoperability in a federated simulation (federation) based on HLA. An HLA OMT based Federation Object Model (FOM) is used to specify types of data and how it is encoded on the network. The NETN METOC FOM module is available as a separate XML file for use in HLA based federations. How the NETN METOC FOM module can be applied and extended is described in this document.

## Objectives

The purpose of the NETN METOC module is to provide a standard way to exchange data related to weather conditions and primary effects of weather on terrain, on water surfaces, in the atmosphere and subsurface water conditions. The main objective is to provide a reference model that represents a core common subset of METOC related aspects and to allow extension of the module to incorporate additional detail if required. Therefore, the NETN METOC module shall be viewed as a reference FOM module where extensions are not only allowed but encouraged to fully meet federation specific requirements. However, any extension should also be considered as candidates for improving the NETN METOC module or candidates for new standard NETN modules.

## Concepts

Current weather conditions impact simulations such as platforms and sensors on the ground, on the sea, under water and in the air. In a federated distributed simulation a correlated representation of these condistions is key to meet interoperability and model requirements. Different simulations require different fidelity of weather conditions with respect to data resolution and accuracy.

The NETN METOC focus on representation of weather conditions related surfaces and layers. The main difference is that a surface condition does not have a volume and only represents the conditions directly related to the surface of a piece of terrain or water. The layer conditions represent a volume of water or air and is specified with hight/depth from surface and layer thickness. Both concepts are also geographically positioned by reference to other concepts shared in the federation such as position of objects, areal objects or reference to terrain features such as roads etc. 

Based on these concepts different levels of fidelity in representing weather conditions can be achieved. Global conditions can be expressed as well as highly detailed conditions e.g. surrounding a specific aircraft.

The aspects and attributes of wather conditions included in the scope of the NETN METOC module is based on input from several sources and are designed to cover the most common levels of representation required by a large set of exising simulators.

### Layer Conditions
The Atmospheric Layer Condition cover the following aspects:
* Temperature
* Wind
* Precipitation
* Haze
* Humidity
* Barometric Pressure
* Visibility Range
* Clouds

The Water Layer Condition cover the following aspects:
* Temperature
* Salinity
* Current

### Surface Conditions
The Terrestrial Surface Condition cover the following aspects:
* Temperature
* Wind
* Precipitation
* Haze
* Humidity
* Barometric Pressure
* Visibility Range
* Snow
* Moisture
* Ice Condition

The Water Surface Condition cover the following aspects:
* Temperature
* Wind
* Precipitation
* Haze
* Humidity
* Barometric Pressure
* Visibility Range
* Sea State
* Salinity
* Tide
* Ice
* Current
* Wave
* Swell

## Design
![alt text](./NETN-METOC_v0.4%20Object%20Class%20Tree.png "NETN METOC Object Classes")

Environment conditions represented as object instances in the federation. Each instance is related to one of the following: Global condition (no GeoReference), condition related to specific object instance (RPR BaseEntity or Environment Object), explicitly defined geographical areas (Polygon or Circle) or a reference to WFS/GML identifier.

- Environment Condition Objects are either surface based (terrestrial or water) or a layer (above terrain or below water surface). 
- Environment Condition Objects include either Weather attributes or Sub Surface (Water) attributes. 

Environment Condition Objects are created by any federate to express need for environmental information. Ownership of environmental object attributes are divested to Weather Service federate(s) with the modelling responsibility of correlated environment conditions.

Updates of Environment Condition Objects are sent in DDM update regions related to geographic area (2D) and Layer.

Updates are received by subscribing federates (using DDM or not) to affect the model. 


## Agreements
