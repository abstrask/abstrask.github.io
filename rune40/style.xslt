<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
  <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
  <xsl:variable name="podcastLink">
    <xsl:value-of select="concat('podcast://', substring-after(/rss/channel/link, '://'))"/>
  </xsl:variable>
  <xsl:variable name="description">
    <xsl:value-of select="/rss/channel/description"/>
    <!-- <xsl:value-of select="/rss/channel/description" disable-output-escaping="yes"/> -->
  </xsl:variable>

    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title><xsl:value-of select="/rss/channel/title"/></title>
		<link rel="icon" type="image/x-icon" href="./favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <link rel="stylesheet" href="style.css" />
      </head>
      <body>
        <div class="head inner">
          <img src="cover.jpg" class="head_logo"/>
          <!-- <xsl:if test="/rss/channel/image"> -->
          <!-- </xsl:if> -->
          <div class="head_main">
            <h1><xsl:value-of select="/rss/channel/title"/></h1>

            <!-- <p><xsl:value-of select="$description"/></p> -->

            <!-- <xsl:copy>
              <xsl:for-each select="tokenize($description, '\r?\n')">
                line: <xsl:sequence select="."/>
              </xsl:for-each>
            </xsl:copy> -->

            <!-- <xsl:text>
              Hey &amp#xA;
              you
            </xsl:text> -->
            <p>Dette er en særproduktion af bogen, Frank vender hjem, lavet i anledning af Runes 40-års fødselsdag 2023.</p>

            <p>Idé, koncept og tilrettelæggelse: Signe Thydal<br/>
            Redigering og (enorm og uvurderlig) teknisk support: Rasmus Rask<br/>
            Oplæsere: 31 personer fra Runes familie og vennekreds</p>

            <p>Dejligste Mus!<br/>
            Kæmpe tillykke med fødselsdagen. Jeg vil med denne lydbogsproduktion gerne sige tak!<br/>
            Tak for ca. 1 million timers godnat historie. Både IRL og optagelser.<br/>
            Tak for dit dejlige, tålmodige, kærlige, åbne, modige og gavmilde væsen.<br/>
            Tak fordi du accepterer og elsker mig som jeg er - også når jeg falder i søvn under godnathistorie-oplæsning.<br/>
            Tak fordi du har bragt så mange dejlige mennesker ind i mit liv.<br/>
            Tak fordi du stadig kaster dig ud i nye eventyr og udfordringer, udvider din horisont og gør mig klogere samtidig.<br/>
            Tak for 7 helt fantastiske år fyldt med kærlighed, kultur, eventyr, udfordringer, udvikling, hygge, oplæsning og Matador.<br/>
            Tak for dig!</p>

            <p>Denne lydbog viser forhåbentlig også, at jeg ikke er den eneste, der er helt vild med dig &lt;3</p>

            <p>Rigtig god lyttelyst!<br/>
            Kys og kærlighed fra Miv</p>
          </div>
        </div>
        <xsl:if test="/rss/channel/atom:link[@rel='alternate']">
          <div class="links inner">
            <xsl:for-each select="/rss/channel/atom:link[@rel='alternate']">
              <a target="_blank">
                <xsl:attribute name="class">
                  <xsl:value-of select="@icon"/>
                </xsl:attribute>
                <xsl:attribute name="href">
                  <xsl:value-of select="@href"/>
                </xsl:attribute>
                <xsl:value-of select="@title"/>
              </a>
            </xsl:for-each>
          </div>
        </xsl:if>

        <p align="center"><a>
          <xsl:attribute name="href">
            <xsl:value-of select="$podcastLink"/>
          </xsl:attribute>
          Tilføj podcast
        </a></p>

        <p align="center">Når du har tilføjet podcasten, bør du gå ind i dens indstillinger, og ændre episoderækkefølge til &quot;Ældeste til nyeste&quot;</p>

        <xsl:for-each select="/rss/channel/item">
          <div class="item inner">
            <div class="item_meta">
              <xsl:if test="itunes:duration">
                <span><xsl:value-of select="itunes:duration" /></span>
              </xsl:if>
            </div>
            <h2>
              <a target="_blank">
                <xsl:attribute name="href">
                  <xsl:value-of select="link"/>
                </xsl:attribute>
                <xsl:value-of select="title"/>
              </a>
            </h2>
            <xsl:if test="description">
              <h3><xsl:value-of select="description" /></h3>
            </xsl:if>
            <xsl:if test="itunes:subtitle">
              <h3><xsl:value-of select="itunes:subtitle" /></h3>
            </xsl:if>
            <xsl:if test="itunes:duration">
              <audio controls="true" preload="none">
                <xsl:attribute name="src">
                  <xsl:value-of select="enclosure/@url"/>
                </xsl:attribute>
              </audio>
            </xsl:if>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
