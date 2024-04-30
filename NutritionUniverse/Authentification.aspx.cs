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
    public partial class Authentification : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(Properties.Settings.Default.chaineCNX);

        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorDIV.Visible = false;
            Session["Login"] = null;
            Session["Categorie"] = "guest";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                cnx.Open();
                SqlCommand cmd = new SqlCommand("select * from Compte where Username=@user and Password=@pwd and Actif='oui'", cnx);
                cmd.Parameters.AddWithValue("@user", txtUsername.Text);
                cmd.Parameters.AddWithValue("@pwd", password_field.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();

                if (dr.HasRows)
                {
                    System.Web.Security.FormsAuthentication.RedirectFromLoginPage(txtUsername.Text, true);
                    //Response.Cookies["Cookie_PFE"].Values["Username"] = txtUsername.Text;
                    //Response.Cookies["Cookie_PFE"].Values["Password"] = password_field.Text;
                    //Response.Cookies["Cookie_PFE"].Expires = DateTime.Now.AddHours(1);

                    Session["Categorie"] = dr[2].ToString();
                    Session["Login"] = txtUsername.Text;
                    // ErrorMSG.InnerText = "Test test";
                    if (dr[2].ToString().ToLower() == "admin")
                        Response.Redirect("Dashbord.aspx");
                    if (dr[2].ToString().ToLower() == "client")
                        Response.Redirect("Acceuil.aspx");
                }
                else if(!dr.HasRows || dr[4].ToString() == "non")
                    throw new Exception("Les champs sont invalides ou votre compte n'est pas encore active. Veuillez contacter votre administrateur. ");

                cnx.Close();
            }
            catch (Exception Ex)
            {
                cnx.Close();
                ErrorDIV.Visible = true;
                ErrorMSG.InnerText = Ex.Message;
            }
        }
    }
}