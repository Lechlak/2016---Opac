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


            For Each node As XmlNode In nodes

                pId = node.SelectSingleNode("id").InnerText
                pIsbn = node.SelectSingleNode("isbn").InnerText
                pTitle = node.SelectSingleNode("title").InnerText
                pAuthor = node.SelectSingleNode("author").InnerText


                If (pTitle = pTitleCk) Then
                Else


             <%--      Response.Write(pId & "<br>" & pIsbn & "<br>" & pTitle & "<br>" & pAuthor & "<br><br>") --%>
         
                    Response.Write("<a href=http://bookdb.nextgoodbook.com/borrow/at/cd43303c6a75acf5b2e4e739a060de31/" & pIsbn & ">" & "<img src=http://contentcafe2.btol.com/ContentCafe/Jacket.aspx?UserID=TOL67950&Password=CC11779&Return=1&Type=L&Value=" & pIsbn & " /></a>")
                    
                    intCount = intCount + 1

                End If

                pTitleCk = pTitle

            Next
            
            
        End If
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div >
        
    </div>
    </form>
</body>
</html>
