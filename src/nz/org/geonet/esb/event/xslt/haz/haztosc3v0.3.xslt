<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema">

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
	xslt template to transform HAZ document into SC3v0.3
    -->

        <xsl:param name="agency" required="yes"/>
        <xsl:param name="author" required="yes"/>
        <xsl:param name="mode" required="yes"/>
        <xsl:param name="magStationCount" required="yes"/>
        <!-- Used to force scevent to prefer this mag -->

        <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

        <xsl:template match="/report">

                <xsl:variable name="eventDateTime"><xsl:value-of select="uttime/year"
                                />-<xsl:value-of select="uttime/month"/>-<xsl:value-of
                                select="uttime/day"/>T<xsl:value-of select="uttime/hour"
                                />:<xsl:value-of select="uttime/minute"/>:<xsl:value-of
                                select="uttime/second"/>.<xsl:value-of select="uttime/msec"
                        />Z</xsl:variable>

                <xsl:variable name="creationDateTime"><xsl:value-of select="timestamp/year"
                                />-<xsl:value-of select="timestamp/month"/>-<xsl:value-of
                                select="timestamp/day"/>T<xsl:value-of select="timestamp/hour"
                                />:<xsl:value-of select="timestamp/minute"/>:<xsl:value-of
                                select="timestamp/second"/>.<xsl:value-of select="timestamp/msec"
                        />Z</xsl:variable>

                <xsl:variable name="publicID">
                        <xsl:value-of select="$author"/>
                        <xsl:value-of select="@id"/>
                        <xsl:value-of select="lower-case(@site)"/>
                </xsl:variable>

                <xsl:element name="seiscomp">
                        <xsl:attribute name="version">
                                <xsl:value-of select="'0.3'"/>
                        </xsl:attribute>
                        <xsl:element name="EventParameters">
                                <xsl:element name="origin">
                                        <xsl:attribute name="publicID">
                                                <xsl:value-of select="$publicID"/>
                                        </xsl:attribute>

                                        <xsl:element name="creationInfo">
                                                <xsl:element name="agencyID">
                                                  <xsl:value-of select="$agency"/>
                                                </xsl:element>
                                                <xsl:element name="author">
                                                  <xsl:value-of select="$author"/>
                                                </xsl:element>
                                                <xsl:element name="creationTime">
                                                  <xsl:value-of select="$creationDateTime"/>
                                                </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="time">
                                                <xsl:element name="value">
                                                  <xsl:value-of select="$eventDateTime"/>
                                                </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="latitude">
                                                <xsl:element name="value">
                                                  <xsl:value-of select="lat"/>
                                                </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="longitude">
                                                <xsl:element name="value">
                                                  <xsl:value-of select="lon"/>
                                                </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="depth">
                                                <xsl:element name="value">
                                                  <xsl:value-of select="depth"/>
                                                </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="quality">
                                                <xsl:element name="usedPhaseCount">
                                                  <xsl:value-of select="nph"/>
                                                </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="evaluationMode">
                                                <xsl:value-of select="$mode"/>
                                        </xsl:element>

                                        <xsl:element name="magnitude">
                                                <xsl:attribute name="publicID">
                                                  <xsl:value-of select="$publicID"/>
                                                  <xsl:text>#netMag.</xsl:text>
                                                  <xsl:value-of select="magtype"/>
                                                </xsl:attribute>
                                                <xsl:element name="creationInfo">
                                                  <xsl:element name="agencyID">
                                                  <xsl:value-of select="$agency"/>
                                                  </xsl:element>
                                                  <xsl:element name="author">
                                                  <xsl:value-of select="$author"/>
                                                  </xsl:element>
                                                  <xsl:element name="creationTime">
                                                  <xsl:value-of select="$creationDateTime"/>
                                                  </xsl:element>
                                                </xsl:element>


                                                <xsl:element name="magnitude">
                                                  <xsl:element name="value">
                                                  <xsl:value-of select="mag"/>
                                                  </xsl:element>
                                                </xsl:element>

                                                <xsl:element name="type">
                                                  <xsl:value-of select="magtype"/>
                                                </xsl:element>
                                                <xsl:element name="stationCount">
                                                  <xsl:value-of select="$magStationCount"/>
                                                </xsl:element>

                                        </xsl:element>

                                </xsl:element>
                        </xsl:element>
                </xsl:element>
        </xsl:template>


</xsl:stylesheet>