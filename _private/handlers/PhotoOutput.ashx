<%@ WebHandler Language="C#" Class="PhotoOutput" WarningLevel="4" %>

using System;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

public class PhotoOutput : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {

        //Read in the image filename to create a thumbnail of
        Control tmpCtrl = new Control();
        string virtualPath = tmpCtrl.ResolveUrl(context.Request.QueryString["img"]);
        string imagePath = context.Server.MapPath(virtualPath);

        int imgW = 0;
        int imgH = 0;
        if (context.Request.QueryString["w"] != null && context.Request.QueryString["w"] != "") 
            imgW = Convert.ToInt32(context.Request.QueryString["w"]);
        if (context.Request.QueryString["h"] != null && context.Request.QueryString["h"] != "") 
            imgH = Convert.ToInt32(context.Request.QueryString["h"]);
        int newW = 0;
        int newH = 0;

        //Make sure that the image URL doesn't contain any /'s or \'s
        if (imagePath == null || imagePath == "" /*|| imageUrl.IndexOf("/") >= 0 || imageUrl.IndexOf("\\") >= 0*/)
        {
            context.Response.End();
        }

        if (!File.Exists(imagePath))
        {
            context.Response.End();
        }

        string fileExtension = new FileInfo(imagePath).Extension.ToString().ToLower();

        System.Drawing.Image imgToProcess = null;

        switch (fileExtension)
        {
            case ".jpg":
            case ".jpeg":
            case ".gif":
            case ".bmp":
            case ".png":
                break;
            default:
                context.Response.End();
                break;
        }


        imgToProcess = System.Drawing.Image.FromFile(imagePath);

        //rotate the image 360 degrees to lose any thumbnail info it may have embedded:  http://aspnet.4guysfromrolla.com/articles/012203-1.2.aspx
        imgToProcess.RotateFlip(RotateFlipType.Rotate180FlipNone);
        imgToProcess.RotateFlip(RotateFlipType.Rotate180FlipNone);

        decimal scaleFactor = 0;

        //resize the image based on parameters passed in
        if (imgW == 0 && imgH == 0)
        {
            //keep original size, do nothing 
            imgW = imgToProcess.Width;
            imgH = imgToProcess.Height;
            newW = imgW;
            newH = imgH;           
        }
        else if (imgW != 0 && imgH != 0)
        {
            //cropping is only necessary if both imgW and imgH are defined 
            //get the orignal and suggested scale ratio to compare
            decimal originalScaleRatio = Convert.ToDecimal(imgToProcess.Width) / Convert.ToDecimal(imgToProcess.Height);
            decimal newScaleRatio = Convert.ToDecimal(imgW) / Convert.ToDecimal(imgH);

            if (originalScaleRatio < newScaleRatio)
            {
                //keep W, crop H
                scaleFactor = Math.Round(imgW / Convert.ToDecimal(imgToProcess.Width), 2);
                newW = imgW;
                newH = Convert.ToInt32(Math.Round(imgToProcess.Height * scaleFactor, 0));
            }
            else if (originalScaleRatio > newScaleRatio)
            {
                //keep H, crop W
                scaleFactor = Math.Round(imgH / Convert.ToDecimal(imgToProcess.Height), 2);
                newW = Convert.ToInt32(Math.Round(imgToProcess.Width * scaleFactor, 0));
                newH = imgH;
            }
            else
            {
                //scale is equivalent, cropping is not necessary, do nothing  

            }
        }            
        else
        {
            if (imgW == 0)
            {
                scaleFactor = Math.Round(imgH / Convert.ToDecimal(imgToProcess.Height), 2);
                imgW = Convert.ToInt32(Math.Round(imgToProcess.Width * scaleFactor, 0));
                newW = imgW;
                newH = imgH;
            }

            if (imgH == 0)
            {
                scaleFactor = Math.Round(imgW / Convert.ToDecimal(imgToProcess.Width), 2);
                imgH = Convert.ToInt32(Math.Round(imgToProcess.Height * scaleFactor, 0));
                newH = imgH;
                newW = imgW;
            }           
        }

        //create scaled image
        System.Drawing.Image.GetThumbnailImageAbort dummyCallback = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
        imgToProcess = imgToProcess.GetThumbnailImage(newW, newH, dummyCallback, IntPtr.Zero);
        
         //Image imgPhoto = Image.FromStream(new MemoryStream(imageFile));
        Bitmap bmPhoto = new Bitmap(imgW, imgH, PixelFormat.Format24bppRgb);
        bmPhoto.SetResolution(72, 72);
        Graphics grPhoto = Graphics.FromImage(bmPhoto);
        //grPhoto.SmoothingMode = SmoothingMode.AntiAlias;
        //grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
        //grPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
        int imgX = (int)(Math.Floor(Convert.ToDecimal(Math.Abs(newW - imgW))) / 2);
        int imgY = (int)(Math.Floor(Convert.ToDecimal(Math.Abs(newH - imgH))) / 2);
        grPhoto.DrawImage(imgToProcess, new Rectangle(0, 0, imgW, imgH), imgX, imgY, imgW, imgH, GraphicsUnit.Pixel);

        context.Response.ContentType = "application/octet-stream";
        //imgToProcess.Save(context.Response.OutputStream, ImageFormat.Jpeg);
        bmPhoto.Save(context.Response.OutputStream, ImageFormat.Jpeg);
        imgToProcess.Dispose();
        bmPhoto.Dispose();
        grPhoto.Dispose();
    }

    
    private bool ThumbnailCallback() {
        return false;
    }

 
    public bool IsReusable {
        get {
            return false;
        }
    }
}
