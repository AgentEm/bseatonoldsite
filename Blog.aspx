<%@ Page Language="C#" MasterPageFile="~/_private/layout/DefaultLayout.master" ValidateRequest="false" %>

<%@ Register Src="~/_private/usercontrols/BlogList.ascx" TagName="BlogList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" Runat="Server">
    <uc1:BlogList ID="BlogList1" runat="server" />
</asp:Content>







