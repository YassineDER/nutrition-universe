<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AjoutCat.aspx.cs" Inherits="NutritionUniverse.AjoutCat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container tm-mt-small tm-mb-big">
        <div class="row">
            <div class="col-xl-9 col-lg-10 col-md-12 w-50 col-sm-12 mx-auto">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <div class="row tm-edit-product-row">
                        <form class="tm-edit-product-form">
                            <div class="input-group mb-3">
                                <span class="input-group-text">Nom</span>
                                <asp:TextBox runat="server" Text="" ID="txtNom" TextMode="SingleLine" required CssClass="form-control validate" />
                            </div>
                            <div class="form-group mb-3">
                                <label for="description">Description</label>
                                <asp:TextBox runat="server" Text="" ID="txtDesc" TextMode="MultiLine" Height="130" required CssClass="form-control validate" />
                            </div>
                        </form>
                    </div>
                    <asp:Label Text="" ID="txtError" ForeColor="Red" Font-Bold="true" runat="server" />
                    <br />
                    <asp:Button Text="Ajouter" ID="btnAjout" CausesValidation="true" OnClick="btnAjout_Click" CssClass="btn btn-primary btn-block w-100 text-uppercase mb-3" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
