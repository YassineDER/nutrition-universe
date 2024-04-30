using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NutritionUniverse
{
    public partial class Acceuil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Login"] == null)
            {
                Label1.Text = "No Login";
            }
            else
            {
                Label1.Text = Session["Login"].ToString();
            }
        }   

    }
}