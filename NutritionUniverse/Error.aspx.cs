using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NutritionUniverse
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.InnerText = Request.QueryString["ErrorText"].ToString();
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx?ErrorText=Une erreure est survenue ou delais de session s'est ecoule. Veuillez vous reconnecter.");
            }
            
        }

    }
}