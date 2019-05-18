<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:vomt="http://www.pitch.se/visualomt" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:clitype="clitype" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:iso4217="http://www.xbrl.org/2003/iso4217" xmlns:ix="http://www.xbrl.org/2008/inlineXBRL" xmlns:java="java" xmlns:link="http://www.xbrl.org/2003/linkbase" xmlns:ns="http://standards.ieee.org/IEEE1516-2010" xmlns:xbrldi="http://xbrl.org/2006/xbrldi" xmlns:xbrli="http://www.xbrl.org/2003/instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:altova="http://www.altova.com" exclude-result-prefixes="clitype fn iso4217 ix java link ns xbrldi xbrli xlink xs xsi altova">
	<xsl:param name="spaceName"></xsl:param>
	<xsl:param name="pageName"></xsl:param>
	<xsl:param name="pageName2"></xsl:param>
	<xsl:param name="dependency"></xsl:param>
	<xsl:param name="url1"></xsl:param>
	<xsl:variable name="dependencySpace" select="substring-before($dependency,':')"/>
	<xsl:variable name="dependencyPage" select="substring-after($dependency,':')"/>


<xsl:output version="4.0" method="text" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>

<xsl:template match="/ns:objectModel">
	<!-- sl:apply-templates select="ns:modelIdentification"/ -->
	<xsl:apply-templates select="ns:objects"/>
	<!-- xsl:apply-templates select="ns:interactions"/ -->
	<xsl:apply-templates select="ns:dataTypes"/>
</xsl:template>

<xsl:template match="ns:modelIdentification">
**Version**: <xsl:value-of select="ns:version"/>, <xsl:value-of select="ns:modificationDate"/>
**Classification**: <xsl:value-of select="ns:securityClassification"/>
<xsl:if test="ns:poc[ns:pocType='Primary author']">
**Primary Authors**: <xsl:apply-templates select="ns:poc[ns:pocType='Primary author']/ns:pocName"/></xsl:if>
<xsl:if test="ns:poc[ns:pocType='Contributor']">
**Contributors**: <xsl:apply-templates select="ns:poc[ns:pocType='Contributor']/ns:pocName"/></xsl:if>

| Name |  <xsl:value-of select="ns:name" />|
| Type |   <xsl:value-of select="ns:type" />|
| Version|  <xsl:value-of select="ns:version" />|
| Modification Date | <xsl:value-of select="ns:modificationDate" /> |
| Security Classification | <xsl:value-of select="ns:securityClassification" /> |

## Introduction

<xsl:if test="ns:purpose">
### Purpose
<xsl:value-of select="ns:purpose"/>	
</xsl:if>

<xsl:if test="ns:useLimitation">
### Use Limitation / Scope
<xsl:value-of select="ns:useLimitation"/>	
</xsl:if>

<xsl:if test="ns:applicationDomain">
### Application Domain / Objective
<xsl:value-of select="ns:applicationDomain"/>	
</xsl:if>

<xsl:if test="ns:useHistory">
### Use History
<xsl:value-of select="ns:useHistory"/>	

</xsl:if>

<xsl:if test="ns:reference">
## References
<xsl:apply-templates select="ns:reference"/>	
</xsl:if>
</xsl:template>

<xsl:template match="ns:poc">
<![CDATA[&nbsp;]]><xsl:value-of select="ns:pocName"/> <xsl:value-of select="ns:pocOrg"/> <xsl:value-of select="ns:pocTelephone"/> <xsl:value-of select="ns:pocEmail"/>
</xsl:template>

<xsl:template match="ns:pocName"><xsl:value-of select="."/>;</xsl:template>


<xsl:template match="ns:reference">|<xsl:value-of select="ns:type"/>|<xsl:value-of select="ns:identification"/>|
</xsl:template>



<xsl:template match="ns:objects">
## Object Classes
	<!-- xsl:apply-templates select="//ns:objectClass"/ -->
	<xsl:apply-templates select="//ns:objectClass" mode="detail"/>
</xsl:template>


