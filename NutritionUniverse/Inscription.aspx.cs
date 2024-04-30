using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace NutritionUniverse
{
    public partial class Inscription : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(Properties.Settings.Default.chaineCNX);

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cnx.Open();
            try
            {
                SqlCommand cmd1 = new SqlCommand("insert into Compte values(@user,@pass,@cat,@dateIns,@actif)", cnx);
                cmd1.Parameters.AddWithValue("@user", txtUsername.Text);
                cmd1.Parameters.AddWithValue("@pass", txtPassword.Value);
                cmd1.Parameters.AddWithValue("@cat", "client");
                cmd1.Parameters.AddWithValue("@dateIns", DateTime.Now.Date);
                cmd1.Parameters.AddWithValue("@actif", "non");
                cmd1.ExecuteNonQuery();
            
                SqlCommand cmd2 = new SqlCommand("insert into Client values(@ID,@usern,@nom,@prenom,@tel,@adresse)", cnx);
                cmd2.Parameters.AddWithValue("@ID", new Random().Next().ToString() + new Random().Next().ToString());
                cmd2.Parameters.AddWithValue("@usern", txtUsername.Text);
                cmd2.Parameters.AddWithValue("@nom", txtNom.Text);
                cmd2.Parameters.AddWithValue("@prenom", txtPrenom.Text);
                cmd2.Parameters.AddWithValue("@tel", txtTelephone.Text);
                cmd2.Parameters.AddWithValue("@adresse", txtAdresse.Text);
                cmd2.ExecuteNonQuery();
                Label9.Text = "Inscription Effectuée";
            }
            catch (Exception Ex)
            {
                Label9.Text = Ex.Message;
            }
            cnx.Close();
            Response.Redirect("Confirmation.aspx?ActionName=Inscription&ActionText=Merci d'avoir joint Nitrition Universe. " +
                "Vous pouvez desormais commander nos produits après l'activation de votre compte.");
        }

        
    }
}