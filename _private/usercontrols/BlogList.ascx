<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BlogList.ascx.cs" Inherits="_private_usercontrols_BlogList" %>

<asp:HyperLink ID="hlBlogArchive" runat="server" CssClass="rightNav" NavigateUrl="~/Blog.aspx" Text="View Complete Blog Archive >>" />

<asp:Label ID="lblMonthSelect" runat="server" CssClass="rightNav">View Archive by Month: 
    <asp:DropDownList id="ddlMonths" Font-Size="10px" Height="18px" runat="server" DataSourceID="sqlMonths" DataTextField="MM/YYYY" DataValueField="MM/YYYY" OnDataBound="ddlMonths_DataBound" /><asp:Button runat="server" Height="20px" Font-Size="12px" ID="btnBlogMonthGo" Text="Go" OnClick="btnBlogMonthGo_Click" />
</asp:Label>


<asp:SqlDataSource ID="sqlMonths" runat="server" ConnectionString="<%$ ConnectionStrings:BS_DB %>" />


   
<asp:SqlDataSource ID="sqlBlog" runat="server" ConnectionString="<%$ ConnectionStrings:BS_DB %>" 
SelectCommand="SELECT * FROM [BlogEntry] WHERE [IsDeleted] = '0' AND [ID_PK] > 0 ORDER BY [PublishedDate] DESC"
InsertCommand="INSERT INTO [BlogEntry] ([Title], [PublishedDate], [Content], [IsPublished]) VALUES (@Title, @PublishedDate, @Content, @IsPublished)"
>
    <InsertParameters>
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="PublishedDate" Type="DateTime" />
        <asp:Parameter Name="Content" Type="String" />
        <asp:Parameter Name="IsPublished" Type="Boolean" />
    </InsertParameters>
</asp:SqlDataSource>

<asp:FormView ID="fvBlogInsert" runat="server" DataKeyNames="ID_PK" DataSourceID="sqlBlog" Width="100%" OnItemCreated="fvBlogInsert_ItemCreated">
    <EmptyDataTemplate>
        <div class="BlogEntry">
        
        <div class="Console">
            <div class="Buttons">
            <div class="Upload">
                Upload an image: <asp:FileUpload ID="fuBlogImageUpload" runat="server" /><asp:Button ID="btnUpload" CausesValidation="false" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                
            </div>
            
            
                <asp:Button ID="lbBlogNew_Add" Text="Add New Entry" CommandName="new" runat="server"/>
            </div>
            
            
            <asp:Literal runat="server" ID="litStatus" />
            
            
            
            </div>
        </div>
    </EmptyDataTemplate>
    <ItemTemplate>    
        <div class="BlogEntry">
        
        
        <div class="Console">
        <div class="Buttons">
        
        <div class="Upload">
        Upload an image: <asp:FileUpload ID="fuBlogImageUpload" runat="server" /><asp:Button ID="btnUpload" CausesValidation="false" runat="server" Text="Upload" OnClick="btnUpload_Click" />
        
        </div>
        
        <asp:Button ID="lbBlogNew_Add" Text="Add New Entry" CommandName="new" runat="server"/>
        </div>
        
        <asp:Literal runat="server" ID="litStatus" />
        </div>
        </div>
    </ItemTemplate>
    <InsertItemTemplate>
    
    <div class="BlogEntry">
        <div class="Console">
        <div class="Buttons">
        
        <div class="Upload">
        Upload an image: <asp:FileUpload ID="fuBlogImageUpload" runat="server" /><asp:Button ID="btnUpload" CausesValidation="false" runat="server" Text="Upload" OnClick="btnUpload_Click" />
        
        </div>      
        <asp:Button ID="lbBlogNew_Add" Text="Add New Entry" CommandName="new" Enabled="false" runat="server"/>
        </div>
        
        <asp:Literal runat="server" ID="litStatus" />
        </div>
    </div>
        <div class="BlogEntry">
            <div class="Header">
                <span class="Title">Title: <asp:TextBox ID="tbBlogInsert_Title" runat="server" Text='<%# Bind("Title") %>' /> <asp:RequiredFieldValidator runat="server" ID="valInsert_Title" ControlToValidate="tbBlogInsert_Title" ErrorMessage="Title" Display="Static" /></span>
                <span class="Date">Published Date: <asp:TextBox ID="tbBlogInsert_PublishedDate" runat="server" Text='<%# Bind("PublishedDate") %>' /> <asp:RequiredFieldValidator runat="server" ID="valInsert_PublishedDate" ControlToValidate="tbBlogInsert_PublishedDate" ErrorMessage="Published Date" Display="Static" /><asp:CustomValidator runat="server" id="valInsert_DateValid" ControlToValidate="tbBlogInsert_PublishedDate" OnServerValidate="DateCheck" ErrorMessage="Published Date is Invalid" />
