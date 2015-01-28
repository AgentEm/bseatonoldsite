<%@ WebHandler Language="C#" Class="UploadedImageList" %>

using System;
using System.Web;
using System.Web.UI;
using System.IO;

public class UploadedImageList : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        context.Response.ContentType = "text/plain";
        
        if (context.User.IsInRole("Administrators"))
        {
            string fileListOutput = "";
            string virtualFolder = "~/_upload/blog/";
            string physicalFolder = context.Request.MapPath(virtualFolder); // + context.Request.QueryString[0].ToString());

            DirectoryInfo dirInfo = new DirectoryInfo(physicalFolder);
            if (dirInfo.Exists)
            {
                FileInfo[] files = dirInfo.GetFiles();
                if (files.Length > 0)
                {
                    Control tmpCtrl = new Control();
                    foreach (FileInfo fi in files)
                    {                        
                        fileListOutput += tmpCtrl.ResolveUrl(virtualFolder) + fi.Name + "|";                       
                    }
                    tmpCtrl.Dispose();
                    fileListOutput = fileListOutput.Substring(0, fileListOutput.Length - 1);
                }
            }
            context.Response.Write(fileListOutput);
        }
        else
        {
            context.Response.Write("Access Denied");
        }
    }

 
    public bool IsReusable {
        get {
            return false;
        }
    }

}