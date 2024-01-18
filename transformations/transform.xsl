<xsl:stylesheet 
          version="1.0"
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" indent="no"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/html/head/title">
    <xsl:text>
      \documentclass[a4paper]{article}
      \usepackage{graphicx}
      \usepackage[dvipsnames]{xcolor}
      \input pdflatexcore
      \begin{document}
\myheader{Created by Janusz R. Getta, School of Computing and Information Technology, University of Wollongong \newline Building 3, room 2120, ext 4339, jrg@uow.edu.au, http://www.uow.edu.au/\mytilda jrg}</xsl:text>     
  </xsl:template>
  
  <xsl:template match="/html/body/slides/slide/aside">
    <xsl:text>\header{</xsl:text><xsl:value-of select="."/><xsl:text>}\boldline</xsl:text>
  </xsl:template>
  
  <xsl:template match="/html/body/slides/slide/hgroup/h2">
    <xsl:text>\textcolor{Green}{ \header{</xsl:text><xsl:value-of select="."/><xsl:text>} } </xsl:text>
  </xsl:template>

  <xsl:template match="/html/body/slides/slide/hgroup/h3">    
    <xsl:text>\textcolor{Red}{\subheader{</xsl:text><xsl:value-of select="."/><xsl:text>}}</xsl:text>
  </xsl:template>

    <xsl:template match="/html/body/slides/slide/article/ul/lia">
  <xsl:text>\tocstep{</xsl:text><xsl:value-of select="."/><xsl:text>}</xsl:text> 
    </xsl:template>

    <xsl:template match="/html/body/slides/slide/article/ul/lia[@class]">
  <xsl:text>\textcolor{Red}{\tocstep{</xsl:text><xsl:value-of select="."/><xsl:text>}}</xsl:text> 
    </xsl:template>    

    <xsl:template match="/html/body/slides/slide/article/footer">
          <xsl:text>\boldline</xsl:text>
    </xsl:template>
    
    <xsl:template match="/html/body/slides/slide/article/ul/li/text()">
      <xsl:text>\parbegin </xsl:text>  
      <xsl:value-of select="."/>
      <xsl:text>\newline</xsl:text>
    </xsl:template>

    <xsl:template match="/html/body/slides/slide/article/ul/li/a">
      <xsl:text>(\textcolor{RoyalBlue}{\underline{</xsl:text>  
      <xsl:value-of select="@href"/>
      <xsl:text>}})</xsl:text>
      <xsl:text>\newline</xsl:text>      
    </xsl:template>


    <xsl:template match="/html/body/slides/slide/article/ul/li/ul/li/text()">
      <xsl:text>\parbegin \indent </xsl:text>
      <xsl:text>- </xsl:text>
      <xsl:value-of select="."/>      
      <xsl:text>\newline</xsl:text>
    </xsl:template>

    <xsl:template match="/html/body/slides/slide/article/ul/li/ul/p/img">
      <xsl:text>\parbegin </xsl:text>
<xsl:text>
\begin{figure}[ht]
\centering
\includegraphics[scale=</xsl:text><xsl:value-of select="@width div 1000"/><xsl:text>]{../</xsl:text> <xsl:value-of select="@src"/><xsl:text>}
\end{figure}
</xsl:text>
     <xsl:text>\parend </xsl:text>     
    </xsl:template>
   
    <xsl:template match="/html/body/slides/slide/article/ul/li/ul/pre">
      <xsl:text>\parbegin\begingroup
\parindent=0pt
\relax
\obeyspaces
\let =\
\obeylines 
\sql{</xsl:text>
<xsl:value-of select="."/>
<xsl:text>}\endgroup\parend</xsl:text>
  </xsl:template>


    
  <xsl:template match="/html/body/slides/slide[@class]">
    <xsl:text>\end{document}</xsl:text>
  </xsl:template>

  
</xsl:stylesheet>
