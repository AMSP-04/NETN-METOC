# NETN-METOC


|Version| Date| Dependencies|
|---|---|---|
|1.1|2023-03-18|NETN-BASE|

> [Full Documentation](NETN-METOC.md)

The purpose of the NATO Education and Training Network (NETN) Meteorological and Oceanographic (METOC) Module is to provide a standard way to exchange data related to weather conditions and primary effects of weather on terrain, on water surfaces, in the atmosphere and subsurface water conditions. The main objective is to provide a reference model that represents a core common subset of METOC-related aspects and to allow the extension of the module to incorporate additional detail if required. Therefore, the NETN-METOC module shall be viewed as a reference FOM module where extensions are not only allowed but encouraged to fully meet federation-specific requirements. However, any extension should also be considered as a candidate for improving the NETN-METOC module or candidates for new standard NETN modules.         

This module is a specification of how to represent METOC-related data to be shared among participants in a federated distributed simulation. The specification is based on IEEE 1516 High Level Architecture (HLA) Object Model Template (OMT) and is primarily intended to support interoperability in a federated simulation (federation) based on HLA. An HLA-based Federation Object Model (FOM) is used to specify types of data and how it is encoded on the network. The NETN-METOC FOM module is available as an XML file for use in HLA-based federations.

Current weather conditions impact simulations such as platforms and sensors on the ground, on the sea, underwater and in the air. In a federated distributed simulation a correlated representation of these conditions is key to meeting interoperability and model requirements. Different simulations require different fidelity of weather conditions concerning data resolution and accuracy.  The NETN-METOC focus on the representation of weather conditions for related surfaces and layers. The main difference is that a surface condition does not have a volume and only represents the conditions directly related to the surface of a piece of terrain or water. The layer conditions represent a volume of water or air and are specified with height/depth from surface and layer thickness. Both concepts are also geographically positioned by reference to other concepts shared in the federation such as the position of objects, areal objects or reference to terrain features such as roads etc.  Based on these concepts different levels of fidelity in representing weather conditions can be achieved. Global conditions can be expressed as well as highly detailed conditions e.g. surrounding a specific aircraft.  
        

The aspects and attributes of weather conditions included in the scope of the NETN-METOC module are based on input from several sources and are designed to cover the most common levels of representation required by a large set of existing simulators.

## License

Copyright (C) 2020 NATO/OTAN. This work is licensed under a [Creative Commons Attribution-NoDerivatives 4.0 International License](LICENCE.md).

The work includes the NETN-METOC.xml FOM Module and documentation.

The licence gives you the right to use and redistribute the NETN FOM Module (XML file and Documentation) in its entirety without modification. You are also allowed to develop new FOM Modules (in separate XML files and separate documentation) that build on or extend the NETN module by referencing and including necessary scaffolding classes. You are NOT allowed to modify this FOM Module or its documentation without prior permission from the NATO Modelling and Simulation Group.

## Versions, updates and extensions

All updates and versioning of this work are coordinated by the NATO Modelling and Simulation Coordination Office (MSCO), managed by the NATO Modelling and Simulation Group (NMSG) and performed as NATO Science and Technology Organization (STO) technical activities in support of the NMSG Modelling and Simulation Standards Subgroup (MS3).

Feedback on the use of this work, suggestions for improvements and identified issues are welcome and can be provided using GitHub issue tracking. To engage in the development and update of this FOM Module please contact your national NMSG representative.

Version numbering of this FOM Module and associated documentation is based on the following principles:

* A new official version number is in effect only when a new release is made in the Master branch.
* An update of the major version number is made if the change constitutes a major restructuring, merging, addition or redefinition of semantics that breaks backward compatibility or covers entirely new concepts.
* An update of the minor version number is made if the change constitutes minor additions to existing concepts and editorial changes that do not break backward compatibility but may require updates of software to use new concepts.
* Patches are released to fix minor issues that do not break backward compatibility.

|Version|
|---|
|v1.0 - Initial version developed by MSG-163. Release included in NETN-FOM v3.0|
|v1.1 - Minor update developed by MSG-191. Release included in NETN-FOM v4.0|

> [Changelog](changelog.md)

