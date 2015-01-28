<%@ Page Language="C#" MasterPageFile="~/_private/layout/DefaultLayout.master" Title="Brendan Seaton - Home" ValidateRequest="false" %>

<%@ Register Src="_private/usercontrols/NewsBox.ascx" TagName="NewsBox" TagPrefix="uc3" %>

<%@ Register Src="_private/usercontrols/RotatingImage.ascx" TagName="RotatingImage"
    TagPrefix="uc2" %>

<%@ Register Src="_private/usercontrols/BlogList.ascx" TagName="BlogList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" Runat="Server">

<table cellpadding="0" cellspacing="0" width="100%">
<tr>
<td valign="top">
<div id="PhotoDisplay">
<table cellpadding="0" cellspacing="0" width="100%" height="100%">
<tr>
<td align="center" valign="middle">
<table cellpadding="0" cellspacing="0" class="inner">
<tr>
<td>
    <uc2:RotatingImage id="RotatingImage1" runat="server" />
</td></tr></table>
</td>
</tr></table>
</div>
</td>
<td valign="top">
<uc3:NewsBox id="NewsBox1" runat="server" />
</td>
</tr>
</table>

<h1>Brendan's Blog</h1>

<uc1:BlogList id="BlogList1" runat="server" isHomePage="true"></uc1:BlogList>    
    <!-- test -->
</asp:Content>



