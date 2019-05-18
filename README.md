# NETN METOC
NATO Education and Training Network (NETN) Meteorological and Oceanographic (METOC) Module

This module is a specification of how to represent METOC related data to be shared among participants in a federated distributed simulation. The specification is based on IEEE 1516 High Level Architecture (HLA) Object Model Template (OMT) and primarily intended to support interoperability in a federated simulation (federation) based on HLA. An HLA OMT based Federation Object Model (FOM) is used to specify types of data and how it is encoded on the network. The NETN METOC FOM module is available as a separate XML file for use in HLA based federations. How the NETN METOC FOM module can be applied and extended is described in this document.

## Objectives

The purpose of the NETN METOC module is to provide a standard way to exchange data related to weather conditions and primary effects of weather on terrain, on water surfaces, in the atmosphere and subsurface water conditions. The main objective is to provide a reference model that represents a core common subset of METOC related aspects and to allow extension of the module to incorporate additional detail if required. Therefore, the NETN METOC module shall be viewed as a reference FOM module where extensions are not only allowed but encouraged to fully meet federation specific requirements. However, any extension should also be considered as candidates for improving the NETN METOC module or candidates for new standard NETN modules.

## Concepts

### Layer
* Atmospheric Layer Condition
* Water Layer Condition

### Surface
* Terrestrial Surface Condition
* Water Surface Condition

## Design
![alt text](https://github.com/AMSP-04/NETN-METOC/blob/master/NETN-METOC_v0.4%20Object%20Class%20Tree.png "NETN METOC Object Classes")


## Agreements
