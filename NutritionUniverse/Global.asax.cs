using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace NutritionUniverse
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["Categorie"] = "guest";
            Session["Login"] = null;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //Response.Redirect("Error.aspx");
        }

        protected void Session_End(object sender, EventArgs e)
        {
            try
            {
                Directory.GetFiles(@"C:\Users\Hp\Desktop\ASP Projects\NutritionUniverse\NutritionUniverse\TemporaryImages").ToList().ForEach(File.Delete);
            }
            catch (Exception)
            {
                
            }
            
        }

        protected void Application_End(object sender, EventArgs e)
        {
            
        }
    }
}