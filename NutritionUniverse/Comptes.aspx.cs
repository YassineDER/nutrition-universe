using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace NutritionUniverse
{
    public partial class Comptes : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(Properties.Settings.Default.chaineCNX);

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        void LoadData()
        {
            infosCompte.Visible = true;
            cnx.Open();
            var cmd = new SqlCommand("select * from Compte where Username=@x", cnx);
            cmd.Parameters.AddWithValue("@x", DropDownList1.SelectedValue);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            txtUsername.Text = dr[0].ToString();
            txtPassword.Text = dr[1].ToString();
            Cat.Value = dr[2].ToString();
            if (dr[4].ToString() == "oui")
                isActif.Checked = true;
            else isActif.Checked = false;
            dr.Close();
            cnx.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                cnx.Open();
                SqlCommand cmd = new SqlCommand("update Compte set Password= @p, Catégorie= @Cat, Actif= @A where Username= @x", cnx);
                cmd.Parameters.AddWithValue("@p", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Cat", Cat.Value);
                if (isActif.Checked)
                    cmd.Parameters.AddWithValue("@A", "oui");
                else if (!isActif.Checked)
                    cmd.Parameters.AddWithValue("@A", "non");
                cmd.Parameters.AddWithValue("@x", DropDownList1.SelectedValue);
                cmd.ExecuteNonQuery();
                cnx.Close();
                Response.Redirect("Comptes.aspx");
            }
            catch (Exception Ex)
            {
                cnx.Close();
                txtError.Text = Ex.Message;
            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                cnx.Open();
                SqlCommand cmd = new SqlCommand("delete from Compte where Username=@x", cnx);
                cmd.Parameters.AddWithValue("@x", DropDownList1.SelectedValue);
                cmd.ExecuteNonQuery();
                cnx.Close();
                Response.Redirect("Comptes.aspx");
            }
            catch (Exception Ex)
            {
                cnx.Close();
                txtError.Text = Ex.Message;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}