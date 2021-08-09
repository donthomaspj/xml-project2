<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" indent="yes"/>

	<xsl:param name="number" select="'20'" />
	<xsl:param name="streetName" select="'NB'" />

	<xsl:template match="/">
		<html>
			<body>
				<h1>
					<font face="Verdana">
						Route: <xsl:value-of select="$number"/>
					</font>
				</h1>
				<h1>
					<font face="Verdana">
						Stop: <xsl:value-of select="$streetName"/>
					</font>
				</h1>
				<!--<h1>hello <xsl:value-of select="count(//stop[routes=contains(routes, 20)] and //stop[@name=contains(@name, 'NB')])"/></h1>-->
				<h2>Stops Found: <xsl:value-of select="count(//stop[contains(routes, $number) and contains(@name, $streetName)]) "/></h2>
				<table style="width:720px" border="3">
					<tr>
						<th>
							<font face="Verdana" size="4">Stop#</font>
						</th>
						<th>
							<font face="Verdana" size="4">Stop Name</font>
						</th>
						<th>
							<font face="Verdana" size="4">Latitude</font>
						</th>
						<th>
							<font face="Verdana" size="4">Longitude</font>
						</th>
						<th>
							<font face="Verdana" size="4">Routes</font>
						</th>
					</tr>
					<xsl:apply-templates select ="london-transit-data/stop">
						<xsl:sort select="./@id" data-type="number" order="ascending"/>
					</xsl:apply-templates>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="stop">
		<xsl:if test="routes = contains(routes, $number)">
			<!--<xsl:if test="./total-fat = contains(./total-fat, 10)">-->
			<xsl:if test="@name = contains(@name, $streetName)">
				<xsl:element name="tr">
					<xsl:element name="td">
						<!--<xsl:value-of select="count(SPEECH[SPEAKER=$character]/LINE)"/>-->
						<xsl:value-of select="@id" />
					</xsl:element>
					<xsl:element name="td">
						<xsl:value-of select="@name"/>
					</xsl:element>
					<xsl:element name="td">
						<xsl:value-of select="location/@lattitude"/>
					</xsl:element>
					<xsl:element name="td">
						<xsl:value-of select="location/@longitude"/>
					</xsl:element>
					<xsl:element name="td">
						<xsl:value-of select="routes"/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
		</xsl:if>
	</xsl:template>


</xsl:stylesheet>

