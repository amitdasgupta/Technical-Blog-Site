<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : movies.xsl
    Created on : 7 April, 2018, 9:02 PM
    Author     : amit
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/collection">
        <html>
            <head>
                <title>MOVIES COLLECTION</title>
                <style>
                    body{
                    background: #43cea2;  /* fallback for old browsers */
                    background: -webkit-linear-gradient(to right, #185a9d, #43cea2);  /* Chrome 10-25, Safari 5.1-6 */
                    background: linear-gradient(to right, #185a9d, #43cea2); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

                    }
                    .fixed-header, .fixed-footer{
                    width: 100%;
                    position: fixed;        
                    background: #333;
                    padding: 10px 0px;
                    color: #fff;
                    }
                    .fixed-header{
                    top: 0;
                    }
                    .fixed-footer{
                    bottom: 0;
                    }
                    nav a{
                    color: #fff;
                    text-decoration: none;
                    padding: 7px 90px;
                    display: inline-block;
                    }

                </style>
            </head>
            <body>
                <div align="center" class="fixed-header">
                    <div class="container">
                        <nav>
                            <a href="index.html">Home</a>
                            <a href="signup.html">Sign Up</a>
                            <a href="shoppingcart/index.html">Products</a>
                            <a href="allservices.html">Services</a>
                            <a href="#cont_section">Contact Us</a>
                        </nav>
                    </div>
                </div>
                <div align="center"  style="margin-left:20%;margin-right:20%;margin-top:10%;">
                    <h1>MOVIES MUST BE WATCHED</h1>
                    <table border="1">
                        <tr>
                            <th>Title</th>
                            <th>Genre</th>
                            <th>Year</th>
                        </tr>
                        <xsl:for-each select="movie">
                            <tr>
                                <td>
                                    <xsl:value-of select="title"/>
                                </td>
                                <td >
                                    <xsl:value-of select="genre"/>
                                </td>
                                <td>
                                    <xsl:value-of select="year"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
 