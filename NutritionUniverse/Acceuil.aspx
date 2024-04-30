<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true"  MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Acceuil.aspx.cs" Inherits="NutritionUniverse.Acceuil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="boostrap/scroll.css" rel="stylesheet" />
    <link href="boostrap/css/style.css" rel="stylesheet" />
    <link href="boostrap/BMI.css" rel="stylesheet" />
    <style> #Cur div a{ text-decoration:none; } </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <a class="btn" id="buttonn">
        <i class="fa fa-long-arrow-up mt-1 fs-4" style="color:black;" aria-hidden="true"></i>
    </a>

    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2500">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="imgs/Slide1.jpg" class="d-block w-100 h-25" alt="slide1"/>
            </div>
            <div class="carousel-item">
                <img src="imgs/slide2.jpg" class="d-block w-100 h-25" alt="slide2"/>
                <div class="carousel-caption d-none d-md-block">
                    <h4 class="text-light">Ne vous laissez pas demotiver !</h4>
                    <h6>Nos produits ne garantissent un meilleur resultat qu'avec un bon programme d'entrainement</h6>
                    <br />
                </div>
            </div>
            <div class="carousel-item">
                <img src="imgs/slide3.jpg" class="d-block w-100 h-25" alt="slide3"/>
            </div>
            <div class="carousel-item">
                <img src="imgs/slide4.jpg" class="d-block w-100 h-25" alt="slide4"/>
            </div>
        </div>
        <button class="carousel-control-prev bg-dark bg-opacity-75" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev" style="width: 80px;">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next bg-dark bg-opacity-75" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next" style="width: 80px;">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
    </div>
    <br />
    <asp:Label Visible="false" ID="Label1" runat="server" Text="Label"></asp:Label>

    

    <div class="container border w-100 ">
        <div id="Cur" class="row ">
            <h3 class="my-4" style="font-family: 'Rubik', sans-serif;">TOP CATEGORIES</h3>
            <div class="col">
                <a href="P_Proteine.aspx">
                    <img style="width:65%;" src="imgs/Cat/Proteine-icon.png" alt="Whey" />
                </a>                
            </div>
            <div class="col">
                <a href="P_Gainers.aspx">
                    <img style="width:65%;" src="imgs/Cat/Gainer-icon.png" alt="Whey" />
                </a> 
            </div>
            <div class="col">
                <a href="P_Creatine.aspx">
                <img style="width:65%;" src="imgs/Cat/Creatine-icon.png" alt="Whey" />
                </a> 
            </div>
            <div class="col">
                <a href="P_SnacksBoissons.aspx">
                <img style="width:65%;" src="imgs/Cat/barres-snacks.png" alt="Whey" />
                </a> 
            </div>
            <div class="col">
                <a href="P_VitaminesMineraux.aspx">
                <img style="width:65%;" src="imgs/Cat/vitamines-icon.png" alt="Whey" />
                </a> 
            </div>
            <div class="col">
                <a href="P_AccessoiresExercice.aspx">
                <img style="width:65%;" src="imgs/Cat/accessoires-icon.png" alt="Whey" />
                </a> 
            </div>
        </div>
        <br />
        <br />
        <div class="row fs-5">
            <div class="col-8">
                <h1 style="font-family: 'Rubik', sans-serif;">NOUVEAUTÉS</h1>
            </div>
            Trier par:
            <div class="col-3 ">
                <select class="form-select fs-5 form-select-sm" aria-label=".form-select-sm example">
                    <option value="1">Pertinence</option>
                    <option value="2">Prix</option>
                    <option value="3">Date d'expiration</option>
                </select>
            </div>
        </div>
        
        <hr />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NutritionUniverse.Properties.Settings.chaineCNX %>" SelectCommand="select TOP 12 [NumPro],[NomPro],[DescPro],[MarquePro],CONVERT(varchar(50), [Prix]) + ' dhs'AS [Prix],[Stock],[Photo],[DateExp],[NumCat],[NbrVente] from Produit order by DateExp desc"></asp:SqlDataSource>

        <asp:DataList DataKeyField="NumPro" ID="DataList1" runat="server" CssClass="w-100"  CellSpacing="4" RepeatColumns="4" CellPadding="3" DataSourceID="SqlDataSource1">
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
        
        <br />



        <div class="row fs-5">
            <div class="col-8">
                <h1 style="font-family: 'Rubik', sans-serif;">MEILLEURES VENTES</h1>
            </div>
            Trier par:
            <div class="col-3 ">
                <select class="form-select fs-5 form-select-sm" aria-label=".form-select-sm example">
                    <option value="1">Pertinence</option>
                    <option value="2">Prix</option>
                    <option value="3">Date d'expiration</option>
                </select>
            </div>
        </div>
        <hr />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NutritionUniverse.Properties.Settings.chaineCNX %>" SelectCommand="select TOP 12 [NumPro],[NomPro],[DescPro],[MarquePro],CONVERT(varchar(50), [Prix]) + ' dhs'AS [Prix],[Stock],[Photo],[DateExp],[NumCat],[NbrVente] from Produit order by NbrVente desc"></asp:SqlDataSource>
        
        <asp:DataList ID="DataList2" CssClass="w-100" runat="server" CellSpacing="4" RepeatColumns="4" CellPadding="3" DataKeyField="NumPro" DataSourceID="SqlDataSource2">
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
    <br />

    <div class="containerbmi">
        <div class="colbmi">
            <div class="bmi-change-action">Votre poids (KG) :</div>
            <div class="rowbim">
                <input type="range" min="20" max="200" value="20" id="weight" oninput="calculate()"/>
                <span id="weight-val">20 kg</span>
            </div>
            <div class="bmi-change-action">Votre taille (cm) :</div>
            <div class="rowbim">
                <input type="range" min="100" max="250" value="100" id="height" oninput="calculate()"/>
                <span id="height-val">100 cm</span>
            </div>
            <div class="bmi-text">
                <p class="bmi-explain"><strong>Qu'est-ce que l'IMC ?</strong><br/>
                    L'indice de masse corporelle (IMC) est un indicateur plus fiable que le poids pour évaluer votre corpulence.</p>
                <p class="bmi-explain bmi-right"><strong>ما هو مُؤشر كتلة الجسم؟</strong>
                    <br/>
                    مؤشر كتلة الجسم، هو أداة لتقييم الوزن بالنسبة للطول، ومعرفة فيما إذا كان وزن الشخص مناسب لطوله، إذ يحدد مؤشر كتلة الجسم ما إن كان الوزن طبيعياً بالنسبة للطول، أو إن كان الوزن قليلاً أو زائداً، أو إذا كان المريض يعاني من السمنة.</p>
            </div>
        </div>

        <div class="colbmi">
            <div class="displaybmi">
                <p id="resultbmi">20.0</p>
                <p id="categorybmi">Poids normal</p>
                <div class="bmi-gage-container">
                    <div class="bmi-gage-image">
                        <div id="rotateWrap" class="arrow-calculator">
                            <img alt="BMI gage needle" src="imgs/BMI/arrow-calculator.gif"/>
                        </div>
                    </div>
                </div>
                <!-- <div class="bmi-result-container"> -->
                <!-- <div class="control-bmi-result-display-bmi">BMI</div> -->
                <!-- </div> -->
            </div>
        </div>
        <div class="colbmi">
            <a class="a-img-txt" href="P_Gainers.aspx">
                <img class="a-img" src="imgs/BMI/poids-insuffisant.jpg" alt="Poids insuffisant"/>
                <span id="bgbmicolor1" class="a-txt-title1 c1">Poids insuffisant</span>
                <span class="a-txt c1">Prise de masse</span>
            </a>
            <a class="a-img-txt" href="P_VitaminesMineraux.aspx">
                <img class="a-img" src="imgs/BMI/poids-normal.jpg" alt="Poids insuffisant"/>
                <span id="bgbmicolor2" class="a-txt-title1 c2">Poids normal</span>
                <span class="a-txt c2">Vitamines &amp; Bien être</span>
            </a>
            <a class="a-img-txt" href="P_BruleurDeGraisse.aspx">
                <img class="a-img" src="imgs/BMI/surpoids.jpg" alt="Poids insuffisant"/>
                <span id="bgbmicolor3" class="a-txt-title1 c3">Surpoids</span>
                <span class="a-txt c3">Brûleurs de graisse</span>
            </a>
            <a class="a-img-txt" href="P_BCAA_AcidesAmines.aspx">
                <img class="a-img" src="imgs/BMI/obesite.jpg" alt="Poids insuffisant" />
                <span id="bgbmicolor4" class="a-txt-title1 c4">Obésité</span>
                <span class="a-txt c4">Perte de poids</span>
            </a>
            <div class="bmi-text-mobi">
                <p class="bmi-explain"><strong>Qu'est-ce que l'IMC ?</strong><br/>
                    L'indice de masse corporelle (IMC) est un indicateur plus fiable que le poids pour évaluer votre corpulence.</p>
                <p class="bmi-explain bmi-right"><strong>ما هو مُؤشر كتلة الجسم؟</strong>
                    <br/>
                    مؤشر كتلة الجسم، هو أداة لتقييم الوزن بالنسبة للطول، ومعرفة فيما إذا كان وزن الشخص مناسب لطوله، إذ يحدد مؤشر كتلة الجسم ما إن كان الوزن طبيعياً بالنسبة للطول، أو إن كان الوزن قليلاً أو زائداً، أو إذا كان المريض يعاني من السمنة.</p>
            </div>
        </div>
    </div>


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



    <br />
    <script src="boostrap/jquery.min.js"></script>
    <script src="boostrap/BMI.js"></script>
    <script>
        var btn = $('#buttonn');

        $(window).scroll(function () {
            if ($(window).scrollTop() > 300) {
                btn.addClass('show');
            } else {
                btn.removeClass('show');
            }
        });

        btn.on('click', function (e) {
            e.preventDefault();
            $('html, body').animate({ scrollTop: 0 }, '300');
        });
    </script>
</asp:Content>