</span>
            </div>
            <div class="Content"><asp:TextBox TextMode="MultiLine" CssClass="RichTextEditor" ID="tbBlogInsert_Content" runat="server" Text='<%# Bind("Content") %>' /><asp:RequiredFieldValidator runat="server" ID="valInsert_Content" ControlToValidate="tbBlogInsert_Content" ErrorMessage="Content" Display="Static" />
            <div class="clear"></div>
            <asp:CheckBox ID="cbBlogInsert_IsPublished" runat="server" Text="Publish entry" Checked='<%# Bind("IsPublished") %>' />
                <div class="Console">
                <div class="Status"><asp:ValidationSummary runat="server" ID="vsBlogInsert" /></div>
                <div class="Buttons">
                    <asp:Button ID="lbBlogInsert_Save" Text="Save" CommandName="insert" runat="server"/> 
                    <asp:Button ID="lbBlogInsert_Cancel" CausesValidation="false" Text="Cancel" CommandName="cancel" runat="server"/>
                </div>
            </div>     
        </div>
        
        </div>
    
    </InsertItemTemplate>
</asp:FormView>

<h2><asp:Literal ID="lblBlogMonthTitle" runat="server" /></h2>

<asp:Repeater ID="repBlog" runat="server" DataSourceID="sqlBlog" OnItemDataBound="repBlog_ItemDataBound">
<ItemTemplate>

    <asp:SqlDataSource ID="sqlBlog2" runat="server" ConnectionString="<%$ ConnectionStrings:BS_DB %>" 
    SelectCommand="SELECT * FROM [BlogEntry] WHERE [ID_PK] = @ID_PK AND [IsDeleted] = '0'" 
    UpdateCommand="UPDATE [BlogEntry] SET [Title] = @Title, [PublishedDate] = @PublishedDate, [Content] = @Content, [IsPublished] = @IsPublished WHERE [ID_PK] = @ID_PK" 
    DeleteCommand="UPDATE [BlogEntry] SET [IsDeleted] = @IsDeleted WHERE [ID_PK] = @ID_PK"   
    >        
        <SelectParameters>
            <asp:Parameter Name="ID_PK" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>    
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="PublishedDate" Type="DateTime" />
            <asp:Parameter Name="Content" Type="String" />
            <asp:Parameter Name="IsPublished" Type="Boolean" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="IsDeleted" Type="Boolean" DefaultValue="True" />
        </DeleteParameters>
    </asp:SqlDataSource>
    
    <asp:FormView ID="fvBlogEntry" runat="server" DataKeyNames="ID_PK" DataSourceID="sqlBlog2" Width="100%">
    <ItemTemplate>
    
        <div class="BlogEntry">
            <div class="Header">
                <span class="Title"><%# Eval("Title") %></span>
                <span class="Date"><%# Eval("PublishedDate") %></span>
            </div>
            <div class="Content"><%# Eval("Content") %>
            <div class="clear"></div>
                <asp:Panel ID="pnlBlogView_Controls" CssClass="Console" runat="server">
                    <asp:Button ID="lbBlogView_Edit" Text="Edit" CommandName="edit" runat="server"/>
                    <asp:Button ID="lbBlogView_Delete" Text="Delete" CommandName="delete" runat="server"/>
                </asp:Panel>
            </div>
            
        </div>
    
    </ItemTemplate>
    
    <EditItemTemplate>
 
         <div class="BlogEntry">
            <div class="Header">
                <span class="Title">Title: <asp:TextBox ID="tbBlogUpdate_Title" runat="server" Text='<%# Bind("Title") %>' /> <asp:RequiredFieldValidator runat="server" ID="valUpdate_Title" ControlToValidate="tbBlogUpdate_Title" ErrorMessage="Title" Display="Static" /></span>
                <span class="Date">Published Date: <asp:TextBox ID="tbBlogUpdate_PublishedDate" runat="server" Text='<%# Bind("PublishedDate") %>' /> <asp:RequiredFieldValidator runat="server" ID="valUpdate_PublishedDate" ControlToValidate="tbBlogUpdate_PublishedDate" ErrorMessage="Published Date" Display="Static" /><asp:CustomValidator runat="server" id="valUpdate_DateValid" ControlToValidate="tbBlogUpdate_PublishedDate" OnServerValidate="DateCheck" ErrorMessage="Published Date is Invalid" /></span>
            </div>
            <div class="Content"><asp:TextBox TextMode="MultiLine" CssClass="RichTextEditor" ID="tbBlogUpdate_Content" runat="server" Text='<%# Bind("Content") %>' /><asp:RequiredFieldValidator runat="server" ID="valUpdate_Content" ControlToValidate="tbBlogUpdate_Content" ErrorMessage="Content" Display="Static" />
            <div class="clear"></div>
            <asp:CheckBox ID="cbBlogUpdate_IsPublished" runat="server" Text="Publish entry" Checked='<%# Bind("IsPublished") %>' />
                 <div class="Console">
                <div class="Status"><asp:ValidationSummary runat="server" ID="vsBlogUpdate" /></div>
                <div class="Buttons">
                    <asp:Button ID="lbBlogUpdate_Save" Text="Save" CommandName="update" runat="server"/>
                    <asp:Button ID="lbBlogUpdate_Cancel" Text="Cancel" CommandName="cancel" CausesValidation="false" runat="server"/>
                </div>
            </div>     
        </div>
        </div>

    </EditItemTemplate>
    </asp:FormView>

