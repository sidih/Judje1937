<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
    xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#"
    extension-element-prefixes="ixsl"
    exclude-result-prefixes="xs tei rdf geo"
    version="3.0">
    
    <xsl:template match="/">
        <xsl:variable name="ident" select="(ixsl:query-params()?id)"/>
        <xsl:for-each select="tei:TEI/tei:text/tei:body/tei:listPerson/tei:person[@xml:id = $ident]">
            <xsl:result-document href="#person" method="ixsl:replace-content">
                <div class="panel stickybox stickyHeaderbox">
                        <table width="100%">
                            <td width="50px">
                                <img id="info_icon" src="http://gams.uni-graz.at/dic/images/person.png" style="float:left; margin-top:3px; opacity:1 " width="35px"></img>
                            </td>
                            <td>
                                <b>
                                    <a href="{concat('person.html?id=',$ident)}">
                                        <xsl:for-each select="tei:persName[1]">
                                            <xsl:call-template name="imeOsebe"/>
                                        </xsl:for-each>
                                    </a>
                                </b>
                            </td>
                            <td width="40">
                                <a href="listPerson-Jews-1937.xml" alt="TEI-Dokument" target="_blank" title="TEI-Dokument">
                                    <img src="http://gams.uni-graz.at/dic/images/tei.png" style="float:right " width="40px"></img>
                                </a>
                            </td>
                        </table>
                    </div>
                    <div class="panel">
                        <table class="table table-hover" style="margin-top:15px">
                            <xsl:if test="tei:persName[2]">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Predhodno ime: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:for-each select="tei:persName[2]">
                                            <xsl:value-of select="tei:surname"/>
                                            <xsl:if test="tei:surname and tei:forename">
                                                <xsl:text>, </xsl:text>
                                            </xsl:if>
                                            <xsl:value-of select="tei:forename"/>
                                        </xsl:for-each>
                                        <xsl:if test="tei:persName[2]/@notAfter">
                                            <xsl:text> (pred </xsl:text>
                                            <xsl:value-of select="tei:persName[2]/@notAfter"/>
                                            <xsl:text>)</xsl:text>
                                        </xsl:if>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="tei:birth/tei:date/@when">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Datum rojstva: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="tei:birth/tei:date/@when"/>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="tei:birth/tei:placeName">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Kraj Rojstva: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:for-each select="tei:birth/tei:placeName">
                                            <xsl:call-template name="povezavaKraj"/>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="tei:occupation[1]">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Poklic: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="tei:occupation[1]"/>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="tei:nationality">
                                <xsl:variable name="narodnost" select="substring-after(tei:nationality/@ana,'#')"/>
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Državljanstvo: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:value-of select=" ancestor::tei:TEI/tei:teiHeader/tei:encodingDesc/tei:classDecl/tei:taxonomy[@xml:id='taxonomy.drzavljanstvo']/tei:category/tei:category[@xml:id = $narodnost]/tei:catDesc/tei:term"/>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="tei:state[@type='rightOfDomicile']">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Domovinska pravica: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:for-each select="tei:state[@type='rightOfDomicile']/tei:desc/tei:placeName">
                                            <xsl:call-template name="povezavaKraj"/>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="tei:residence[1]/tei:location/tei:address[1]/tei:region[@type='district']">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Okraj bivališča: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="tei:residence[1]/tei:location/tei:address[1]/tei:region[@type='district']"/>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="tei:residence[1]/tei:location/tei:address[1]/tei:region[@type='municipality']">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Občina bivališča: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:for-each select="tei:residence[1]/tei:location/tei:address[1]/tei:region[@type='municipality']">
                                            <xsl:call-template name="povezavaKraj"/>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="tei:residence[1]/tei:location/tei:address[1]/tei:settlement">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Kraj bivališča: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:for-each select="tei:residence[1]/tei:location/tei:address[1]/tei:settlement">
                                            <xsl:call-template name="povezavaKraj"/>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="tei:residence[1]/tei:location/tei:address[1]/tei:street">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Ulica bivališča: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="tei:residence[1]/tei:location/tei:address[1]/tei:street"/>
                                        <xsl:if test="tei:residence[1]/tei:location/tei:address[1]/tei:street/@n">
                                            <xsl:value-of select="concat(' ',tei:residence[1]/tei:location/tei:address[1]/tei:street/@n)"/>
                                        </xsl:if>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:for-each select="tei:residence[1]/tei:location/tei:settlement">
                                <xsl:variable name="kjeKoda" select="substring-after(@ana,'#')"/>
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:if test="$kjeKoda = 'vJugoslaviji'">
                                                <xsl:text>Od kdaj biva na ozemlju Jugoslavije: </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="$kjeKoda = 'vLjubljani'">
                                                <xsl:text>Od kdaj biva v Ljubljani: </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="$kjeKoda = 'vKranju'">
                                                <xsl:text>Od kdaj biva v Kranju: </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="$kjeKoda = 'vVukovarju'">
                                                <xsl:text>Od kdaj biva v Vukovarju: </xsl:text>
                                            </xsl:if>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@from"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                            <xsl:if test="tei:residence[2]/tei:location/tei:address/tei:settlement">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Novo bivališče </xsl:text>
                                            <xsl:if test="tei:residence[2][@notBefore]">
                                                <xsl:text>po </xsl:text>
                                                <xsl:value-of select="tei:residence[2]/@notBefore"/>
                                            </xsl:if>
                                            <xsl:text>:</xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:for-each select="tei:residence[2]/tei:location/tei:address/tei:settlement">
                                            <xsl:call-template name="povezavaKraj"/>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="tei:state[@type='maritalStatus']">
                                <xsl:variable name="stan" select="substring-after(tei:state[@type='maritalStatus']/@ana,'#')"/>
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Družinski stan: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="ancestor::tei:TEI/tei:teiHeader/tei:encodingDesc/tei:classDecl/tei:taxonomy[@xml:id='taxonomy.stan']/tei:category/tei:category[@xml:id = $stan]/tei:catDesc/tei:term[@xml:lang='sl']"/>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:for-each select="../tei:listRelation/tei:relation[@name='spouse'][tokenize(@mutual,' ') = concat('#',$ident)]">
                                <xsl:variable name="spouseID">
                                    <xsl:for-each select="./tokenize(@mutual,' ')">
                                        <!-- ker je samo eden zakonski partner, lahko drugega najdemo z variablo -->
                                        <xsl:if test="substring-after(.,'#') != $ident">
                                            <xsl:value-of select="substring-after(.,'#')"/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Zakonec: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ancestor::tei:listPerson/tei:person[@xml:id=$spouseID]">
                                            <a href="{concat('person.html?id=',@xml:id)}">
                                                <xsl:for-each select="tei:persName[1]">
                                                    <xsl:call-template name="imeOsebe"/>
                                                </xsl:for-each>
                                            </a>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:for-each>
                            <xsl:for-each select="../tei:listRelation/tei:relation[@name='parent'][tokenize(@active,' ') = concat('#',$ident)]">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Otroci: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:for-each-group select="." group-by="tokenize(./@passive,' ')">
                                            <xsl:for-each select="current-group()">
                                                <xsl:variable name="childID" select="substring-after(current-grouping-key(),'#')"/>
                                                <xsl:for-each select="ancestor::tei:listPerson/tei:person[@xml:id = $childID]">
                                                    <a href="{concat('person.html?id=',@xml:id)}">
                                                        <xsl:for-each select="tei:persName[1]">
                                                            <xsl:call-template name="imeOsebe"/>
                                                        </xsl:for-each>
                                                    </a>
                                                    <br/>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </xsl:for-each-group>
                                    </td>
                                </tr>
                            </xsl:for-each>
                            <xsl:for-each select="../tei:listRelation/tei:relation[@name='parent'][tokenize(@passive,' ') = concat('#',$ident)]">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Starši: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:for-each-group select="." group-by="tokenize(./@active,' ')">
                                            <xsl:for-each select="current-group()">
                                                <xsl:variable name="parentID" select="substring-after(current-grouping-key(),'#')"/>
                                                <xsl:for-each select="ancestor::tei:listPerson/tei:person[@xml:id = $parentID]">
                                                    <a href="{concat('person.html?id=',@xml:id)}">
                                                        <xsl:for-each select="tei:persName[1]">
                                                            <xsl:call-template name="imeOsebe"/>
                                                        </xsl:for-each>
                                                    </a>
                                                    <br/>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </xsl:for-each-group>
                                    </td>
                                </tr>
                            </xsl:for-each>
                            <xsl:for-each select="tei:note[@type='opomba']">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Opomba: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="."/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                            <xsl:for-each select="tei:note[@type='family']">
                                <tr>
                                    <td>
                                        <b>
                                            <xsl:text>Družina: </xsl:text>
                                        </b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="."/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="povezavaKraj">
        <xsl:choose>
            <xsl:when test="contains(@ref,'geonames')">
                <a href="{@ref}" target="_blank">
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:when test="contains(@ref,'dbpedia.org')">
                <xsl:variable name="refDbpedia" select="@ref"/>
                <xsl:variable name="dbpediaRDF" select="document($refDbpedia, /)"/>
                <a target="_blank">
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('https://maps.google.com/maps?q=',$dbpediaRDF/rdf:RDF/rdf:Description/geo:lat,',',$dbpediaRDF/rdf:RDF/rdf:Description/geo:long)"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:when test="@ana">
                <xsl:variable name="krajID" select="substring-after(@ana,'#')"/>
                <xsl:choose>
                    <xsl:when test="ancestor::tei:TEI/tei:teiHeader/tei:profileDesc/tei:settingDesc/tei:listPlace/tei:place[@xml:id=$krajID]/tei:location">
                        <a href="{translate(ancestor::tei:TEI/tei:teiHeader/tei:profileDesc/tei:settingDesc/tei:listPlace/tei:place[@xml:id=$krajID]/tei:location/tei:geo,' ',',')}" target="_blank">
                            <xsl:value-of select="."/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
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
