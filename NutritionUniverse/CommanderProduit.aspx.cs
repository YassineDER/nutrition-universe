using System;
using System.Drawing;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace NutritionUniverse
{
    public partial class CommanderProduit : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(Properties.Settings.Default.chaineCNX);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ErrorDIV.Visible = false;
                SuccessDIV.Visible = false;
                try
                {
                    cnx.Open();
                    SqlCommand cmd = new SqlCommand("select * from Produit where NumPro=" + Request.QueryString["NPro"], cnx);
                    SqlCommand cmdNbrStock = new SqlCommand("select Stock from Produit where NumPro=" + Request.QueryString["NPro"], cnx);
                    SqlDataReader dr = cmd.ExecuteReader();
                    dr.Read();
                    actualProduct.InnerText = dr[1].ToString();
                    byte[] imagebytes = (byte[])dr[6];
                    string Base64 = Convert.ToBase64String(imagebytes, 0, imagebytes.Length);
                    PhotoLabel.ImageUrl = "data:image/png;base64," + Base64;
                    NomProLabel.Text = dr[1].ToString();
                    if (dr[5].ToString() == "0")
                    {
                        StockLabel.Text = "Rupture de stock";
                        StockLabel.BackColor = Color.FromArgb(213, 0, 0);
                        //Commande button must be disabled
                    }
                    if (int.Parse(dr[5].ToString()) < 2)
                    {
                        QteChoisie.Visible = false;
                        customRange2.Visible = false;
                        lblQte.Visible = false;
                    }

                    Desc.InnerText = dr[2].ToString();
                    brand.InnerText += dr[3].ToString();
                    int jours = ((DateTime)dr[7]).Subtract(DateTime.Today).Days;
                    exp.InnerText = ((DateTime)dr[7]).ToShortDateString() + " (valable d'ici " + jours + " jours)";
                    Price.InnerText = dr[4].ToString() + ".00 DHs";
                    nbrV.InnerText = "( " + dr[9].ToString() + " Ventes )";
                    dr.Close();
                    QteChoisie.InnerText = customRange2.Value;
                    customRange2.Attributes.Add("max", cmdNbrStock.ExecuteScalar().ToString());
                    //testt.Text = cmdNbrStock.ExecuteScalar().ToString();
                    cnx.Close();

                }
                catch (Exception Ex)
                {
                    cnx.Close();
                    ErrorDIV.Visible = true;
                    ErrorDIV.InnerText = Ex.Message;
                }
            }
        }

        protected void CommanderBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Login"] != null && Session["Categorie"].ToString() == "client")
                {
                    cnx.Open();
                    SqlCommand cmdCount = new SqlCommand("select count(*) from Commande", cnx);
                    SqlCommand cmdIDC = new SqlCommand("select IDC from Client where Username='" + Session["Login"].ToString()+"'", cnx);
                    var numCom = int.Parse(cmdCount.ExecuteScalar().ToString()) + 1;
                    var IDC = cmdIDC.ExecuteScalar().ToString();
                    SqlCommand cmd1 = new SqlCommand("insert into Commande values('" + numCom.ToString() + "','" + DateTime.Now.ToString() +
                        "','Non-Valide','" + IDC + "') ", cnx);
                    SqlCommand cmd2 = new SqlCommand("insert into ProduitCommande values('" + Request.QueryString["NPro"].ToString() + 
                       "','"+ numCom.ToString()+"','" + customRange2.Value+"')", cnx);
                    cmd1.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                    cnx.Close();
                    CommanderBtn.Enabled = false;
                    SuccessDIV.Visible = true;
                }

                else
                {
                    throw new ApplicationException("Vous devez être un client connecté pour commander ce produit. ");
                }
            }
            catch (Exception Ex)
            {
                cnx.Close();
                ErrorDIV.Visible = true;
                ErrorDIV.InnerText = Ex.Message;
            }
        }

    }
}