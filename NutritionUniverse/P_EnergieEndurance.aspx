<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="P_EnergieEndurance.aspx.cs" Inherits="NutritionUniverse.EnergieEndurance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NutritionUniverse.Properties.Settings.chaineCNX %>" SelectCommand="SELECT * FROM Produit where Produit.NumCat=7"></asp:SqlDataSource>
    <br />
    <div class="container border p-5">
        <asp:DataList DataKeyField="NumPro" ID="DataList1" runat="server" CellSpacing="4" RepeatColumns="4" CellPadding="7" DataSourceID="SqlDataSource1">
                <SeparatorTemplate>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SeparatorTemplate>
                <ItemStyle CssClass="Item" />
                <ItemTemplate>
                    <asp:Image ID="PhotoLabel" CssClass="PhotoLabel" runat="server" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String( (byte[]) Eval("Photo") ) %>' />
                
                    <br />
                    <asp:Label ID="NomProLabel" runat="server" CssClass="text-uppercase fst-normal fs-5 text-black" Text='<%# Eval("NomPro") %>' /><br />
                    <asp:Label ID="MarqueProLabel" runat="server" CssClass="fst-normal fs-6 text-black-50" Text='<%# Eval("NomPro") %>' />
                    <br />
                    <asp:Label ID="PrixLabel" runat="server" Text='<%# Eval("Prix") %>' CssClass="text-uppercase fw-bold fs-5 text-decoration-none font-achtung" />
                    <br />
                    <br />
                    <asp:LinkButton Text="Voir" PostBackUrl='<%# String.Format("CommanderProduit.aspx?NPro={0}", Eval("NumPro")) %>'  runat="server" ID="ShowBTN" CssClass="btn btn-warning w-100 p-0 fs-5 buttonoverlapmulti" >
                        <img src="imgs/icons8-visible-48.png" class="m-0" height="30" /></asp:LinkButton>
                </ItemTemplate>
            </asp:DataList>
        </div>
</asp:Content>
