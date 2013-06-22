<?xml version='1.0'?> <!-- As XML file -->
<!-- Identify as a stylesheet -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Intend output for rendering by a web browser -->
<xsl:output method="html" />

<xsl:template match="/article">
<html>
    <head>
<!--         <link rel="stylesheet" type="text/css" href="good-preview.css" /> -->
        <xsl:call-template name="mathjax" />
    </head>
    <body>
        \(<xsl:value-of select="macros" />\)
        <div class="headerblock">
            <div class="title"><xsl:value-of select="title" /></div>
            <div class="author"><xsl:value-of select="author" /></div>
            <div class="email"><xsl:value-of select="email" /></div>
            <div class="department"><xsl:value-of select="department" /></div>
            <div class="institution"><xsl:value-of select="institution" /></div>
            <div class="date"><xsl:value-of select="date" /></div>
        </div>
        <xsl:apply-templates select="p|theorem|corollary|lemma" />
    </body>
</html>
</xsl:template>

<xsl:template match="theorem">
<xsl:apply-templates select="statement" />
<xsl:apply-templates select="proof" />
</xsl:template>

<xsl:template match="fact">
<xsl:apply-templates select="statement" />
</xsl:template>

<!-- Prepend to first paragraph -->
<xsl:template match="theorem/statement">
<b>Theorem: </b><xsl:apply-templates select="p"/>
</xsl:template>

<!-- Prepend to first paragraph -->
<xsl:template match="fact/statement">
<b>Corollary: </b><xsl:apply-templates select="p"/>
</xsl:template>

<!-- Prepend to first paragraph -->
<xsl:template match="proof">
<b>Proof: </b><xsl:apply-templates select="p"/>
</xsl:template>

<xsl:template match="p">
<p><xsl:apply-templates /></p>
</xsl:template>


<!-- Math  -->

<xsl:template match= "m">\(<xsl:value-of select="." />\)</xsl:template>

<xsl:template match="dm">\[<xsl:value-of select="." />\]</xsl:template>

<xsl:template match="am">\begin{align*}<xsl:value-of select="." />\end{align*}</xsl:template>






<xsl:template name="mathjax">
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
    tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]},
    TeX: {
    extensions: ["AMSmath.js", "AMSsymbols.js"]
    },
});
</script>
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML-full" />
</xsl:template>



</xsl:stylesheet>