using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NutritionUniverse
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Categorie"].ToString() == "guest" || Session["Categorie"].ToString() == "client")
                Response.Redirect("Acceuil.aspx");

            string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            DashbordBtn.Attributes["class"] = "nav-link";
            ProductsBtn.Attributes["class"] = "nav-link";
            UsersBtn.Attributes["class"] = "nav-link";


            if (currentPage == "Dashbord.aspx")
                DashbordBtn.Attributes["class"] = "nav-link active";
            if (currentPage == "Produits.aspx" || currentPage == "AjoutProduit.aspx" || currentPage == "AjoutCat.aspx")
                ProductsBtn.Attributes["class"] = "nav-link active";
            if (currentPage == "Comptes.aspx")
                UsersBtn.Attributes["class"] = "nav-link active";

        }
    }
}