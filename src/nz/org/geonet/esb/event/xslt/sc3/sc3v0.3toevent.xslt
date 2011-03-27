<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <!-- 
	xslt template to transform quake events in seiscomp3 xml document into simple event xml
 -->
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
   
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
                <xsl:element name="author">
                    <xsl:value-of select="creationInfo/author"/>
                </xsl:element>
                <xsl:element name="creationTime">
                    <xsl:value-of select="creationInfo/creationTime"/>
                </xsl:element>
            </xsl:element>

            <xsl:element name="description">
                <xsl:element name="text">
                    <xsl:value-of select="description/text"/>
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

        <!-- transform the preferred origin -->
        <xsl:if test="@publicID=$preferredOriginID">
            
            <xsl:element name="origin">
                <xsl:element name="creationInfo">
                    <xsl:element name="creationTime">
                        <xsl:value-of select="creationInfo/creationTime"/>
                    </xsl:element>
                </xsl:element>

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
        <!-- transform the preferred magnitude -->
        <xsl:if test="@publicID=$preferredMagnitudeID">
            
            <xsl:element name="magnitude">

                <xsl:element name="creationInfo">
                    <xsl:element name="creationTime">
                        <xsl:value-of select="creationInfo/creationTime"/>
                    </xsl:element>
                </xsl:element>

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