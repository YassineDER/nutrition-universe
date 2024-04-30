using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace NutritionUniverse
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        SqlConnection cnx = new SqlConnection(Properties.Settings.Default.chaineCNX);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Categorie"].ToString() == "admin" || Session["Categorie"].ToString() == "guest")
                btnPanier.Visible = false;

            if (Session["Login"]==null)
            {
                btnSignUP.Visible= true;
                LabelUsername.Visible = false;
                LoginView1.Visible = false;
                btnHist.Visible = false;
                LoginStatus1.LogoutText = "Se connecter";
            }

            else
            {
                cnx.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) from Commande C inner join Client Cl on C.IDC = Cl.IDC " +
                    "where Statut = 'non-valide' and Cl.Username = @x", cnx);
                cmd.Parameters.AddWithValue("@x", Session["Login"].ToString());

                if (int.Parse(cmd.ExecuteScalar().ToString()) < 1)
                    nbrItemsPanier.Visible = false;
                else
                {
                    nbrItemsPanier.Visible = true;
                    nbrItemsPanier.Text = cmd.ExecuteScalar().ToString();
                }
                    
                cnx.Close();

                LoginView1.Visible = true;
                LabelUsername.Visible = true;
                btnSignUP.Visible= false;
                btnHist.Visible = true;
                LabelUsername.Text ="Bienvenue " + Session["Login"].ToString();
                LoginStatus1.LogoutText = "Se deconnecter";
            }
        }

        protected void btnSignUP_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inscription.aspx");
        }

    }
}