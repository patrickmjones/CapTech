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

		<article style="clear:both;">
			<h4>Share This - Buttons (large)</h4>
			<cap:ShareThisButtons runat="server" Publisher="ur-7c6ccffe-357-c8d2-84a9-3a6f5f9c7846" CssClass="share-this-widget">
			  <cap:ShareThisButton runat="server" DisplayText="Facebook" Service="Facebook" ButtonSize="Large" />
			  <cap:ShareThisButton runat="server" DisplayText="LinkedIn" Service="LinkedIn" ButtonSize="Large" />
			  <cap:ShareThisButton runat="server" DisplayText="Pinterest" Service="Pinterest" ButtonSize="Large" />
			  <cap:ShareThisButton runat="server" DisplayText="Twitter" Service="Twitter" ButtonSize="Large" />
			  <cap:ShareThisButton runat="server" DisplayText="Email" Service="Email" ButtonSize="Large" />
			</cap:ShareThisButtons>

			<h4>Share This - Buttons (small)</h4>
			<cap:ShareThisButtons  runat="server" Publisher="ur-7c6ccffe-357-c8d2-84a9-3a6f5f9c7846" CssClass="share-this-widget" ShareThisURL="http://www.google.com">
			  <cap:ShareThisButton runat="server" Service="Facebook" ButtonSize="Small" />
			  <cap:ShareThisButton runat="server" Service="LinkedIn" ButtonSize="Small" />
			  <cap:ShareThisButton runat="server" Service="Pinterest" ButtonSize="Small" ShareThisURL="http://www.bing.com" />
			  <cap:ShareThisButton runat="server" Service="Twitter" ButtonSize="Small" />
			  <cap:ShareThisButton runat="server" Service="Email" ButtonSize="Small" />
			</cap:ShareThisButtons>
		</article>
    </div>
    </form>
</body>
</html>
