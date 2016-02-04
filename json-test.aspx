<%@ Page Language="VB" %>
<%@ Import Namespace=System.Web.UI  %>
<%@ Import Namespace=System.Xml  %>
<%@ Import Namespace=System.IO  %>

<!DOCTYPE html>

<script runat="server">
    
    Sub Page_Load()
        If Not Page.IsPostBack Then
            
            Dim mURL As String

            mURL = "http://toledolibrary.evanced.info/signup/eventsxml.aspx?dm=xml&nd=365&isongoingvisible=true&lib=1000"

            Dim xmlDoc As New XmlDocument()
            xmlDoc.Load(mURL)
            Dim nodes As XmlNodeList = xmlDoc.DocumentElement.SelectNodes("/event/item")
            Dim pTitle As String = ""
            Dim pTitleCk As String = ""
            Dim pDate As String = ""
            Dim pTime As String = ""
            Dim pEndDate As String = ""
            Dim pDescription As String = ""
            Dim pLocation As String = ""
            Dim pLibrary As String = ""
            Dim pLink As String = ""
            Dim intCount As Integer = 0

            For Each node As XmlNode In nodes

                pTitle = node.SelectSingleNode("title").InnerText
                pDate = node.SelectSingleNode("date").InnerText
                pTime = node.SelectSingleNode("time").InnerText
                pEndDate = node.SelectSingleNode("enddate").InnerText
                pDescription = node.SelectSingleNode("description").InnerText
                pLocation = node.SelectSingleNode("location").InnerText
                pLibrary = node.SelectSingleNode("library").InnerText
                pLink = node.SelectSingleNode("link").InnerText

                If (pTitle = pTitleCk) Then
                Else

                    'Eliminate HTML tags
                    pDescription = pDescription.Replace("<p>", "")
                    pDescription = pDescription.Replace("</p>", "")
                    pDescription = pDescription.Replace("<br>", "")

                    Response.Write(pTitle & "<br>" & pDate & " (" & pTime & ")<br>")
                    Response.Write(pDescription & "<br>" & pLibrary & ":  " & pLocation & "<br><br>")

                    '<a href='" & pLink & "'>More Info</a><br><br>")

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
