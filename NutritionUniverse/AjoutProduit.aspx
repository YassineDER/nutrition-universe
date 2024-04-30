<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AjoutProduit.aspx.cs" Inherits="NutritionUniverse.AjoutProduit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NutritionUniverse.Properties.Settings.chaineCNX %>" SelectCommand="SELECT [NumCat], [NomCat] FROM [Catégorie]"></asp:SqlDataSource>

    <div class="container tm-mt-small  tm-mb-big">
        <div class="row">

            <div class="col-xl-9 col-lg-10 col-md-12 w-100 col-sm-12 mx-auto">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <div class="row">

                        <div class="col-12">
                            <h2 class="text-light mb-5 mx-0 d-inline-block">Ajouter un produit</h2>
                        </div>
                    </div>
                    <div class="row tm-edit-product-row">
                        <div class="col-xl-6 col-lg-6 col-md-12">
                            <form class="tm-edit-product-form">
                                <div class="input-group mb-3">
                                     <span class="input-group-text">Nom / Marque</span>
                                    <asp:TextBox runat="server" Text="" ID="txtNom" TextMode="SingleLine" required CssClass="form-control validate" />&nbsp;
                                    <asp:TextBox runat="server" Text="" ID="txtMarque" TextMode="SingleLine" required CssClass="form-control validate" />
                                </div>
                                <div class="form-group mb-3">
                                    <label for="description">Description</label>
                                    <asp:TextBox runat="server" Text="" ID="txtDesc" TextMode="MultiLine" Height="100" required CssClass="form-control validate" />

                                </div>
                                <div class="form-group mb-3">
                                    <label for="category">Categorie</label>
                                    <asp:DropDownList ID="category" CssClass="custom-select tm-select-accounts" runat="server" DataSourceID="SqlDataSource1" DataTextField="NomCat" DataValueField="NumCat"></asp:DropDownList>
                                </div>
                                <div class="row">
                                    <div class="form-group mb-3 col-xs-8 col-sm-4">
                                        <label for="txtDate">Date d'expiration</label>
                                        <asp:TextBox runat="server" Text="" ID="txtDate" TextMode="Date" required CssClass="form-control validate" />
                                    </div>
                                    <div class="form-group mb-3 col-xs-8 col-sm-4">
                                        <label for="txtPrix">Prix</label>
                                        <asp:TextBox runat="server" Text="" ID="txtPrix" TextMode="Number" required CssClass="form-control validate" />
                                    </div>
                                    <div class="form-group mb-3 col-xs-8 col-sm-4">
                                        <label for="stock"> Stock </label>
                                        <asp:TextBox runat="server" Text="" ID="stock" TextMode="Number" required CssClass="form-control validate" />
                                    </div>
                                </div>

                                </form>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12 mx-auto py-2 mb-4">
                            <div class="input-group mx-2 ">
                                <asp:FileUpload runat="server" CssClass="form-control align-content-center" ID="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload" />
                            </div>
                            <br />
                            <div class="form-group m-3 col-xs-12 col-sm-6">
                                <asp:Image ImageUrl="" Width="490" Height="360" ID="imgApercu" runat="server" />
                            </div>
                            
                        </div>
                        <div class="col">
                            <asp:Label Text="" ForeColor="Red" Font-Bold="true" CssClass="m-5 p-5" ID="txtError" runat="server" />
                            <asp:Button OnClick="btnAjoutPro_Click" ID="btnAjoutPro" Text="Ajouter le produit" CausesValidation="true" CssClass="btn w-50 btn-primary btn-block text-uppercase" runat="server" />
                        </div>
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
