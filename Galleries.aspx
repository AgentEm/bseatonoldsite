<%@ Page Language="C#" MasterPageFile="~/_private/layout/DefaultLayout.master" %>

<%@ Register Src="~/_private/usercontrols/GalleryViewer.ascx" TagName="GalleryViewer" TagPrefix="uc1" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" Runat="Server">
    <uc1:GalleryViewer ID="GalleryViewer1" runat="server" />
</asp:Content>

