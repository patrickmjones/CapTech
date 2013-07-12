<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CapTech.Demo.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Capitol Tech Demo's</title>
    <link type="text/css" rel="Stylesheet" href="styles/reset.css" />
    <link type="text/css" rel="Stylesheet" href="styles/default.css" />
</head>
<body>
    <form id="Form" runat="server">
    <div class="container">
        <h1>Tech Demos</h1>
        <h2>Social</h2>
        <h3>AddThis</h3>
        
        <article>
            <h4>Default Options</h4>
            <cap:AddThis runat="server" />
        </article>
        
        <article>
            <h4>Default Options with custom URL</h4>
            <cap:AddThis runat="server" URL="http://www.google.com" />
        </article>

        <article>
            <h4>Default Options Vertical Style Large</h4>
            <cap:AddThis runat="server" Orientation="Vertical" SocialStyle="Large" />
        </article>
    </div>
    </form>
</body>
</html>
