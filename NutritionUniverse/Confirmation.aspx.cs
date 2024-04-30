using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NutritionUniverse
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string ActionName = Request.QueryString["ActionName"].ToString();
                string ActionText = Request.QueryString["ActionText"].ToString();
                ActionTitle.InnerText = ActionName + " réussie !";
                ActText.InnerText = ActionText;
            }
            catch (Exception)
            {
                Response.Redirect("Error.apsx?ErrorText=Page invalide ou en maintenance");
            }
            
        }
    }
}