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
    public partial class Panier : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(Properties.Settings.Default.chaineCNX);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Categorie"] == null)
                Response.Redirect("Authentification.aspx");


            if (Session["Categorie"].ToString() == "admin" || Session["Categorie"].ToString() == "guest")
                Response.Redirect("Error.aspx");

            if (!IsPostBack)
            {
                try
                {
                    cnx.Open();
                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) from Commande C inner join Client Cl on C.IDC = Cl.IDC " +
                        "where Statut = 'non-valide' and Cl.Username = @x", cnx);
                    cmd.Parameters.AddWithValue("@x", Session["Login"].ToString());
                    nbArt.InnerText = cmd.ExecuteScalar().ToString() + "x article(s)";
                    SqlCommand cmd2 = new SqlCommand("SELECT SUM(P.Prix * PC.Qte) from Produit P inner join ProduitCommande PC on P.NumPro" +
                        "= PC.NumPro inner join Commande C on PC.NumCom = C.NumCom inner join Client Cl on C.IDC = Cl.IDC where " +
                        "Statut='non-valide' and Cl.Username=@x", cnx);

                    cmd2.Parameters.AddWithValue("@x", Session["Login"].ToString());
                    QteXnb.InnerText = cmd2.ExecuteScalar().ToString() + " Dhs";
                    var Tot = int.Parse(cmd2.ExecuteScalar().ToString()) + 19 + 50;
                    Total.InnerText = Tot.ToString() + " DHS";
                    cnx.Close();
                }
                catch (Exception Ex)
                {
                    cnx.Close();
                    Response.Redirect("Error.aspx?ErrorText=" + Ex.Message);
                }
                
            }

        }

        protected void btnConfimrer_Click(object sender, EventArgs e)
        {
            cnx.Open();
            new SqlCommand("UPDATE Commande set Commande.Statut='valide' from Commande C inner join Client Cl on Cl.IDC = C.IDC where Cl.Username='" + Session["Login"].ToString()+"'", cnx).ExecuteNonQuery();
            cnx.Close();
            string txtCommande = "Merci d'avoir choisi Nutrition Universe. Votre colis vous sera delivré au plutôt possible !";
            Response.Redirect("Confirmation.aspx?ActionName=Commande&ActionText="+ txtCommande);
        }
    }
}