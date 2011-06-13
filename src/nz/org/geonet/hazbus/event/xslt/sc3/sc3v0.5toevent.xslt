<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:sc3="http://geofon.gfz-potsdam.de/ns/seiscomp3-schema/0.5"
    xpath-default-namespace="http://geofon.gfz-potsdam.de/ns/seiscomp3-schema/0.5">
    
<!--  
Copyright 2010, Institute of Geological & Nuclear Sciences Ltd or
third-party contributors as indicated by the @author tags.
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
-->
    
<!-- 
xslt template to transform quake events in seiscomp3 xml document into simple event xml
 -->
    <xsl:output method="xml" encoding="UTF-8" indent="yes" standalone="yes"/>
   
    <xsl:template match="/seiscomp">
        <xsl:apply-templates select="EventParameters/event"/>
      </xsl:template>

    <xsl:template match="event">
        <xsl:variable name="preferredOriginID" select="preferredOriginID"/>
        <xsl:variable name="preferredMagnitudeID" select="preferredMagnitudeID"/>
        <xsl:variable name="publicID" select="@publicID"/>

        <xsl:element name="event">
            <xsl:attribute name="publicID">
                <xsl:value-of select="$publicID"/>
            </xsl:attribute>
            <xsl:element name="creationInfo">
                <xsl:element name="agencyID">
                    <xsl:value-of select="creationInfo/agencyID"/>
                </xsl:element>
   
                <xsl:variable name="dt"
                    select="xs:dateTime(creationInfo/creationTime), 
                    xs:dateTime(creationInfo/modificationTime),
                    xs:dateTime(/seiscomp/EventParameters/origin[@publicID=$preferredOriginID]/creationInfo/creationTime),
                    xs:dateTime(/seiscomp/EventParameters/origin[@publicID=$preferredOriginID]/creationInfo/modificationTime),
                    xs:dateTime(/seiscomp/EventParameters/origin[@publicID=$preferredOriginID]/magnitude[@publicID=$preferredMagnitudeID]/creationInfo/creationTime),
                    xs:dateTime(/seiscomp/EventParameters/origin[@publicID=$preferredOriginID]/magnitude[@publicID=$preferredMagnitudeID]/creationInfo/modificationTime)"
                />

                <xsl:element name="updateTime">
                    <xsl:value-of select="max($dt)"/>
                </xsl:element>

            </xsl:element>

            <xsl:apply-templates select="../origin">
                <xsl:with-param name="preferredOriginID" select="$preferredOriginID"/>
                <xsl:with-param name="preferredMagnitudeID" select="$preferredMagnitudeID"/>
                <xsl:with-param name="publicID" select="$publicID"/>
            </xsl:apply-templates>

        </xsl:element>
    </xsl:template>

    <xsl:template match="origin">
        <xsl:param name="preferredOriginID"/>
        <xsl:param name="preferredMagnitudeID"/>
        <xsl:param name="publicID"/>

           <xsl:if test="@publicID=$preferredOriginID">
            
            <xsl:element name="preferredOrigin">
 
                <xsl:element name="time">
                    <xsl:element name="value">
                        <xsl:value-of select="time/value"/>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="latitude">
                    <xsl:element name="value">
                        <xsl:value-of select="latitude/value"/>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="longitude">
                    <xsl:element name="value">
                        <xsl:value-of select="longitude/value"/>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="depth">
                    <xsl:element name="value">
                        <xsl:value-of select="depth/value"/>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="evaluationMode">
                    <xsl:value-of select="evaluationMode"/>
                </xsl:element>

                <xsl:element name="evaluationStatus">
                    <xsl:value-of select="evalutionStatus"/>
                </xsl:element>

                <xsl:apply-templates select="magnitude">
                    <xsl:with-param name="preferredMagnitudeID" select="$preferredMagnitudeID"/>
                </xsl:apply-templates>

            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="magnitude">
        <xsl:param name="preferredMagnitudeID"/>
 
        <xsl:if test="@publicID=$preferredMagnitudeID">
            
            <xsl:element name="preferredMagnitude">

                <xsl:element name="magnitude">
                    <xsl:element name="value">
                        <xsl:value-of select="magnitude/value"/>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="type">
                    <xsl:value-of select="type"/>
                </xsl:element>

            </xsl:element>
        </xsl:if>
    </xsl:template>

 </xsl:stylesheet>