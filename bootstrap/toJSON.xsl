<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"                
    xmlns:cc="http://creativecommons.org/ns#" 
    xmlns:dcterms="http://purl.org/dc/terms/" 
    xmlns:foaf="http://xmlns.com/foaf/0.1/" 
    xmlns:gn="http://www.geonames.org/ontology#" 
    xmlns:owl="http://www.w3.org/2002/07/owl#" 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" 
    xmlns:wgs84_pos="http://www.w3.org/2003/01/geo/wgs84_pos#"
    xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!-- Opomba: v primerjavi z google Maps tukaj uporabljamo leafleet maps, pri katerih pa ne sme biti objeektov, ki nimajo LatLgt podatkov -->
    
    <xsl:output method="text" encoding="UTF-8" omit-xml-declaration="yes"/>
    
    <xsl:param name="outDir">docs/</xsl:param>
    
    <xsl:template match="/">
        <xsl:result-document href="{concat($outDir,'map-birth.js')}">
            <xsl:text>var data = </xsl:text>
            <xsl:text>{"places": [</xsl:text>
            <xsl:for-each-group select="tei:TEI/tei:text/tei:body/tei:listPerson/tei:person/tei:birth/tei:placeName[@ref or @ana='#place.Loke-Trbovlje']" group-by="@ref | @ana">
                <xsl:call-template name="kraji"/>
            </xsl:for-each-group>
            <xsl:text>]}</xsl:text>
        </xsl:result-document>
        
        <xsl:result-document href="{concat($outDir,'map-domicile.js')}">
            <xsl:text>var data = </xsl:text>
            <xsl:text>{"places": [</xsl:text>
            <xsl:for-each-group select="tei:TEI/tei:text/tei:body/tei:listPerson/tei:person/tei:state[@type='rightOfDomicile']/tei:desc/tei:placeName[@ref or @ana='#place.Loke-Trbovlje']" group-by="@ref | @ana">
                <xsl:call-template name="kraji"/>
            </xsl:for-each-group>
            <xsl:text>]}</xsl:text>
        </xsl:result-document>
        
        <xsl:result-document href="{concat($outDir,'map-residence.js')}">
            <xsl:text>var data = </xsl:text>
            <xsl:text>{"places": [</xsl:text>
            <xsl:for-each-group select="tei:TEI/tei:text/tei:body/tei:listPerson/tei:person/tei:residence/tei:location/tei:address/tei:settlement[@ref or @ana='#place.Loke-Trbovlje']" group-by="@ref | @an">
                <xsl:call-template name="kraji"/>
            </xsl:for-each-group>
            <xsl:text>]}</xsl:text>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="kraji">
        <xsl:text>{</xsl:text>
        
        <xsl:text>"source" = </xsl:text>
        <xsl:value-of select="concat('&quot;',current-grouping-key(),'&quot;')"/>
        <xsl:text>,</xsl:text>
        
        <xsl:choose>
            <xsl:when test="contains(current-grouping-key(),'geonames')">
                <xsl:variable name="refGeonames" select="concat(current-grouping-key(),'/about.rdf')"/>
                <xsl:variable name="geonamesRDF" select="document($refGeonames, /)"/>
                <xsl:text>"place": </xsl:text>
                <xsl:value-of select="concat('&quot;',$geonamesRDF/rdf:RDF/gn:Feature/gn:name,'&quot;')"/>
                <xsl:text>,</xsl:text>
                <xsl:text>"latitude":</xsl:text>
                <xsl:value-of select="$geonamesRDF/rdf:RDF/gn:Feature/wgs84_pos:lat"/>
                <xsl:text>,</xsl:text>
                <xsl:text>"longitude": </xsl:text>
                <xsl:value-of select="$geonamesRDF/rdf:RDF/gn:Feature/wgs84_pos:long"/>
                <xsl:text>,</xsl:text>
            </xsl:when>
            <xsl:when test="contains(current-grouping-key(),'dbpedia.org')">
                <xsl:variable name="refDbpedia" select="current-grouping-key()"/>
                <xsl:variable name="dbpediaRDF" select="document($refDbpedia, /)"/>
                <xsl:text>"place": </xsl:text>
                <xsl:value-of select="concat('&quot;',$dbpediaRDF/rdf:RDF/rdf:Description/rdfs:label[1],'&quot;')"/>
                <xsl:text>,</xsl:text>
                <xsl:text>"latitude":</xsl:text>
                <xsl:value-of select="$dbpediaRDF/rdf:RDF/rdf:Description/geo:lat"/>
                <xsl:text>,</xsl:text>
                <xsl:text>"longitude": </xsl:text>
                <xsl:value-of select="$dbpediaRDF/rdf:RDF/rdf:Description/geo:long"/>
                <xsl:text>,</xsl:text>
            </xsl:when>
            <!-- drugače so povezave preko @ana -->
            <xsl:otherwise>
                <xsl:variable name="krajID" select="substring-after(current-grouping-key(),'#')"/>
                <xsl:for-each select="ancestor::tei:TEI/tei:teiHeader/tei:profileDesc/tei:settingDesc/tei:listPlace/tei:place[@xml:id=$krajID]">
                    <xsl:text>"place": </xsl:text>
                    <xsl:value-of select="concat('&quot;',tei:placeName[@type='reg'],'&quot;')"/>
                    <xsl:text>,</xsl:text>
                    <!-- v nadaljevnju prikažem samo podatke za tiste kraje, ki imajo geo informacije -->
                    <xsl:if test="tei:location">
                        <xsl:text>"latitude":</xsl:text>
                        <xsl:value-of select="tokenize(tei:location/tei:geo,' ')[1]"/>
                        <xsl:text>,</xsl:text>
                        <xsl:text>"longitude": </xsl:text>
                        <xsl:value-of select="tokenize(tei:location/tei:geo,' ')[2]"/>
                        <xsl:text>,</xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
        
        <xsl:text>"persons": [</xsl:text>
        <xsl:for-each select="current-group()">
            <xsl:text>{ </xsl:text>
            <xsl:for-each select="ancestor::tei:person">
                <xsl:text>"name": </xsl:text>
                <xsl:variable name="imeOsebe">
                    <xsl:for-each select="tei:persName[1]">
                        <xsl:call-template name="imeOsebe"/>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:value-of select="concat('&quot;',$imeOsebe,'&quot;')"/>
                <xsl:text>,</xsl:text>
                <xsl:text>"id": </xsl:text>
                <xsl:value-of select="concat('&quot;',@xml:id,'&quot;')"/>
            </xsl:for-each>
            <xsl:text> }</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>,</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
        
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="imeOsebe">
        <xsl:choose>
            <xsl:when test="not(child::*)">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="tei:surname">
                    <xsl:if test="preceding-sibling::tei:nameLink">
                        <xsl:value-of select="concat(' ',preceding-sibling::tei:nameLink,' ')"/>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="@type='maiden'">
                            <xsl:value-of select="concat('roj. ',.)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="position() != last()">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
                <xsl:text>, </xsl:text>
                <xsl:for-each select="tei:forename">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>