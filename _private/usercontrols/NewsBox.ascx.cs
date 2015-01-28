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

public partial class _private_usercontrols_NewsBox : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (fvNewsBox.Row != null)
        {
            Panel pnlNewsBox_Controls = (Panel)fvNewsBox.Row.FindControl("pnlNewsBox_Controls");
            if (pnlNewsBox_Controls != null)
            {
                if (!Page.User.IsInRole("Administrators"))
                {
                    pnlNewsBox_Controls.Visible = false;
                }
                else
                {
                    pnlNewsBox_Controls.Visible = true;
                    if (!Page.ClientScript.IsClientScriptIncludeRegistered("tiny_mce.js"))
                    {
                        Page.ClientScript.RegisterClientScriptInclude("tiny_mce.js", ResolveUrl("~/_private/scripts/tiny_mce/tiny_mce.js"));
                    }

                }

            }
            sqlNewsBox.UpdateParameters["PublishedDate"].DefaultValue = DateTime.Now.ToString();
        }

    }

    public void DateCheck(object source, ServerValidateEventArgs args)
    {
        try
        {
            string str = args.Value;

            DateTime datevalue = DateTime.Parse(str);
            args.IsValid = true;
        }
        catch (Exception ex)
        {
            args.IsValid = false;
        }
    }
}
