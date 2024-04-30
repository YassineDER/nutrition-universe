<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inscription.aspx.cs" Inherits="NutritionUniverse.Inscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-3">
            <h4 class="fw-bold m-3" style="font-family: 'Rubik', sans-serif;">Produits recommandés</h4>
            <div id="carouselExampleFade" class="carousel slide carousel-fade m-2" data-bs-interval="3000" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="imgs/logo/male-athlete-bodybuilder_116317-3676.jpg" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="imgs/logo/6999298.jpg" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="imgs/logo/4321146_360x540.jpg" class="d-block w-100" alt="..." />
                    </div>
                </div>

            </div>
        </div>

        <div class="col-8 border p-3">
            <h3 class="fw-bolder" style="font-family: 'Rubik', sans-serif;">Créez votre compte</h3>
            <br />
            <div class="form-control-valign row mb-2">
                <div class="col-4 form-label fs-5">
                    Titre</div>
                <div class="col-7  fs-5">
                    <label class="radio-inline">
                        <span class="custom-radio">
                            <input class="form-check-input" type="radio" checked value="RDM" />
                            <span></span>
                        </span>M
                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label class="radio-inline">
                        <span class="custom-radio">
                            <input name="RD" class="form-check-input" type="radio" value="RDF" />
                            <span></span>
                        </span>Mme
                    </label>
                </div>
            </div>
            <div class="form-control-valign row mb-2">
                <div class="col-4 form-label fs-5">Nom d'utilisateur</div>
                <div class="col-7 fs-5">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" TextMode="SingleLine" required />
                </div>
            </div>
            <div class="form-control-valign row mb-2">
                <div class="col-4 form-label fs-5">Prénom</div>
                <div class="col-7 fs-5">
                    <asp:TextBox ID="txtPrenom" runat="server" CssClass="form-control" TextMode="SingleLine" required />
                </div>
            </div>
            <div class="form-control-valign row mb-2">
                <div class="col-4 form-label fs-5">Nom</div>
                <div class="col-7 fs-5">
                    <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="txtNom" required />
                </div>
            </div>
            <div class="form-control-valign row mb-2">
                <div class="col-4 form-label fs-5">Téléphone</div>
                <div class="col-7 fs-5">
                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="txtTelephone" required />
                </div>
            </div>
            <div class="form-control-valign row mb-2">
                <div class="col-4 form-label fs-5">Mot de passe</div>
                <div class="col-7">
                    <div class="input-group">
                        <input type="password" runat="server" class="form-control" aria-describedby="button-addon2" id="txtPassword" required />
                    <button class="btn btn-outline-warning" onclick="ShowHide()" type="button" id="button-addon2">Montrer</button>
                    </div>
                </div>
            </div>
            <div class="form-control-valign row mb-2">
                <div class="col-4 form-label fs-5">Adresse</div>
                <div class="col-7 fs-5">
                    <asp:TextBox ID="txtAdresse" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-control-valign row mb-2">
                <br />
                <asp:Label Text="" ID="Label9" runat="server" CssClass="col-4 form-label fs-5"></asp:Label>
                <div class="col-7 fs-5">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked />
                            S'abonner à notre newsletter
                    </div>
                </div>
            </div>
            <br />
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <asp:Button Text="S'insrire" runat="server" OnClick="Button1_Click" style="font-family: 'Rubik', sans-serif;" CssClass=" btn btn-warning btn-lg me-md-2" CausesValidation="true"></asp:Button>
            </div>

        </div>
    </div>


    
</asp:Content>
