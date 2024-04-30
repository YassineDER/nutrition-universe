using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace NutritionUniverse
{
    public partial class AjoutProduit : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(Properties.Settings.Default.chaineCNX);

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btnAjoutPro_Click(object sender, EventArgs e)
        {
            try
            {
                cnx.Open();
                SqlCommand cmd = new SqlCommand("insert into Produit values(@num,@nom,@desc,@marque,@prix,@stock,@photo,@date,@cat,@nbrVente)", cnx);
                cmd.Parameters.AddWithValue("@num", new Random().Next(1).ToString() + new Random().Next().ToString());
                cmd.Parameters.AddWithValue("@nom", txtNom.Text);
                cmd.Parameters.AddWithValue("@desc", txtDesc.Text);
                cmd.Parameters.AddWithValue("@marque", txtMarque.Text);
                cmd.Parameters.AddWithValue("@prix", txtPrix.Text);
                cmd.Parameters.AddWithValue("@stock", stock.Text);
                cmd.Parameters.AddWithValue("@photo", inputGroupFile04.FileBytes);
                cmd.Parameters.AddWithValue("@date", txtDate.Text);
                cmd.Parameters.AddWithValue("@cat", category.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@nbrVente", 0);
                cmd.ExecuteNonQuery();
                Response.Redirect("Produits.aspx");
                cnx.Close();
            }
            catch (Exception Ex)
            {
                cnx.Close();
                txtError.Text = Ex.Message;
            }
        }
    }
}