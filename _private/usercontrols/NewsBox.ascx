<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsBox.ascx.cs" Inherits="_private_usercontrols_NewsBox" %>

<asp:SqlDataSource ID="sqlNewsBox" runat="server" ConnectionString="<%$ ConnectionStrings:BS_DB %>" 
SelectCommand="SELECT * FROM [BlogEntry] WHERE [ID_PK] = 0"  
UpdateCommand="UPDATE [BlogEntry] SET [PublishedDate] = @PublishedDate, [Content] = @Content WHERE [ID_PK] = @ID_PK" 
>

<UpdateParameters>    
<asp:Parameter Name="PublishedDate" Type="DateTime" />
<asp:Parameter Name="Content" Type="String" />
</UpdateParameters>

</asp:SqlDataSource> 


<asp:FormView ID="fvNewsBox" runat="server" DataKeyNames="ID_PK" DataSourceID="sqlNewsBox" Width="100%">
    
    <FooterTemplate></FooterTemplate>
    <ItemTemplate>
    
        <div class="NewsBox">        
            <div class="Header">
                <span class="Title"><%# Eval("Title") %></span>
                <span class="Date"><%# Eval("PublishedDate") %></span>
            </div>
            <div class="Content"><%# Eval("Content") %>
            <div class="clear"></div>
                <asp:Panel ID="pnlNewsBox_Controls" CssClass="Console" runat="server">
                    <asp:Button ID="lbNewsBox_Edit" Text="Edit" CommandName="edit" runat="server"/>
                </asp:Panel>
            </div>            
        </div>
    
    </ItemTemplate>
    
    <EditItemTemplate>

        <div class="NewsBox">
            <div class="Header">
                <span class="Title"><%# Eval("Title") %></span>
                <span class="Date"><%# Eval("PublishedDate") %></span>
            </div>
            <div class="Content"><asp:TextBox TextMode="MultiLine" CssClass="RichTextEditor" ID="tbNewsBoxUpdate_Content" runat="server" Text='<%# Bind("Content") %>' /><asp:RequiredFieldValidator runat="server" ID="valUpdate_Content" ControlToValidate="tbNewsBoxUpdate_Content" ErrorMessage="Content" Display="Static" /><div class="clear"></div>
                <div class="Console">
                    <div class="Buttons">
                    <asp:Button ID="lbNewsBoxUpdate_Save" Text="Save" CommandName="update" runat="server"/>
                    <asp:Button ID="lbNewsBoxUpdate_Cancel" Text="Cancel" CommandName="cancel" CausesValidation="false" runat="server"/>
                </div>
            </div>     
        </div>
        </div>

    </EditItemTemplate>
</asp:FormView>

