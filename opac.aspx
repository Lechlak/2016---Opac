<%@ Page Language="VB" %>
<%@ Import Namespace=System.Web.UI  %>
<%@ Import Namespace=System.Xml  %>
<%@ Import Namespace=System.IO  %>

<!DOCTYPE html>

<script runat="server">
    
    Sub Page_Load()
        If Not Page.IsPostBack Then
            
            Dim mURL As String
            Dim mURL2 As String

mURL = "http://bookdb.nextgoodbook.com/v3/api/booklist/lid/43604001/nlid/23581/format/xml"
            
            
            Dim xmlDoc As New XmlDocument()
            
            xmlDoc.Load(mURL)
            
            Dim nodes As XmlNodeList = xmlDoc.DocumentElement.SelectNodes("/xml/books/book")
            
            
            
            Dim pId As String = ""
            Dim pIsbn As String = ""
            Dim pTitle As String = ""
            Dim pAuthor As String = ""
            Dim pTitleCk As String = ""
            Dim intCount As Integer = 0
            
            
            ltlBooks.Text = ltlBooks.Text & ("<div id=owl-carousel class=owl-carousel owl-theme>")
            


            For Each node As XmlNode In nodes

                pId = node.SelectSingleNode("id").InnerText
                pIsbn = node.SelectSingleNode("isbn").InnerText
                pTitle = node.SelectSingleNode("title").InnerText
                pAuthor = node.SelectSingleNode("author").InnerText


                If (pTitle = pTitleCk) Then
                Else


             <%--      Response.Write(pId & "<br>" & pIsbn & "<br>" & pTitle & "<br>" & pAuthor & "<br><br>") --%>
         
                    ltlBooks.Text = ltlBooks.Text & ("<div class=item><a href=http://bookdb.nextgoodbook.com/borrow/at/cd43303c6a75acf5b2e4e739a060de31/" & pIsbn & ">" & "<img width=100% src=http://contentcafe2.btol.com/ContentCafe/Jacket.aspx?UserID=TOL67950&Password=CC11779&Return=1&Type=L&Value=" & pIsbn & " /></a></div>")
                    
                    intCount = intCount + 1

                End If

                pTitleCk = pTitle

            Next
            
            ltlBooks.Text = ltlBooks.Text & ("</div>")
            
            
            
            <%-- ----------------- --%>
            
            
            
  <%-- DVDs --%>   
mURL2 = "http://bookdb.nextgoodbook.com/v3/api/custom/lid/43604001/nlid/105308/format/xml"
<%-- kids --%>          
mURL2 = "http://bookdb.nextgoodbook.com/v3/api/custom/lid/43604001/nlid/26575/format/xml"
        
            
            Dim xmlDoc2 As New XmlDocument()
            xmlDoc2.Load(mURL2)
            
            
            Dim nodes2 As XmlNodeList = xmlDoc2.DocumentElement.SelectNodes("/xml/books/book")


     
            Dim pId2 As String = ""
            Dim pIsbn2 As String = ""
            Dim pTitle2 As String = ""
            Dim pAuthor2 As String = ""
            Dim pTitleCk2 As String = ""
            Dim intCount2 As Integer = 0
            
            
            ltlBooks2.Text = ltlBooks2.Text & ("<div id=owl-carousel2 class=owl-carousel2 owl-theme>")
            
            

            For Each dvdnode As XmlNode In nodes2

                pId2 = dvdnode.SelectSingleNode("id").InnerText
                pIsbn2 = dvdnode.SelectSingleNode("isbn").InnerText
                pTitle2 = dvdnode.SelectSingleNode("title").InnerText
                pAuthor2 = dvdnode.SelectSingleNode("author").InnerText


                If (pTitle2 = pTitleCk2) Then
                Else



                    ltlBooks2.Text = ltlBooks2.Text & ("<div class=item><a href=http://bookdb.nextgoodbook.com/borrow/at/cd43303c6a75acf5b2e4e739a060de31/" & pIsbn2 & ">" & "<img width=100% src=http://contentcafe2.btol.com/ContentCafe/Jacket.aspx?UserID=TOL67950&Password=CC11779&Return=1&Type=L&Value=" & pIsbn2 & " /></a></div>")
                    
                    intCount2 = intCount2 + 1

                End If

                pTitleCk2 = pTitle2

            Next
            
            ltlBooks2.Text = ltlBooks2.Text & ("</div>")
            
            
            
            
            
            
        End If
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>DVD Carousel</title>
    <meta charset="utf-8">
    <meta name="viewport" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">


    <!-- Important Owl stylesheet -->
    <link rel="stylesheet" href="owl.carousel.css">

     
    <!--  jQuery 1.7+  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!--
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
-->
     
    <!-- Include js plugin -->
    <script src="owl.carousel.js"></script>


<script>
    

    $(document).ready(function() {
     
      $('#owl-carousel, #owl-carousel2').owlCarousel({
    	margin:10,
	    loop:true,
    	autoWidth:true,
	    items:4,
	    autoplay:true
		})
     
    });


</script>                             
                                   
	<script>
	  
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-15188833-1', 'auto');
	  ga('send', 'pageview');

	</script>
	
    <!-- Hotjar Tracking Code for images2.toledolibrary.org -->
<script>
    (function(h,o,t,j,a,r){
        h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
        h._hjSettings={hjid:100660,hjsv:5};
        a=o.getElementsByTagName('head')[0];
        r=o.createElement('script');r.async=1;
        r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
        a.appendChild(r);
    })(window,document,'//static.hotjar.com/c/hotjar-','.js?sv=');
</script>
</head>

	<body>
	<!-- Google Tag Manager -->
	<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-N9W5BG"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-N9W5BG');</script>
	<!-- End Google Tag Manager -->
    <form id="form1" runat="server">
    <div>
    <div class="header">WEEKLY STAFF PICKS</div>
        <asp:Literal ID="ltlBooks" runat="server"></asp:Literal>
    <div class="header2">STAFF PICKS FOR KIDS</div>
        <asp:Literal ID="ltlBooks2" runat="server"></asp:Literal>
    </div>
    </form>
<div id="footer"><img src="logo.png" /></div>
</body>
</html>