</ItemTemplate>
</asp:Repeater>


<asp:Repeater ID="repBlog_Public" runat="server" DataSourceID="sqlBlog_Public">
<ItemTemplate>
    
        <div class="BlogEntry">
            <div class="Header">
                <span class="Title"><%# Eval("Title") %></span>
                <span class="Date"><%# Eval("PublishedDate") %></span>
            </div>
            <div class="Content"><%# Eval("Content") %>
            <div class="clear"></div>
            </div>
        </div>
    
    </ItemTemplate>
</asp:Repeater>

<asp:SqlDataSource ID="sqlBlog_Public" runat="server" ConnectionString="<%$ ConnectionStrings:BS_DB %>" 
SelectCommand="SELECT * FROM [BlogEntry] WHERE [IsDeleted] = '0' AND [IsPublished] = '1' AND [ID_PK] > 0 ORDER BY [PublishedDate] DESC" />



<asp:HyperLink ID="hlBlogPreviousMonth" runat="server" CssClass="floatLeft" NavigateUrl="~/Blog.aspx" Text="<< Previous Month" />
<asp:HyperLink ID="hlBlogNextMonth" runat="server" CssClass="floatRight" NavigateUrl="~/Blog.aspx" Text="Next Month >>" />
<div class="clear">
</div>


