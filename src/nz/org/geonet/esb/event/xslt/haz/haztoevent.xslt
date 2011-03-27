<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <!-- 
	xslt template to transform HAZ document into simple event xml
    -->
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <xsl:param name="mode" required="yes"/>
    
    <xsl:template match="/report">

        <xsl:variable name="eventDateTime"><xsl:value-of select="uttime/year"/>-<xsl:value-of
                select="uttime/month"/>-<xsl:value-of select="uttime/day"/>T<xsl:value-of
                select="uttime/hour"/>:<xsl:value-of select="uttime/minute"/>:<xsl:value-of
                select="uttime/second"/>.<xsl:value-of select="uttime/msec"/>Z</xsl:variable>

        <xsl:variable name="creationDateTime"><xsl:value-of select="timestamp/year"/>-<xsl:value-of
                select="timestamp/month"/>-<xsl:value-of select="timestamp/day"/>T<xsl:value-of
                select="timestamp/hour"/>:<xsl:value-of select="timestamp/minute"/>:<xsl:value-of
                select="timestamp/second"/>.<xsl:value-of select="timestamp/msec"/>Z</xsl:variable>

        <xsl:element name="event">

            <xsl:attribute name="publicID">
                <xsl:value-of select="@id"/>
            </xsl:attribute>

            <xsl:element name="creationInfo">
                <xsl:element name="agencyID">
                    <xsl:value-of select="@site"/>
                </xsl:element>
                <xsl:element name="author">
                    <xsl:value-of select="@who"/>
                </xsl:element>
                <xsl:element name="creationTime">
                    <xsl:value-of select="$creationDateTime"/>
                </xsl:element>
            </xsl:element>

            <xsl:element name="description">
                <xsl:element name="text">
                    <xsl:value-of select="text"/>
                </xsl:element>
            </xsl:element>

            <xsl:element name="origin">
                <xsl:element name="creationInfo">
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

                <xsl:element name="evaluationMode">
                    <xsl:value-of select="$mode"/>
                </xsl:element>

                <xsl:element name="evaluationStatus">
                    <xsl:value-of select="@status"/>
                </xsl:element>

                <xsl:element name="magnitude">

                    <xsl:element name="creationInfo">
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

                </xsl:element>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>

   
 </xsl:stylesheet>