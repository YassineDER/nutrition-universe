<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Comptes.aspx.cs" Inherits="NutritionUniverse.Comptes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NutritionUniverse.Properties.Settings.chaineCNX %>" SelectCommand="SELECT * FROM [Compte] order by [Username] desc"></asp:SqlDataSource>

    <div class="container mt-5 w-50">
        <div class="row tm-content-row">
            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <h2 class="tm-block-title">Liste des comptes</h2>
                    <asp:DropDownList ID="DropDownList1"  CssClass="custom-select" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Username" DataValueField="Username" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>
        </div>
        <!-- row -->
        <div class="row tm-content-row" runat="server" visible="false" id="infosCompte" >
            <asp:HiddenField runat="server" ID="num" />
            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <h2 class="tm-block-title">Parametres du compte</h2>
                    <form class="tm-signup-form row">

                        <div class="row">
                            <div class="form-group col-lg-10">
                                <label for="name">Nom d'utilisateur</label>
                                <asp:TextBox runat="server" ID="txtUsername" ForeColor="#f0f0f0" BackColor="#54657d" TextMode="SingleLine" ReadOnly="true" CssClass="form-control" />
                            </div>
                            <div class="form-check form-group form-switch col-lg-2 mt-4 pt-3">
                                <input class="form-check-input" type="checkbox" role="switch" runat="server" id="isActif" checked />&nbsp;
                                <label class="form-check-label text-light" for="isActif">Actif</label>
                            </div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label for="email">Categorie</label>
                            <select runat="server" id="Cat" class="custom-select form-control validate" >
                                <option value="client">Client</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                        <div class="form-group col-lg-12">
                            <label for="password">Mot de passe</label>
                            <asp:TextBox runat="server" ID="txtPassword" TextMode="SingleLine" CssClass="form-control validate" />
                        </div>
                        <asp:Label Text="" ID="txtError" Font-Bold="true" ForeColor="Red" runat="server" />
                        <br />
                        <div class="form-group col-lg-12">
                            <asp:Button Text="Mise a jour du profile" ID="btnUpdate" CausesValidation="false" OnClick="btnUpdate_Click" CssClass="btn btn-primary form-control btn-block text-uppercase" runat="server" />
                            &nbsp;
                            <asp:Button Text="Supprimer le compte" ID="btnDelete" CausesValidation="false" OnClick="btnDelete_Click" CssClass="btn btn-primary form-control btn-block text-uppercase" runat="server" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
