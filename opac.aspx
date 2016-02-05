<%@ Page Language="VB" %>
<%@ Import Namespace=System.Web.UI  %>
<%@ Import Namespace=System.Xml  %>
<%@ Import Namespace=System.IO  %>

<!DOCTYPE html>

<script runat="server">
    
    Sub Page_Load()
        If Not Page.IsPostBack Then
            
            Dim mURL As String

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
            
            Response.Write("<div id=owl-demo class=owl-carousel owl-theme>")


            For Each node As XmlNode In nodes

                pId = node.SelectSingleNode("id").InnerText
                pIsbn = node.SelectSingleNode("isbn").InnerText
                pTitle = node.SelectSingleNode("title").InnerText
                pAuthor = node.SelectSingleNode("author").InnerText


                If (pTitle = pTitleCk) Then
                Else


             <%--      Response.Write(pId & "<br>" & pIsbn & "<br>" & pTitle & "<br>" & pAuthor & "<br><br>") --%>
         
                    Response.Write("<div class=item><a href=http://bookdb.nextgoodbook.com/borrow/at/cd43303c6a75acf5b2e4e739a060de31/" & pIsbn & ">" & "<img width=100% src=http://contentcafe2.btol.com/ContentCafe/Jacket.aspx?UserID=TOL67950&Password=CC11779&Return=1&Type=L&Value=" & pIsbn & " /></a></div>")
                    
                    intCount = intCount + 1

                End If

                pTitleCk = pTitle

            Next
            
            Response.Write("</div>")
            
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
     
    <!-- Include js plugin -->
    <script src="owl.carousel.js"></script>


<script>
    

    $(document).ready(function() {
     
      //var owl = $("#owl-demo");
     
      $('.owl-carousel').owlCarousel({
    	margin:10,
	    loop:true,
    	autoWidth:true,
	    items:4,
	    autoplay:true
		})
     
    });


</script>                             
                                   
</head>
<body>
<div id="header"><img src="logo.png" /> WEEKLY STAFF PICKS </div>
    <form id="form1" runat="server">
    <div>
        
    </div>
    </form>
</body>
</html>
