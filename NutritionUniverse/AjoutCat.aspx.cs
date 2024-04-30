using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NutritionUniverse
{
    public partial class AjoutCat : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(Properties.Settings.Default.chaineCNX);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAjout_Click(object sender, EventArgs e)
        {
            try
            {
                cnx.Open();
                SqlCommand cmd = new SqlCommand("insert into Catégorie values(@num,@nom,@desc)", cnx);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@num", new Random().Next(10).ToString());
                cmd.Parameters.AddWithValue("@nom", txtNom.Text);
                cmd.Parameters.AddWithValue("@desc", txtDesc.Text);
                cmd.ExecuteNonQuery();
                cnx.Close();
                Response.Redirect("Produits.aspx");
            }
            catch (Exception ex)
            {
                cnx.Close();
                txtError.Text = ex.Message;
            }
        }
    }
}