<xsl:template match="ns:objectClass">
	<xsl:variable name="fullname"><xsl:apply-templates select="ancestor::ns:objectClass" mode="parent"/><xsl:value-of select="ns:name"/></xsl:variable>
	<xsl:if test="ns:attribute or ns:semantics">|<xsl:value-of select="$fullname"/>|<xsl:apply-templates select="ns:semantics" mode="abbreviated"/>|
	</xsl:if>
</xsl:template>

<xsl:template match="ns:semantics" mode="abbreviated">
	<xsl:choose>
		<xsl:when test="contains(.,'&#xA;')">
			<xsl:value-of select="substring-before(.,'&#xA;')"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="."/></xsl:otherwise>
		</xsl:choose>
</xsl:template>

	
<xsl:template match="ns:objectClass" mode="parent">
	<xsl:value-of select="ns:name"/>.</xsl:template>

<xsl:template match="ns:objectClass" mode="detail">
	<xsl:variable name="fullname">
		<xsl:apply-templates select="ancestor::ns:objectClass" mode="parent"/>
			<xsl:value-of select="ns:name"/>
		</xsl:variable>
	<xsl:if test="ns:attribute or ns:semantics">
### <xsl:value-of select="ns:name"/>
<xsl:text>&#xd;&#xd;</xsl:text>
<xsl:apply-templates select="ns:semantics"/>
		<xsl:if test="@notes">
			<xsl:apply-templates select="@notes"/>
		</xsl:if>
		<xsl:text>&#xd;&#xd;</xsl:text>
|Attribute Name|Datatype|Semantics|
|---|---|---|
<xsl:apply-templates select="ns:attribute"/>
		<xsl:apply-templates select="parent::ns:objectClass" mode="inherited"/>
	</xsl:if>
</xsl:template>

<xsl:template match="ns:objectClass" mode="inherited">
<xsl:if test="ns:attribute or ns:semantics">
<xsl:apply-templates select="ns:attribute"/>
<xsl:apply-templates select="parent::ns:objectClass" mode="inherited"/>
</xsl:if>
<xsl:if test="not(ns:attribute or ns:semantics)">
</xsl:if>
</xsl:template>
<xsl:template match="ns:attribute">|<xsl:value-of select="ns:name"/>|<xsl:value-of select="ns:dataType"/>|<xsl:value-of select="ns:semantics"/>| 
</xsl:template>

<xsl:template match="@notes">
  <xsl:call-template name="tokenizeNotes">     
    <xsl:with-param name="string" select="." />   
  </xsl:call-template>
</xsl:template>

<xsl:template match="ns:note">
<xsl:value-of select="ns:semantics"/>
</xsl:template>



<xsl:template name="tokenizeNotes">   
  <xsl:param name="string" />   
  <xsl:param name="delimiter" select="' '" />   
  <xsl:choose>     
    <xsl:when test="$delimiter and contains($string, $delimiter)">              
	<xsl:apply-templates select="//ns:note[ns:label = substring-before($string, $delimiter)]"/>
	\\
	<xsl:call-template name="tokenizeNotes">         
	  <xsl:with-param name="string" select="substring-after($string, $delimiter)" />
	  <xsl:with-param name="delimiter" select="$delimiter" />       
	</xsl:call-template>     
    </xsl:when>     
	<xsl:otherwise>       
	  <xsl:apply-templates select="//ns:note[ns:label = $string]"/> 
	</xsl:otherwise>   
  </xsl:choose> 
 </xsl:template> 

<xsl:template match="ns:dataType">
	<xsl:choose>
		<xsl:when test="//ns:dataTypes/*/*/ns:name = ../ns:dataType"><xsl:value-of select="."/></xsl:when>
		<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="ns:dataTypes">
## Datatypes
<xsl:apply-templates select="ns:simpleDataTypes"></xsl:apply-templates>
<!-- xsl:apply-templates select="ns:enumeratedDataTypes"></xsl:apply-templates -->
<xsl:apply-templates select="ns:arrayDataTypes"></xsl:apply-templates>
<!-- xsl:apply-templates select="ns:fixedRecordDataTypes"></xsl:apply-templates -->
<!-- sl:apply-templates select="ns:variantRecordDataTypes"></xsl:apply-templates -->
<xsl:apply-templates select="ns:enumeratedDataTypes/ns:enumeratedData"></xsl:apply-templates>
<xsl:apply-templates select="ns:fixedRecordDataTypes/ns:fixedRecordData"></xsl:apply-templates>
<xsl:apply-templates select="ns:variantRecordDataTypes/ns:variantRecordData"></xsl:apply-templates>

