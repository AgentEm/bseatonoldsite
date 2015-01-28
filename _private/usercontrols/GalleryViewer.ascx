<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GalleryViewer.ascx.cs" Inherits="_private_usercontrols_GalleryViewer" %>

<asp:HyperLink ID="lbGalleryList" runat="server" CssClass="rightNav" Text="<< Return to Gallery List" NavigateUrl="~/Galleries.aspx" />  
<div style="text-align: center;">
    <asp:SqlDataSource ID="sqlPhotoDetails" runat="server" ConnectionString="<%$ ConnectionStrings:BS_DB %>" SelectCommand="SELECT [Title] AS [gTitle], [Abstract] AS [gAbstract], 'False' AS [ShowPhoto], '' AS [Url], '' AS [PhotoWidth], '' AS [PhotoHeight], '' AS [Title], '' AS Description, '' AS [About]  FROM [Gallery] WHERE [ID_PK] = @gID_PK AND [isPublished] = '1' AND [isDeleted] = '0'">
        <SelectParameters>
            <asp:SessionParameter Name="gID_PK" SessionField="galleryId" />
        </SelectParameters>
    </asp:SqlDataSource>    
     
    <asp:FormView ID="fvPhotoDetails" runat="server" DataSourceID="sqlPhotoDetails">
        
        <EmptyDataTemplate>
        
            <asp:SqlDataSource ID="sqlGalleryList_Public" runat="server" ConnectionString="<%$ ConnectionStrings:BS_DB %>" 
            SelectCommand="SELECT g.*, p.[Url] FROM [Gallery] g, [Photo] p, [Gallery_Photo_XRef] x WHERE p.[ID_PK] = x.[FK_Photo] AND g.[ID_PK] = x.[FK_Gallery] AND x.[SequenceNum] = 0 AND g.[IsPublished] = '1' AND g.[IsDeleted] = '0' ORDER BY g.[PublishedDate] DESC" />

            <asp:Repeater ID="repGalleryList_Public" runat="server" DataSourceID="sqlGalleryList_Public">
                <HeaderTemplate><div id="GalleryList"></HeaderTemplate>
                <ItemTemplate>
                    <div class="item"  style="text-align: left;">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Galleries.aspx?id=" + Eval("ID_PK") %>'><asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/_private/handlers/PhotoOutput.ashx?img=~/_private/content/galleries/" + Eval("Url")  + "&w=" + Eval("BlurbWidth") + "&h=" + Eval("BlurbHeight")  %>' /></asp:HyperLink>
                        <asp:HyperLink ID="hlShowGallery" runat="server"  Text='<%# Eval("Title") %>' NavigateUrl='<%# "~/Galleries.aspx?id=" + Eval("ID_PK") %>' />
                        <p><%# Eval("Description") %></p>
                    </div>
                </ItemTemplate>
                <FooterTemplate></div></FooterTemplate>
            </asp:Repeater>
            
        </EmptyDataTemplate>
        
        
        <ItemTemplate>
            
            <div id="PhotoDisplay" class="full">
            <table cellpadding="0" cellspacing="0" width="100%" height="100%">
            <tr>
            <td align="center" valign="middle">
                <div class="galleryTitleFull"><asp:Literal ID="litGalleryTitle" runat="server" Text='<%# Eval("gTitle") %>' /></div>
                      
                    <asp:Label CssClass="abstract" ID="lblGalleryAbstract" runat="server" Text='<%# Eval("gAbstract") %>' />
                    
                    <asp:Panel ID="pnlPhoto" runat="server" Visible='<%# Convert.ToBoolean(Eval("ShowPhoto")) %>'>
                    <table cellpadding="0" cellspacing="0" class="inner">
                    <tr>
                    <td>
                        <asp:Image ID="imgPhoto" runat="server" ImageUrl='<%# "~/_private/handlers/PhotoOutput.ashx?img=~/_private/content/galleries/" + Eval("Url") + "&w=" + Eval("PhotoWidth") + "&h=" + Eval("PhotoHeight")%>' />
                        <div class="photoTitleFull"><asp:Literal ID="litPhotoTitle" runat="server" Text='<%# Eval("Title") %>' /></div>
                    </td>
                    </tr>
                    </table>
                    </asp:Panel>
                    
            </td>
            </tr>
            </table>

        </div>

    
    <div id="GalleryDisplay">
    <div class="description"><asp:Literal ID="litPhotoDescription" runat="server" Text='<%# Eval("Description") %>' /></div>
    <div class="about"><asp:Literal ID="litPhotoAbout" runat="server" Text='<%# Eval("About") %>' /></div>
    </div>
        
        </ItemTemplate> 
        
        <FooterTemplate>
        
            <asp:SqlDataSource ID="sqlGalleryThumbs_Public" runat="server" ConnectionString="<%$ ConnectionStrings:BS_DB %>" 
                SelectCommand="SELECT p.*, g.[ThumbWidth], g.[ThumbHeight] FROM [Photo] p, [Gallery] g, [Gallery_Photo_XRef] x WHERE p.[ID_PK] = x.[FK_Photo] AND g.[ID_PK] = x.[FK_Gallery] AND g.[ID_PK] = @gID_PK AND g.[IsPublished] = '1' AND g.[IsDeleted] = '0' ORDER BY x.[SequenceNum]">
                <SelectParameters>
			<asp:SessionParameter Name="gID_PK" SessionField="galleryId" />
			</SelectParameters>
                </asp:SqlDataSource>
                
            
           
                <asp:Repeater ID="repGalleryThumbs_Public" runat="server" DataSourceID="sqlGalleryThumbs_Public"> 
                <HeaderTemplate><div id="GalleryThumbs">
                </HeaderTemplate>               
                    <ItemTemplate><asp:ImageButton ID="imgThumb" OnClick="PhotoThumb_Click" runat="server" ImageUrl='<%# "~/_private/handlers/PhotoOutput.ashx?img=~/_private/content/galleries/" + Eval("Url") + "&w=" + Eval("ThumbWidth") + "&h=" + Eval("ThumbHeight") %>' /></ItemTemplate>      
                <FooterTemplate></div></FooterTemplate>
                </asp:Repeater>
                
            </div>
            
        </FooterTemplate>
          
    </asp:FormView>

    
</div>
   





