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
    
    <xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="no"/>
    
    <xsl:param name="path-general">https://www2.sistory.si/</xsl:param>
    <xsl:param name="path2json">https://www2.sistory.si/publikacije/fedora/Judje1937/</xsl:param>
    
    <xsl:param name="projectTitle">Popis judovskega prebivalstva</xsl:param>
    <xsl:param name="subTitle">Dravska banovina 1937</xsl:param>
    
    <xsl:param name="description">Popis Judov iz Dravske banovine leta 1937</xsl:param>
    <xsl:param name="keywords">popisi prebivalstva, Judje, Slovenija, 1937</xsl:param>
    
    <xsl:param name="outputDir">docs/</xsl:param>
    
    
    
    <xsl:template match="/">
        <xsl:result-document href="{$outputDir}index.html">
            <html lang="sl">
                <xsl:call-template name="head">
                    <xsl:with-param name="mode">home</xsl:with-param>
                </xsl:call-template>
                <body>
                    <xsl:call-template name="header-nav">
                        <xsl:with-param name="mode">home</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="container-view">
                        <xsl:with-param name="mode">home</xsl:with-param>
                    </xsl:call-template>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$outputDir}persons.html">
            <html lang="sl">
                <xsl:call-template name="head">
                    <xsl:with-param name="mode">persons</xsl:with-param>
                </xsl:call-template>
                <body>
                    <xsl:call-template name="header-nav">
                        <xsl:with-param name="mode">persons</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="container-view">
                        <xsl:with-param name="mode">persons</xsl:with-param>
                    </xsl:call-template>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$outputDir}person.html">
            <html lang="sl">
                <xsl:call-template name="head">
                    <xsl:with-param name="mode">person</xsl:with-param>
                </xsl:call-template>
                <body>
                    <xsl:call-template name="header-nav">
                        <xsl:with-param name="mode">person</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="container-view">
                        <xsl:with-param name="mode">person</xsl:with-param>
                    </xsl:call-template>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$outputDir}table-personal.html">
            <html lang="sl">
                <xsl:call-template name="head">
                    <xsl:with-param name="mode">table-personal</xsl:with-param>
                </xsl:call-template>
                <body>
                    <xsl:call-template name="header-nav">
                        <xsl:with-param name="mode">table-personal</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="container-view">
                        <xsl:with-param name="mode">table-personal</xsl:with-param>
                    </xsl:call-template>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$outputDir}table-nationality.html">
            <html lang="sl">
                <xsl:call-template name="head">
                    <xsl:with-param name="mode">table-nationality</xsl:with-param>
                </xsl:call-template>
                <body>
                    <xsl:call-template name="header-nav">
                        <xsl:with-param name="mode">table-nationality</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="container-view">
                        <xsl:with-param name="mode">table-nationality</xsl:with-param>
                    </xsl:call-template>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$outputDir}table-residence.html">
            <html lang="sl">
                <xsl:call-template name="head">
                    <xsl:with-param name="mode">table-residence</xsl:with-param>
                </xsl:call-template>
                <body>
                    <xsl:call-template name="header-nav">
                        <xsl:with-param name="mode">table-residence</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="container-view">
                        <xsl:with-param name="mode">table-residence</xsl:with-param>
                    </xsl:call-template>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$outputDir}map-birth.html">
            <html lang="sl">
                <xsl:call-template name="head">
                    <xsl:with-param name="mode">map-birth</xsl:with-param>
                </xsl:call-template>
                <body>
                    <xsl:call-template name="header-nav">
                        <xsl:with-param name="mode">map-birth</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="container-view">
                        <xsl:with-param name="mode">map-birth</xsl:with-param>
                    </xsl:call-template>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$outputDir}map-domicile.html">
            <html lang="sl">
                <xsl:call-template name="head">
                    <xsl:with-param name="mode">map-domicile</xsl:with-param>
                </xsl:call-template>
                <body>
                    <xsl:call-template name="header-nav">
                        <xsl:with-param name="mode">map-domicile</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="container-view">
                        <xsl:with-param name="mode">map-domicile</xsl:with-param>
                    </xsl:call-template>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$outputDir}map-residence.html">
            <html lang="sl">
                <xsl:call-template name="head">
                    <xsl:with-param name="mode">map-residence</xsl:with-param>
                </xsl:call-template>
                <body>
                    <xsl:call-template name="header-nav">
                        <xsl:with-param name="mode">map-residence</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="container-view">
                        <xsl:with-param name="mode">map-residence</xsl:with-param>
                    </xsl:call-template>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="head">
        <xsl:param name="mode"/>
        <head>
            <meta charset="utf-8"></meta>
            <meta content="IE=edge" http-equiv="X-UA-Compatible"></meta>
            <meta content="width=device-width, initial-scale=1" name="viewport"></meta>
            <meta name="description"
                content="{$description}"/>
            <meta name="keywords" content="{$keywords}"/>
            <title>
                <xsl:value-of select="$projectTitle"/>
            </title>
            <link href="{concat($path-general,'publikacije/themes/bootstrap/3.3.7/css/bootstrap.min.css')}" rel="stylesheet" type="text/css"/>
            <link href="{concat($path-general,'publikacije/themes/css/bootstrap/3/sidih.css')}" rel="stylesheet" type="text/css"/>
            <xsl:if test="contains($mode,'map-')">
                <style type="text/css">
                    #map {
                    width: 100%;
                    height: 700px;
                    border: 1px solid #000;
                    }
                    ul.infoWindow {
                    width: 350px;
                    list-style-type: circle;
                    }
                    ul.infoWindow p {
                    font-weight:bold;
                    }
                    
                    #progress {
                    display: none;
                    position: absolute;
                    z-index: 1000;
                    left: 400px;
                    top: 300px;
                    width: 200px;
                    height: 20px;
                    margin-top: -20px;
                    margin-left: -100px;
                    background-color: #fff;
                    background-color: rgba(255, 255, 255, 0.7);
                    border-radius: 4px;
                    padding: 2px;
                    }
                    
                    #progress-bar {
                    width: 0;
                    height: 100%;
                    background-color: #76A6FC;
                    border-radius: 4px;
                    }
                </style>
            </xsl:if>
            <xsl:if test="contains($mode,'table-')">
                <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/dt-1.10.15/datatables.min.css"/>
            </xsl:if>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js">//</script>
            <script src="{concat($path-general,'publikacije/themes/bootstrap/3.3.7/js/bootstrap.min.js')}">//</script>
            <script src="{concat($path-general,'publikacije/themes/plugin/jquery.sticky-kit/jquery.sticky-kit.min.js')}">//</script>
            <xsl:if test="$mode = 'persons'">
                <script src="list.min.js">//</script>
            </xsl:if>
            <xsl:if test="contains($mode,'map-')">
                <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
                    integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
                    crossorigin=""/>
                <script type="text/javascript" src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
                    integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
                    crossorigin="">//</script>
                
                <link rel="stylesheet" href="{concat($path-general,'publikacije/themes/plugin/Leaflet.markercluster/1.4.1/MarkerCluster.css')}" />
                <link rel="stylesheet" href="{concat($path-general,'publikacije/themes/plugin/Leaflet.markercluster/1.4.1/MarkerCluster.Default.css')}" />
                <script type="text/javascript" src="{concat($path-general,'publikacije/themes/plugin/Leaflet.markercluster/1.4.1/leaflet.markercluster-src.js')}"></script>
            </xsl:if>
            
            <xsl:if test="contains($mode,'table-')">
                <script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.15/datatables.min.js">//</script>
            </xsl:if>
            
            <script type="text/javascript">$(document).ready(function(){$(&quot;#nav&quot;).stick_in_parent()});</script>
            <script type="text/javascript">$(document).ready(function(){$(&quot;.stickybox&quot;).stick_in_parent({offset_top:50})});</script>
            <script type="text/javascript">function showDetails(pid, ref) {var url = &quot;/archive/objects/&quot; + pid + &quot;/methods/sdef:TEI/get?mode=&quot; + ref; $(&quot;#infobox&quot;).load(url);}</script>
        </head>
    </xsl:template>
    
    <xsl:template name="header-nav">
        <xsl:param name="mode"/>
        <!-- Header -->
        <header>
            <div class="container">
                <div class="row">
                    <div class="col-xs-8">
                        <h1>
                            <xsl:value-of select="$projectTitle"/>
                        </h1>
                        <h2>
                            <xsl:value-of select="$subTitle"/>
                        </h2>
                    </div>
                    <div class="col-xs-4">
                        <!-- začasno odstranim logo -->
                        <!--<div class="unilogo">
                            <a href="http://sistory.si" class="unilogo">
                                <img class="logoUni"
                                    src="http://www.sistory.si/images/index/logo-bw.png"
                                    height="62" title="Zgodovina Slovenije - SIstory" alt="Zgodovina Slovenije - SIstory"/>
                            </a>
                        </div>-->
                    </div>
                </div>
            </div>
        </header>
        <!-- Navbar -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" id="nav"
            height="50px">
            <div class="container" height="50px">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar" xml:space="preserve"> </span>
                        <span class="icon-bar" xml:space="preserve"> </span>
                        <span class="icon-bar" xml:space="preserve"> </span>
                    </button>
                    <a class="navbar-brand hidden-lg hidden-md hidden-sm" href="#">Navigacija</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <xsl:call-template name="title-bar-list-of-contents">
                            <xsl:with-param name="mode" select="$mode"/>
                        </xsl:call-template>
                    </ul>
                </div>
            </div>
        </nav>
    </xsl:template>
    
    <xsl:template name="title-bar-list-of-contents">
        <xsl:param name="mode"/>
        <!-- naslovna stran - mode = home -->
        <li>
            <xsl:if test="$mode = 'home'">
                <xsl:attribute name="class">active</xsl:attribute>
            </xsl:if>
            <a href="index.html">Domov</a>
        </li>
        <!-- seznam oseb -->
        <li>
            <xsl:if test="$mode = 'persons'">
                <xsl:attribute name="class">active</xsl:attribute>
            </xsl:if>
            <a href="persons.html">Poimenski seznam</a>
        </li>
        <!-- tabele -->
        <li class="dropdown">
            <xsl:if test="contains($mode,'table-')">
                <xsl:attribute name="class">active dropdown</xsl:attribute>
            </xsl:if>
            <a class="dropdown-toggle disabled" data-toggle="dropdown"
                role="button" aria-haspopup="true" aria-expanded="false">Tabele
                <span class="caret" xml:space="preserve"> </span></a>
            <ul class="dropdown-menu">
                <li>
                    <xsl:if test="$mode = 'table-personal'">
                        <xsl:attribute name="class">active</xsl:attribute>
                    </xsl:if>
                    <a href="table-personal.html">Osebni podatki</a>
                </li>
                <li>
                    <xsl:if test="$mode = 'table-nationality'">
                        <xsl:attribute name="class">active</xsl:attribute>
                    </xsl:if>
                    <a href="table-nationality.html">Državljanstvo</a>
                </li>
                <li>
                    <xsl:if test="$mode = 'table-residence'">
                        <xsl:attribute name="class">active</xsl:attribute>
                    </xsl:if>
                    <a href="table-residence.html">Kraj popisovanja</a>
                </li>
            </ul>
        </li>
        <!-- zemljevidi -->
        <li class="dropdown">
            <xsl:if test="contains($mode,'map-')">
                <xsl:attribute name="class">active dropdown</xsl:attribute>
            </xsl:if>
            <a class="dropdown-toggle disabled" data-toggle="dropdown"
                role="button" aria-haspopup="true" aria-expanded="false">Zemljevidi
                <span class="caret" xml:space="preserve"> </span></a>
            <ul class="dropdown-menu">
                <li>
                    <xsl:if test="$mode = 'map-birth'">
                        <xsl:attribute name="class">active</xsl:attribute>
                    </xsl:if>
                    <a href="map-birth.html">Kraji rojstva</a>
                </li>
                <li>
                    <xsl:if test="$mode = 'map-domicile'">
                        <xsl:attribute name="class">active</xsl:attribute>
                    </xsl:if>
                    <a href="map-domicile.html">Domovinska pravica</a>
                </li>
                <li>
                    <xsl:if test="$mode = 'map-residence'">
                        <xsl:attribute name="class">active</xsl:attribute>
                    </xsl:if>
                    <a href="map-residence.html">Kraji bivanja</a>
                </li>
            </ul>
        </li>
    </xsl:template>
    
    <xsl:template name="container-view">
        <xsl:param name="mode"/>
        <main class="container view">
            <xsl:choose>
                <!-- podatki o posamezni osebi -->
                <xsl:when test="$mode = 'person'">
                    <xsl:call-template name="person"/>
                </xsl:when>
                <xsl:when test="$mode = 'home'">
                    <xsl:call-template name="home"/>
                </xsl:when>
                <xsl:when test="$mode = 'persons'">
                    <xsl:call-template name="persons"/>
                </xsl:when>
                <xsl:when test="$mode = 'table-personal'">
                    <xsl:call-template name="table-personal"/>
                </xsl:when>
                <xsl:when test="$mode = 'table-nationality'">
                    <xsl:call-template name="table-nationality"/>
                </xsl:when>
                <xsl:when test="$mode = 'table-residence'">
                    <xsl:call-template name="table-residence"/>
                </xsl:when>
                <xsl:when test="$mode = 'map-birth'">
                    <xsl:call-template name="map-birth"/>
                </xsl:when>
                <xsl:when test="$mode = 'map-domicile'">
                    <xsl:call-template name="map-domicile"/>
                </xsl:when>
                <xsl:when test="$mode = 'map-residence'">
                    <xsl:call-template name="map-residence"/>
                </xsl:when>
            </xsl:choose>
        </main>
    </xsl:template>
    
    <!-- seznam oseb -->
    <xsl:template name="persons">
        <section class="row equalheight up down">
            <article class="col-md-9">
                <div class="panel">
                    <h3>Poimenski seznam žrtev</h3>
                    <div id="persons-list">
                        <input class="search" placeholder="Točno iskanje" />
                        <input type="text" class="fuzzy-search" placeholder="Približno iskanje" />
                        <ul class="list">
                            <xsl:for-each select="tei:TEI/tei:text/tei:body/tei:listPerson/tei:person">
                                <xsl:sort select="concat(tei:persName[1]/tei:surname[1],tei:persName[1]/tei:forename[1])" lang="sl"/>
                                <li>
                                    <span class="persname">
                                        <xsl:for-each select="tei:persName[1]">
                                            <xsl:call-template name="imeOsebe"/>
                                        </xsl:for-each>
                                    </span>
                                    <xsl:text> [</xsl:text>
                                    <a href="{concat('person.html?id=',@xml:id)}" target="_blank">opis</a>
                                    <xsl:text>]</xsl:text>
                                </li>
                                
                                
                            </xsl:for-each>
                        </ul>
                    </div>
                    <script>
                        var monkeyList = new List('persons-list', { 
                        valueNames: [ 'persname' ], 
                        plugins: [ ListFuzzySearch() ] 
                        });
                    </script>
                    <script>
                        var options = {
                        valueNames: [ 'persname' ]
                        };
                        var userList = new List('persons-list', options);
                    </script>
                </div>
            </article>
        </section>
    </xsl:template>
    
    <!-- podatki o posamezni osebi (izpisani na eni strani) -->
    <xsl:template name="person">
        <section class="row down">
            <article class="col-md-8">
                <script type="text/javascript" src="SaxonJS.min.js">//</script>
                <xsl:text disable-output-escaping="yes"><![CDATA[<script>
                   window.onload = function() {
                   SaxonJS.transform({
                   stylesheetLocation: "person.sef",
                   sourceLocation: "listPerson-Jews-1937.xml"
                  });
                }     
                </script>]]></xsl:text>
                
                <div id="person"/>
            </article>
        </section>
    </xsl:template>
    
    <!-- naslovna stran - mode = home -->
    <xsl:template name="home">
        
    </xsl:template>
    
    <xsl:template name="table-personal">
        <section class="row equalheight up down">
            <article>
                <div class="panel">
                    <h3>Pregled osebnih podatkov popisanih oseb</h3>
                    
                    <script type="text/javascript" src="{concat($path2json,'table-personal.js')}">//</script>
                    
                    <div class="table-responsive">
                        <table id="tablePersonal" class="table display"
                            data-order="[[ 1, &#34;asc&#34; ]]" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                                    <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>
                                    <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>
                                    <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>
                                    <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>
                                </tr>
                                <tr>
                                    <th>Zaporedje</th>
                                    <th>Ime</th>
                                    <th>Rojen</th>
                                    <th>Kraj rojstva</th>
                                    <th>Stan</th>
                                    <th>Poklic</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="tei:TEI/tei:text/tei:body/tei:listPerson/tei:person">
                                    <tr>
                                        <td>
                                            <a href="{concat('person.html?id=',@xml:id)}" target="_blank">
                                                <xsl:value-of select="number(position())"/>
                                            </a>
                                        </td>
                                        <td>
                                            <xsl:for-each select="tei:persName[1]">
                                                <xsl:call-template name="imeOsebe"/>
                                            </xsl:for-each>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="contains(tei:birth/tei:date/@when,'-')">
                                                    <xsl:value-of select="tokenize(tei:birth/tei:date/@when,'-')[1]"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="tei:birth/tei:date/@when"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td>
                                            <xsl:value-of select="tei:birth/tei:placeName"/>
                                        </td>
                                        <td>
                                            <xsl:variable name="stan" select="substring-after(tei:state[@type='maritalStatus']/@ana,'#')"/>
                                            <xsl:value-of select="ancestor::tei:TEI/tei:teiHeader/tei:encodingDesc/tei:classDecl/tei:taxonomy[@xml:id='taxonomy.stan']/tei:category/tei:category[@xml:id = $stan]/tei:catDesc/tei:term[@xml:lang='sl']"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="tei:occupation"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </article>
        </section>
    </xsl:template>
    
    <xsl:template name="table-nationality">
        <section class="row equalheight up down">
            <article>
                <div class="panel">
                    <h3>Pregled popisanih oseb glede na državljanstvo in domovinsko pravico</h3>
                    
                    <script type="text/javascript" src="{concat($path2json,'table-nationality.js')}">//</script>
                    
                    <div class="table-responsive">
                        <table id="tableNationality" class="table display"
                            data-order="[[ 1, &#34;asc&#34; ]]" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                                    <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>
                                    <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>
                                    <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>
                                </tr>
                                <tr>
                                    <th>Zaporedje</th>
                                    <th>Ime</th>
                                    <th>Državljanstvo</th>
                                    <th>Domovinska pravica</th>
                                    <th>Od kdaj biva</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="tei:TEI/tei:text/tei:body/tei:listPerson/tei:person">
                                    <tr>
                                        <td>
                                            <a href="{concat('person.html?id=',@xml:id)}" target="_blank">
                                                <xsl:value-of select="number(position())"/>
                                            </a>
                                        </td>
                                        <td>
                                            <xsl:for-each select="tei:persName[1]">
                                                <xsl:call-template name="imeOsebe"/>
                                            </xsl:for-each>
                                        </td>
                                        <td>
                                            <xsl:variable name="narodnost" select="substring-after(tei:nationality/@ana,'#')"/>
                                            <xsl:value-of select=" ancestor::tei:TEI/tei:teiHeader/tei:encodingDesc/tei:classDecl/tei:taxonomy[@xml:id='taxonomy.drzavljanstvo']/tei:category/tei:category[@xml:id = $narodnost]/tei:catDesc/tei:term"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="tei:state[@type='rightOfDomicile']/tei:desc/tei:placeName"/>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="contains(tei:residence[1]/tei:location/tei:settlement[1]/@from,'-')">
                                                    <xsl:value-of select="tokenize(tei:residence[1]/tei:location/tei:settlement[1]/@from,'-')[1]"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="tei:residence[1]/tei:location/tei:settlement[1]/@from"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </article>
        </section>
    </xsl:template>
    
    <xsl:template name="table-residence">
        <section class="row equalheight up down">
            <article>
                <div class="panel">
                    <h3>Pregled popisanih oseb glede na kraj popisovanja (bivanja)</h3>
                    
                    <script type="text/javascript" src="{concat($path2json,'table-residence.js')}">//</script>
                    
                    <div class="table-responsive">
                        <table id="tableResidence" class="table display"
                            data-order="[[ 1, &#34;asc&#34; ]]" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                                    <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>
                                    <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>
                                    <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>
                                </tr>
                                <tr>
                                    <th>Zaporedje</th>
                                    <th>Ime</th>
                                    <th>Okraj</th>
                                    <th>Občina</th>
                                    <th>Kraj</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="tei:TEI/tei:text/tei:body/tei:listPerson/tei:person">
                                    <tr>
                                        <td>
                                            <a href="{concat('person.html?id=',@xml:id)}" target="_blank">
                                                <xsl:value-of select="number(position())"/>
                                            </a>
                                        </td>
                                        <td>
                                            <xsl:for-each select="tei:persName[1]">
                                                <xsl:call-template name="imeOsebe"/>
                                            </xsl:for-each>
                                        </td>
                                        <td>
                                            <xsl:value-of select="tei:residence[1]/tei:location/tei:address/tei:region[@type='district']"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="tei:residence[1]/tei:location/tei:address/tei:region[@type='municipality']"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="tei:residence[1]/tei:location/tei:address/tei:settlement"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </article>
        </section>
    </xsl:template>
    
    <xsl:template name="map-birth">
        <section class="row equalheight up down">
            <article>
                <div class="panel">
                    <h3>Zemljevid krajev rojstva</h3>
                    <script type="text/javascript" src="map-birth.js">//</script>
                    <div id="map"></div>
                    <script type="text/javascript" src="map.js">//</script>
                </div>
            </article>
        </section>
    </xsl:template>
    
    <xsl:template name="map-domicile">
        <section class="row equalheight up down">
            <article>
                <div class="panel">
                    <h3>Zemljevid občin, kjer so imeli domovinsko pravico</h3>
                    <script type="text/javascript" src="map-domicile.js">//</script>
                    <div id="map"></div>
                    <script type="text/javascript" src="map.js">//</script>
                </div>
            </article>
        </section>
    </xsl:template>
    
    <xsl:template name="map-residence">
        <section class="row equalheight up down">
            <article>
                <div class="panel">
                    <h3>Zemljevid krajev bivanja</h3>
                    <script type="text/javascript" src="map-residence.js">//</script>
                    <div id="map"></div>
                    <script type="text/javascript" src="map.js">//</script>
                </div>
            </article>
        </section>
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
    
</xsl:stylesheet>