</xsl:template>

<xsl:template match="ns:simpleDataTypes">
	<xsl:if test="ns:simpleData">
### Simple Datatypes
|Datatype Name|Representation|Units|Semantics|
|---|---|---|---|
<xsl:apply-templates select="ns:simpleData"/>
	</xsl:if>
</xsl:template>

<xsl:template match="ns:simpleData">|<xsl:value-of select="ns:name"/>|<xsl:value-of select="ns:representation"/>|<xsl:value-of select="ns:units"/>|<xsl:value-of select="ns:semantics"/>|
</xsl:template>


<xsl:template match="ns:enumeratedDataTypes">
<xsl:if test="ns:enumeratedData">
### Enumerated Datatypes

|Datatype Name|Representation|Semantics|
|---|---|---|
<xsl:apply-templates select="ns:enumeratedData" mode="summary"></xsl:apply-templates>
	</xsl:if>
</xsl:template>


<xsl:template match="ns:enumeratedData" mode="summary">|<xsl:value-of select="ns:name"/>|<xsl:value-of select="ns:representation"/>|<xsl:value-of select="ns:semantics"/>|
</xsl:template>

<xsl:template match="ns:enumeratedData">
### <xsl:value-of select="ns:name"/>
  
<xsl:value-of select="ns:semantics"/>

|Enumerator Name|Value|
|---|---|
<xsl:apply-templates select="ns:enumerator"/>
</xsl:template>



<xsl:template match="ns:enumerator">| <xsl:value-of select="ns:name"/> | <xsl:value-of select="ns:value"/>| 
</xsl:template>



<xsl:template match="ns:arrayDataTypes">
	<xsl:if test="ns:arrayData">
### Array Datatypes

|Datatype Name|Datatype|Cardinality|Encoding|Semantics|
|---|---|---|---|---|
<xsl:apply-templates select="ns:arrayData"></xsl:apply-templates>
	</xsl:if>
</xsl:template>



<xsl:template match="ns:arrayData">
|<xsl:value-of select="ns:name"/>|<xsl:apply-templates select="ns:dataType"/>|<xsl:value-of select="ns:cardinality"/>|<xsl:value-of select="ns:encoding"/>|<xsl:value-of select="ns:semantics"/>|
</xsl:template>



<xsl:template match="ns:fixedRecordDataTypes">
	<xsl:if test="ns:fixedRecordData">
### Fixed Record (Struct) Datatypes
|Datatype Name|Encoding|Semantics|
<xsl:apply-templates select="ns:fixedRecordData" mode="summary"></xsl:apply-templates>
	</xsl:if>
</xsl:template>



<xsl:template match="ns:fixedRecordData">
### <xsl:value-of select="ns:name"/> 

<xsl:value-of select="ns:semantics"/>

|Field Name|Datatype|Semantics|
|---|---|---|
<xsl:apply-templates select="ns:field"/>
</xsl:template>


<xsl:template match="ns:field">|<xsl:value-of select="ns:name"/>|<xsl:apply-templates select="ns:dataType"/>|<xsl:value-of select="ns:semantics"/>|
</xsl:template>

<xsl:template match="ns:fixedRecordData" mode="summary">|<xsl:value-of select="ns:name"/>|<xsl:value-of select="ns:encoding"/>|<xsl:value-of select="ns:semantics"/>|
</xsl:template>



<xsl:template match="ns:variantRecordDataTypes">
	<xsl:if test="ns:variantRecordData">
### Variant Record Datatypes
|Datatype Name|Discriminant|Datatype|Semantics|
<xsl:apply-templates select="ns:variantRecordData" mode="summary"></xsl:apply-templates>
	</xsl:if>
</xsl:template>


