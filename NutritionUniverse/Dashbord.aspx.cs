using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace NutritionUniverse
{
    public partial class Dashbord : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.chaineCNX);
        protected void Page_Load(object sender, EventArgs e)
        {
            bienv.InnerText = "Bienvenue, " + Session["Login"];
            if(!IsPostBack)
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("Select Username from Compte where Actif='non'" , con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                RepeterDetails.DataSource = ds;
                RepeterDetails.DataBind();
            }
        }

    }
}