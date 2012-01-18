<!-- Copyright 2012 UC Regents all Rights Reserved -->
<!-- BSD License at botton of file -->
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  version="1.0"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  xmlns:saxon="http://icl.com/saxon"
  exclude-result-prefixes="saxon"
  xmlns:a="http://github.com/tingletech/xsltscroll"
>
<a:md># XSLT Scroll
A tool attempting literate programming with XSLT

I would have called this literate XSLT, but that is too close to a
[claimed trademark](http://www.cranesoftwrights.com/ns/literate-xslt/index.htm) so
it is just XSLT Scroll.

## Example

```
xsltproc xsltscroll.xslt xsltscroll.xslt > README.md
```

## Annotation Elements

XSLT Scrool works by using annotation elements
`{http://github.com/tingletech/xsltscroll}:md` to hold text in the
[markdown](http://daringfireball.net/projects/markdown/) format.

This XSLT 1.0 XSLT will extract all the annotation elements and
combine them into one markdown document.

## Code Documentation
</a:md>
  <xsl:output 
    a:md="set output to text b/c output is not xml"
    method="text"
    encoding="utf-8"
  />

  <xsl:template match="/" a:md="root template">
    <xsl:apply-templates select="//a:md|//@a:md" mode="extract"/>
  </xsl:template>

  <xsl:template match="a:md" mode="extract"><xsl:text
  a:md="just copy `a:md` to result document">
</xsl:text>
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="@a:md" mode="extract"><xsl:text 
  a:md="format `@a:md` as a list; with line number, element, and comments">
 * (</xsl:text>
      <xsl:value-of select="saxon:line-number()"/>
      <xsl:text>): </xsl:text>
      <xsl:value-of select="name(..)"/>
      <xsl:text> *</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>*</xsl:text>
  </xsl:template>

<a:md>
## Copying
Copyright (c) 2012, Regents of the University of California
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

- Redistributions of source code must retain the above copyright notice, 
  this list of conditions and the following disclaimer.
- Redistributions in binary form must reproduce the above copyright notice, 
  this list of conditions and the following disclaimer in the documentation 
  and/or other materials provided with the distribution.
- Neither the name of the University of California nor the names of its
  contributors may be used to endorse or promote products derived from this 
  software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE.
</a:md>
</xsl:stylesheet>
