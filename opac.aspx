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
            
            Response.Write("<div id=owl-demo>")


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
    <link rel="stylesheet" href="owl-carousel/owl.carousel.css">
     
    <!-- Default Theme -->
    <link rel="stylesheet" href="owl-carousel/owl.theme.css">
     
    <!--  jQuery 1.7+  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
     
    <!-- Include js plugin -->
    <script src="assets/owl-carousel/owl.carousel.js"></script>


<script>
    

    $(document).ready(function() {
     
      var owl = $("#owl-demo");
     
      owl.owlCarousel({
         
          itemsCustom : [
            [0, 2],
            [450, 4],
            [600, 7],
            [700, 9],
            [1000, 10],
            [1200, 12],
            [1400, 13],
            [1600, 15]
          ],
          navigation : false
     
      });
     
    });


</script>                             
                                   
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    </div>
    </form>
    <style>
    

    #owl-demo .item{
        background: #42bdc2;
        padding: 30px 0px;
        margin: 5px;
        color: #FFF;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        text-align: center;
    }


</style>


    <div id="owl-demo" class="owl-carousel owl-theme">
  <div class="item"><h1>1</h1></div>
  <div class="item"><h1>2</h1></div>
  <div class="item"><h1>3</h1></div>
  <div class="item"><h1>4</h1></div>
  <div class="item"><h1>5</h1></div>
  <div class="item"><h1>6</h1></div>
  <div class="item"><h1>7</h1></div>
  <div class="item"><h1>8</h1></div>
  <div class="item"><h1>9</h1></div>
  <div class="item"><h1>10</h1></div>
  <div class="item"><h1>11</h1></div>
  <div class="item"><h1>12</h1></div>
  <div class="item"><h1>13</h1></div>
  <div class="item"><h1>14</h1></div>
  <div class="item"><h1>15</h1></div>
  <div class="item"><h1>16</h1></div>
  <div class="item"><h1>17</h1></div>
  <div class="item"><h1>18</h1></div>
  <div class="item"><h1>19</h1></div>
  <div class="item"><h1>20</h1></div>
</div>


</body>
</html>
