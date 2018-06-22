<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/"> <!--this is matches to the first root elements of the xml file-->
		<html>
			<head>
				<title>XML Test</title>
			</head>
			<body>
				<table>
					<tbody>
						<tr>
							<th>Customer Info</th>
						</tr>
						<!--loop through each customer to get there information and display it-->
						<xsl:for-each select="telephoneBill/customer"> 
							<tr>
								<td>Name: <xsl:value-of select="name"/> </td>
							</tr>
							<tr>
								<td>Address: <xsl:value-of select="address"/> </td>
							</tr>
							<tr>
								<td>City: <xsl:value-of select="city"/> </td>
							</tr>
							<tr>
								<td>Province: <xsl:value-of select="province"/> </td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<!--give the table a small border-->
				<table border="1">
					<tbody>
						<tr>
							<!--heading for the table-->
							<th>Called Number</th>
							<th>Date</th>
							<th>Duration in Minutes</th>
							<th>Charge</th>
						</tr>
						<!--loop through and get individual call info-->
						<xsl:for-each select="telephoneBill/call">
						<!--call the template containing the layout for the call data table for each custoemr-->
							<xsl:call-template name="callInfo"/>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<!--template for the call data for each customer-->
	<xsl:template name="callInfo">
		<tr>
			<td><xsl:value-of select="@number"/></td>
			<td><xsl:value-of select="@date"/></td>
			<td><xsl:value-of select="@durationInMinutes"/></td>
			<td><xsl:value-of select="@charge"/></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
