<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CommanderProduit.aspx.cs" Inherits="NutritionUniverse.CommanderProduit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="boostrap/styleComnts.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="--bs-breadcrumb-divider: '>'; background-color: ghostwhite" class=" alert mt-3 pb-2 ps-5 fs-5 navbar-light bg-light w-100" role="alert" aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Acceuil.aspx">Acceuil</a></li>
            <li class="breadcrumb-item active">Prise de masse</li>
            <li class="breadcrumb-item"><a href="Gainners.aspx">Gainners</a></li>
            <!--To be added-->
            <li class="breadcrumb-item active" aria-current="page" runat="server" id="actualProduct"></li>
        </ol>
    </div>


    <br />


    <div class="container w-100">
        <table class="w-100 my-3">
            <tr>
                <td>
                    <div class="containerIMG">
                        <asp:Image CssClass="img-thumbnail" ID="PhotoLabel" runat="server" />
                    </div>
                </td>

                <td>
                    <div class="container m-1">
                        <h2 class="mb-2">
                            <asp:Label ID="NomProLabel" runat="server" Text="Nom" /></h2>
                        <h5 id="brand" runat="server" class="fw-bold text-warning"></h5>
                        <div class="w-100 mt-2 container text-center border border-dark rounded">
                            <img src="imgs/icons8-compte-vérifié-64.png" />
                            <span class="fs-6 fw-bold">Ce produit est vérifié authentique</span>
                        </div>
                        <br />
                        <p runat="server" class="card p-3" id="Desc">?? </p>
                        <br />
                        <div class="d-inline">
                            <asp:Label ID="StockLabel" runat="server" Text="En stock" ForeColor="White" BackColor="#339933" CssClass="fs-6 p-2 rounded-1" />
                            <h6 class="text-black-50 float-end mx-3" runat="server" id="nbrV">?? </h6>
                            <img class="float-end" src="imgs/icons8-star-18.png" />
                            <img class="float-end" src="imgs/icons8-star-18.png" />
                            <img class="float-end" src="imgs/icons8-star-18.png" />
                            <img class="float-end" src="imgs/icons8-star-18.png" />
                            <img class="float-end" src="imgs/icons8-star-18.png" />
                        </div>
                        <br />
                        <br />
                        <h5 class="d-inline">Date d'expiration: </h5>
                        &nbsp;
                        <h6 class="text-black-50 d-inline" id="exp" runat="server">??</h6>
                        <br />
                        <span class="font-monospace fs-1 fw-bold" runat="server" id="Price"></span>
                        &nbsp; 
                        <asp:Label Text="TTC" CssClass="text-black-50 fs-5" runat="server" />
                        <br />
                        <span runat="server" id="lblQte" class="fw-bold">Quantite: </span>&nbsp;
                        <label for="customRange2" runat="server" id="QteChoisie" class="form-label fs-5">??</label>
                        <input type="range" runat="server" onchange="setQteOnLabel()" value="1" class="form-range" min="1" id="customRange2" />
                        <br />
                        <br />
                        <div class="text-center d-inline">
                            <asp:LinkButton ID="CommanderBtn" OnClick="CommanderBtn_Click" CssClass="text-decoration-none button py-2 w-50 me-2 fs-5 text-black" runat="server">
                                <img src="imgs/icons8-soumettre-pour-approbation-48.png" />
                                &nbsp;
                                Commander maintenant
                            </asp:LinkButton>
                            <h3 class="d-inline">ou</h3>
                            <button type="button" class="btn ms-2 py-2 btn-success fs-6 d-inline">
                                Commandez sur Whatsapp
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="25" fill="currentColor" class="bi ms-2 bi-whatsapp" viewBox="0 0 16 16">
                                    <path d="M13.601 2.326A7.854 7.854 0 0 0 7.994 0C3.627 0 .068 3.558.064 7.926c0 1.399.366 2.76 1.057 3.965L0 16l4.204-1.102a7.933 7.933 0 0 0 3.79.965h.004c4.368 0 7.926-3.558 7.93-7.93A7.898 7.898 0 0 0 13.6 2.326zM7.994 14.521a6.573 6.573 0 0 1-3.356-.92l-.24-.144-2.494.654.666-2.433-.156-.251a6.56 6.56 0 0 1-1.007-3.505c0-3.626 2.957-6.584 6.591-6.584a6.56 6.56 0 0 1 4.66 1.931 6.557 6.557 0 0 1 1.928 4.66c-.004 3.639-2.961 6.592-6.592 6.592zm3.615-4.934c-.197-.099-1.17-.578-1.353-.646-.182-.065-.315-.099-.445.099-.133.197-.513.646-.627.775-.114.133-.232.148-.43.05-.197-.1-.836-.308-1.592-.985-.59-.525-.985-1.175-1.103-1.372-.114-.198-.011-.304.088-.403.087-.088.197-.232.296-.346.1-.114.133-.198.198-.33.065-.134.034-.248-.015-.347-.05-.099-.445-1.076-.612-1.47-.16-.389-.323-.335-.445-.34-.114-.007-.247-.007-.38-.007a.729.729 0 0 0-.529.247c-.182.198-.691.677-.691 1.654 0 .977.71 1.916.81 2.049.098.133 1.394 2.132 3.383 2.992.47.205.84.326 1.129.418.475.152.904.129 1.246.08.38-.058 1.171-.48 1.338-.943.164-.464.164-.86.114-.943-.049-.084-.182-.133-.38-.232z"></path>
                                </svg>

                            </button>
                        </div>
                        <br />
                        <div runat="server" id="SuccessDIV" class="alert alert-success" role="alert">
                            Votre commande a été ajoutée. Consultez votre <a href="Panier.aspx" class="alert-link">panier</a> pour la valider ou continuez vos <a href="Acceuil.aspx" class="alert-link">achats</a>.
                        </div>
                        <br />
                        <div runat="server" id="ErrorDIV" class="alert alert-danger" role="alert">
                            ??
                        </div>

                    </div>
                </td>
            </tr>
        </table>
    </div>


    <!--Comments-->
    <div class="container mt-5">
        <h2 class="mb-2">Commentaires:</h2>
        <div class="row  d-flex justify-content-center">


            <div class="card p-3">

                <div class="d-flex justify-content-between align-items-center">
                    <div class="user d-flex flex-row align-items-center">
                        <img src="imgs/icons8-user-64.png" width="30" class="user-img rounded-circle mx-2" />
                        <span><small class="font-weight-bold text-primary">otmane_chle7</small> <small class="font-weight-bold">C'est du top ! Je recommande. Nchaalah vous serez comme un cheval.</small></span>
                    </div>
                    <small>2 days ago</small>
                </div>
                <div class="action d-flex justify-content-between mt-2 align-items-center">
                    <div class="reply px-4">
                        <small>Supprimer</small>
                        <span class="dots"></span>
                        <small>Repondre</small>
                    </div>

                    <div class="icons align-items-center">
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-check-circle-o check-icon"></i>
                    </div>
                </div>
            </div>
            <div class="card p-3 mt-2">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="user d-flex flex-row align-items-center">
                        <img src="imgs/icons8-user-64.png" width="30" class="user-img rounded-circle mx-2" />
                        <span><small class="font-weight-bold text-primary">YassineDER</small> <small class="font-weight-bold">Lkhout ghda 3ndi EFF chi d3iwa laysehhel 3likom &#128591; </small></span>
                    </div>
                    <small>3 days ago</small>
                </div>
                <div class="action d-flex justify-content-between mt-2 align-items-center">
                    <div class="reply px-4">
                        <small>Supprimer</small>
                        <span class="dots"></span>
                        <small>Repondre</small>
                    </div>

                    <div class="icons align-items-center">
                        <i class="fa fa-check-circle-o check-icon text-primary"></i>
                    </div>
                </div>
            </div>

            <div class="card p-3 mt-2">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="user d-flex flex-row align-items-center">
                        <img src="imgs/icons8-user-64.png" width="30" class="user-img rounded-circle mx-2" />
                        <span><small class="font-weight-bold text-primary">rashida_amzkin</small> <small class="font-weight-bold">Honte à vous !!! Weldi jah gonflement de poitrine ghir b hadchi</small></span>
                    </div>
                    <small>3 days ago</small>
                </div>
                <div class="action d-flex justify-content-between mt-2 align-items-center">
                    <div class="reply px-4">
                        <small>Supprimer</small>
                        <span class="dots"></span>
                        <small>Repondre</small>
                    </div>

                    <div class="icons align-items-center">
                        <i class="fa fa-user-plus text-muted"></i>
                        <i class="fa fa-star-o text-muted"></i>
                        <i class="fa fa-check-circle-o check-icon text-primary"></i>
                    </div>
                </div>

                <div class="card p-3 mt-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="user d-flex flex-row align-items-center">
                            <img src="imgs/icons8-user-64.png" width="30" class="user-img rounded-circle mx-2" />
                            <span><small class="font-weight-bold text-primary">admin4782732</small> <small class="font-weight-bold text-primary">@rashida_amzkin</small> <small class="font-weight-bold">Slm, 
                                chrifa ce produit est pour femmes seulement. Veuillez consulter un generaliste le plus vite possible. </small></span>
                        </div>
                        <small>3 days ago</small>
                    </div>
                    <div class="action d-flex justify-content-between mt-2 align-items-center">
                        <div class="reply px-4">
                            <small>Supprimer</small>
                            <span class="dots"></span>
                            <small>Repondre</small>
                        </div>

                        <div class="icons align-items-center">
                            <i class="fa fa-check-circle-o check-icon text-primary"></i>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!--Comments-->
    <br />
    <br />


    <div class="container">
        <ul class="list-group list-group-horizontal-lg bg-warning">
            <li class="list-group-item w-25 bg-transparent p-4">
                <img src="imgs/icons8-en-transit.gif" height="55" width="55" />
                <div class="float-end">
                    <h6>Livraison Gratuite</h6>
                    <span>à partir de 300 Dhs</span>
                </div>
            </li>
            <li class="list-group-item w-25 bg-transparent">
                <img src="imgs/icons8-boîte.gif" class="ms-4 mt-3" height="55" width="55" />
                <div class="float-end mt-3">
                    <h6>Expédition</h6>
                    <span>Sous 24 heures</span>
                </div>
            </li>
            <li class="list-group-item w-25 bg-transparent">
                <img src="imgs/icons8-garantie.gif" class="mt-3 ms-2" height="55" width="60" />
                <div class="float-end">
                    <h6>Garantie</h6>
                    <span>Vous hésitez ?<br />
                        Interrojez nos clients.</span>
                </div>
            </li>
            <li class="list-group-item w-25 bg-transparent">
                <img src="imgs/icons8-bonne-qualité.gif" class="ms-3 mt-3" height="53" width="60" />
                <div class="float-end">
                    <h6>Qualité vaut Prix</h6>
                    <span>Produits originaux &
                        <br />
                        prix raisonnables</span>
                </div>
            </li>
        </ul>
    </div>

    <script src="boostrap/script.js"></script>
</asp:Content>
