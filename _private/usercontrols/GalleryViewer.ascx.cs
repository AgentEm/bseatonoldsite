using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;


using System.Xml;

public partial class _private_usercontrols_GalleryViewer : System.Web.UI.UserControl
{
    XmlDocument xml = new XmlDocument();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session.Remove("galleryId");
            
            if (Context.Request.QueryString["id"] != null)
            {
                long galId = -1;
                if (long.TryParse(Context.Request.QueryString["id"].ToString(), out galId))
                {
                    Session["galleryId"] = galId;                               
                }
            }            
        }       
    }    

    private void setPhoto(ImageButton thumb)
    {
        string photoFileName = thumb.ImageUrl.Substring(thumb.ImageUrl.LastIndexOf("/") + 1, thumb.ImageUrl.IndexOf("&") - thumb.ImageUrl.LastIndexOf("/") -1);

        sqlPhotoDetails.SelectCommand = "SELECT TOP 1 p.*, g.[Title] AS [gTitle], '' AS [gAbstract], 'True' AS [ShowPhoto] FROM [Gallery] g, [Photo] p, [Gallery_Photo_XRef] x WHERE [Url] = '" + photoFileName + "' AND p.[ID_PK] = x.[FK_Photo] AND g.[ID_PK] = x.[FK_Gallery]";                      
    }

    protected void PhotoThumb_Click(object sender, ImageClickEventArgs e)
    {
        setPhoto((ImageButton)sender);
    }

    protected void Gallery_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        string title = lb.Text;

        Session["galleryId"] = xml.SelectSingleNode("galleries/gallery[@title='" + title + "']").Attributes["id"].Value.ToString();

    }

}

