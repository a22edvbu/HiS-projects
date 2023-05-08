<?xml version="1.0" encoding="utf-8"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
      <table border="1">
        <xsl:for-each select="//NEWSPAPER">
          <tr>
            <xsl:for-each select="./@*">
              <td style="text-align: center; padding: 5px;">
                <xsl:value-of select="."/>
              </td>
            </xsl:for-each>
            <td>
              <table style="padding: 5px;">
                <xsl:for-each select="./ARTICLE">
                  <xsl:choose>
                    <xsl:when test="@DESCRIPTION='News'">
                      <tr style="padding: 5px; background-color:#f2c9bd; box-shadow: 2px 2px;">
                        <td style="padding: 10px;">
                          <table>
                            <tr>
                              <xsl:for-each select="./@*">
                                <td>
                                  <xsl:value-of select="."/>
                                </td>
                              </xsl:for-each>
                            </tr>
                          </table>
                          <xsl:apply-templates/>
                        </td>
                      </tr>
                    </xsl:when>
                    <xsl:otherwise test="@DESCRIPTION='Review'">
                      <tr style="padding: 5px; background-color:#bde3f2; box-shadow: 2px 2px;">
                        <td style="padding: 10px;">
                          <table>
                            <tr>
                              <xsl:for-each select="./@*">
                                <td>
                                  <xsl:value-of select="."/>
                                </td>
                              </xsl:for-each>
                            </tr>
                          </table>
                          <xsl:apply-templates/>
                        </td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
              </table>
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </xsl:template>
    <xsl:template match="HEADING">
      <h3 style="text-align: center;">
        <xsl:value-of select="."/>
      </h3>
    </xsl:template>
    <xsl:template match="STORY">
      <div>
        <xsl:for-each select="TEXT">
          <p>
            <xsl:value-of select="."/>
          </p>
        </xsl:for-each>
      </div>
    </xsl:template>
  </xsl:stylesheet>