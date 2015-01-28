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

public partial class _private_layout_DefaultLayout : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (SiteMap.CurrentNode != null)
            {
                Page.Title = SiteMap.CurrentNode.Title + " - BrendanSeaton.com";
                litHeading.Text = SiteMap.CurrentNode.Title;
            }
        }

        //if (Page.User.IsInRole("Administrators"))
        //{
        //Page.ClientScript.RegisterClientScriptInclude("widgEditor.js", ResolveUrl("~/_private/scripts/widgEditor/widgEditor.js"));
        //}

    }
}