<xsl:template match="ns:variantRecordData" mode="summary">|<xsl:value-of select="ns:name"/>|<xsl:value-of select="ns:discriminant"/>|<xsl:apply-templates select="ns:dataType"/>|<xsl:value-of select="ns:semantics"/>|
</xsl:template>

<xsl:template match="ns:variantRecordData">
### <xsl:value-of select="ns:name"/>
**Discriminant** <xsl:value-of select="ns:discriminant"/>
**Datatype** <xsl:value-of select="ns:dataType"/>

<xsl:value-of select="ns:semantics"/>

|Enumerator|Name|Datatype|Semantics|
|---|---|---|---|
<xsl:apply-templates select="ns:alternative"/>
</xsl:template>

<xsl:template match="ns:alternative">|<xsl:value-of select="ns:enumerator"/> |  <xsl:value-of select="ns:name"/> | <xsl:value-of select="ns:dataType"/>| <xsl:value-of select="ns:semantics"/>| 
</xsl:template>


<xsl:template match="ns:interactionClass">
<xsl:variable name="fullname"><xsl:apply-templates select="ancestor::ns:interactionClass" mode="parent"/><xsl:value-of select="ns:name"/></xsl:variable>
<xsl:if test="ns:parameter or ns:semantics">|<xsl:value-of select="$fullname"/>|<xsl:value-of select="ns:semantics"/>|
</xsl:if>
</xsl:template>
	





<xsl:template match="ns:interactionClass" mode="parent"><xsl:value-of select="ns:name"/>.</xsl:template>




<xsl:template match="ns:interactionClass" mode="detail">
<xsl:variable name="fullname"><xsl:apply-templates select="ancestor::ns:interactionClass" mode="parent"/><xsl:value-of select="ns:name"/></xsl:variable>
<xsl:if test="ns:parameter or ns:semantics">
{anchor:<xsl:value-of select="$fullname"/>}
### <xsl:value-of select="$fullname"/>
<![CDATA[&nbsp;]]>
<xsl:apply-templates select="ns:semantics"/>
<xsl:if test="@notes">
{panel}
<xsl:apply-templates select="@notes"/>
{panel}
</xsl:if>


{table:class=confluenceTable}
{tr}{th:class=confluenceTh}Parameter Name{th}{th:class=confluenceTh}Class{th}{th:class=confluenceTh}Datatype{th}{th:class=confluenceTh}Semantics{th}{tr}
{multi-excerpt:name=<xsl:value-of select="$fullname"/>}
<xsl:apply-templates select="ns:parameter"/>
<xsl:apply-templates select="parent::ns:interactionClass" mode="inherited"/>
{multi-excerpt}
{table}


</xsl:if>

</xsl:template>

<xsl:template match="ns:interactionClass" mode="inherited">
<xsl:if test="ns:parameter or ns:semantics">
<xsl:apply-templates select="ns:parameter"/>
<xsl:apply-templates select="parent::ns:interactionClass" mode="inherited"/>
</xsl:if>
<xsl:if test="not(ns:parameter or ns:semantics)">
{multi-excerpt-include:<xsl:value-of select="$dependency"/>|name=<xsl:apply-templates select="ancestor::ns:interactionClass" mode="parent"/><xsl:value-of select="ns:name"/>|nopanel=true}
</xsl:if>
</xsl:template>


<xsl:template match="ns:parameter">{tr}{td:class=confluenceTd}<xsl:value-of select="ns:name"/>{td}{td:class=confluenceTd}<xsl:value-of select="../ns:name"/>{td}{td:class=confluenceTd}<xsl:value-of select="ns:dataType"/>{td}{td:class=confluenceTd}{html}<xsl:value-of select="ns:semantics"/>{html}{td}{tr}  


</xsl:template>

<xsl:template match="ns:interactions">
## Interaction Classes
<xsl:apply-templates select="//ns:note[ns:label = @ns:notes]"/>

|Class Name|Semantics|
|---|---|
<xsl:apply-templates select="//ns:interactionClass"/>

<xsl:apply-templates select="//ns:interactionClass" mode="detail"/>

</xsl:template>
</xsl:stylesheet>

