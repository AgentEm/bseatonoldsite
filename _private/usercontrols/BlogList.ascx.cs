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


public partial class _private_usercontrols_BlogList : System.Web.UI.UserControl
{

    public bool isHomePage = false;
    private DateTime queryDate = new DateTime();

    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.IsInRole("Administrators"))
        {
            fvBlogInsert.Visible = false;
            repBlog.Visible = false;
            repBlog_Public.Visible = true;

            sqlMonths.SelectCommand = "SELECT DISTINCT CONVERT(VARCHAR(7), [PublishedDate], 111) AS [MM/YYYY] FROM [BlogEntry] WHERE [IsPublished] = '1' AND [IsDeleted] = '0' AND [ID_PK] > 0 ORDER BY [MM/YYYY] DESC";
        }
        else
        {
            sqlMonths.SelectCommand = "SELECT DISTINCT CONVERT(VARCHAR(7), [PublishedDate], 111) AS [MM/YYYY] FROM [BlogEntry] WHERE [IsDeleted] = '0' AND [ID_PK] > 0 ORDER BY [MM/YYYY] DESC";

            fvBlogInsert.Visible = true;
            repBlog.Visible = true;
            repBlog_Public.Visible = false;
            
            if (!Page.ClientScript.IsClientScriptIncludeRegistered("tiny_mce.js"))
            {
                Page.ClientScript.RegisterClientScriptInclude("tiny_mce.js", ResolveUrl("~/_private/scripts/tiny_mce/tiny_mce.js"));
            }
        }

        if (isHomePage)
        {
            sqlBlog.SelectCommand = "SELECT TOP 5 * FROM [BlogEntry] WHERE [IsDeleted] = '0' AND [ID_PK] > 0 ORDER BY [PublishedDate] DESC";
            sqlBlog_Public.SelectCommand = "SELECT TOP 5 * FROM [BlogEntry] WHERE [IsDeleted] = '0' AND [IsPublished] = '1' AND [ID_PK] > 0 ORDER BY [PublishedDate] DESC";

            lblMonthSelect.Visible = false;
            hlBlogArchive.Visible = true;

            hlBlogPreviousMonth.Visible = false;
            hlBlogNextMonth.Visible = false;

        }
        else
        {
            lblMonthSelect.Visible = true;
            hlBlogArchive.Visible = false;

            hlBlogPreviousMonth.Visible = true;
            hlBlogNextMonth.Visible = true;

            if (Request.QueryString["date"] != null && DateTime.TryParse(Request.QueryString["date"], out queryDate))
            {
                sqlBlog.SelectCommand = "SELECT *  FROM [BlogEntry] WHERE [IsDeleted] = '0' AND [ID_PK] > 0 AND [PublishedDate] < '" + queryDate.AddMonths(1).ToString("yyyy/MM/dd") + "' AND [PublishedDate] >= '" + queryDate.ToString("yyyy/MM/dd") + "' ORDER BY [PublishedDate] DESC";
                sqlBlog_Public.SelectCommand = "SELECT * FROM [BlogEntry] WHERE [IsDeleted] = '0' AND [IsPublished] = '1' AND [ID_PK] > 0 AND [PublishedDate] < '" + queryDate.AddMonths(1).ToString("yyyy/MM/dd") + "' AND [PublishedDate] >= '" + queryDate.ToString("yyyy/MM/dd") + "' ORDER BY [PublishedDate] DESC";

            }
            else
            {
                sqlBlog.SelectCommand = "SELECT * FROM [BlogEntry] WHERE [IsDeleted] = '0' AND [ID_PK] > 0 AND CONVERT(VARCHAR(7), [PublishedDate], 111) = (SELECT DISTINCT TOP 1 CONVERT(VARCHAR(7), [PublishedDate], 111) AS [MM/YYYY]  FROM [BlogEntry] WHERE [IsDeleted] = '0' ORDER BY [MM/YYYY] DESC) ORDER BY [PublishedDate] DESC";
                sqlBlog_Public.SelectCommand = "SELECT * FROM [BlogEntry] WHERE [IsDeleted] = '0' AND [IsPublished] = '1' AND [ID_PK] > 0 AND CONVERT(VARCHAR(7), [PublishedDate], 111) = (SELECT DISTINCT TOP 1 CONVERT(VARCHAR(7), [PublishedDate], 111) AS [MM/YYYY]  FROM [BlogEntry] WHERE [IsDeleted] = '0' AND [IsPublished] = '1' ORDER BY [MM/YYYY] DESC) ORDER BY [PublishedDate] DESC";
            }
        }
    }    
  
        

    protected void  btnBlogMonthGo_Click(object sender, EventArgs e)
    {
        Response.Redirect(ResolveUrl("~/Blog.aspx?date=" + ddlMonths.SelectedValue.ToString()));
    }


    protected void repBlog_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        SqlDataSource s = (SqlDataSource)e.Item.FindControl("sqlBlog2");
        if (s != null)
        {
            string ID_PK = ((DataRowView)e.Item.DataItem).Row.ItemArray[0].ToString();
            s.SelectParameters["ID_PK"].DefaultValue = ID_PK;
        }
    }

    protected void fvBlogInsert_ItemCreated(object sender, EventArgs e)
    {
        if (fvBlogInsert.CurrentMode == FormViewMode.Insert)
        {
            TextBox tbDate = (TextBox)((FormView)sender).Row.FindControl("tbBlogInsert_PublishedDate");
            if (tbDate != null)
            {
                tbDate.Text = DateTime.Now.ToString();
            }

            TextBox tbContent = (TextBox)fvBlogInsert.Row.FindControl("tbBlogInsert_Content");
            if (tbContent != null)
            {
                tbContent.Text = "<p>Text goes here.</p>";
            }
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

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string strStatus = "<br />";

        try
        {
            FileUpload fuBlogImageUpload = (FileUpload)fvBlogInsert.Row.FindControl("fuBlogImageUpload");
            if (fuBlogImageUpload != null)
            {
                if (fuBlogImageUpload.HasFile)
                {
                    fuBlogImageUpload.SaveAs(Server.MapPath("~/_upload/blog/" + fuBlogImageUpload.FileName));

                    strStatus += "Upload successful.";
                }
                else
                {
                    strStatus += "Upload failed.  File not found.";
                }
            }
        }
        catch (Exception ex)
        {
            {
                strStatus += "Upload failed: " + ex;
            }


        }
        finally
        {
            Literal litStatus = (Literal)fvBlogInsert.Row.FindControl("litStatus");
            if (litStatus != null)
            {
                litStatus.Text = strStatus;
            }
        }

    }


    protected void ddlMonths_DataBound(object sender, EventArgs e)
    {
        foreach (ListItem li in ((DropDownList)sender).Items)
        {
            li.Text = DateTime.Parse(li.Text).ToString("MMMM yyyy");
        }

        foreach (ListItem li in ddlMonths.Items)
        {            
            if (li.Value.ToString() == queryDate.ToString("yyyy/MM"))
            {
                ddlMonths.SelectedIndex = ddlMonths.Items.IndexOf(li);
            }
        }

        lblBlogMonthTitle.Text = ddlMonths.SelectedItem.Text;

        if (ddlMonths.SelectedIndex > 0)
        {
            hlBlogNextMonth.Enabled = true;
            hlBlogNextMonth.NavigateUrl = "~/Blog.aspx?date=" + ddlMonths.Items[ddlMonths.SelectedIndex - 1].Value;
        }
        else
        {
            hlBlogNextMonth.Enabled = false;
        }

        if (ddlMonths.SelectedIndex < ddlMonths.Items.Count - 1)
        {
            hlBlogPreviousMonth.Enabled = true;
            hlBlogPreviousMonth.NavigateUrl = "~/Blog.aspx?date=" + ddlMonths.Items[ddlMonths.SelectedIndex + 1].Value;
        }
        else
        {
            hlBlogPreviousMonth.Enabled = false;
        }
        

    }
}
