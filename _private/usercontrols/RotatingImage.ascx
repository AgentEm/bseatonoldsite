<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RotatingImage.ascx.cs" Inherits="_private_usercontrols_RotatingImage" %>

<asp:SqlDataSource ID="sqlRandomImage" runat="server" ConnectionString="<%$ ConnectionStrings:BS_DB %>" SelectCommand="SELECT TOP 1 g.[Title] AS [gTitle], g.[ID_PK], p.[Title], p.[Url], p.[FrontPageWidth], p.[FrontPageHeight] FROM [Gallery] g, [Photo] p, [Gallery_Photo_XRef] x WHERE p.[ID_PK] = x.[FK_Photo] AND g.[ID_PK] = x.[FK_Gallery] AND g.[IsPublished] = '1' AND g.[IsDeleted] = '0' ORDER BY NEWID()" ></asp:SqlDataSource>

<asp:Repeater ID="repRandomImage" runat="server" DataSourceID="sqlRandomImage">
<ItemTemplate>

    <div class="galleryTitle"><asp:Literal runat="server" ID="litGalleryTitle" Text='<%# Eval("gTitle") %>' /></div>
    <asp:HyperLink ID="hlRandomImage" runat="server" NavigateUrl='<%# "~/Galleries.aspx?id=" + Eval("ID_PK") %>'>
    <asp:Image ID="imgRandomImage" runat="server" ImageUrl='<%# "~/_private/handlers/PhotoOutput.ashx?img=~/_private/content/galleries/" + Eval("Url") + "&w=" + Eval("FrontPageWidth") + "&h=" + Eval("FrontPageHeight")%>' />
    </asp:HyperLink>
    <div class="photoTitle"><asp:Literal runat="server" ID="litPhotoTitle" Text='<%# Eval("Title") %>' /></div>
    
</ItemTemplate>
</asp:Repeater>