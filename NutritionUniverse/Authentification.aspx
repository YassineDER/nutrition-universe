<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authentification.aspx.cs" Inherits="NutritionUniverse.Authentification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login - Nutrition Universe</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="boostrap/styleLogin.css" rel="stylesheet" />
</head>


<body class="img js-fullheight">

    <video id="background-video" autoplay loop muted >
        <source src="imgs/BG/videoplayback (1).mp4" type="video/mp4" />
    </video>

    <form id="form1" runat="server">

        <section class="ftco-section">

            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-2">
                        <a class="text-decoration-none" href="Acceuil.aspx">
                        <img class="heading-section" src="imgs/logo/logo-removebg-preview.png" /></a>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-5">
                        <div class="login-wrap p-0">
                            <br />
                            <form action="#" class="signin-form">
                                <div class="form-group">
                                    <asp:TextBox TextMode="SingleLine" runat="server" CssClass="form-control" ID="txtUsername" placeholder="Nom d'utilisateur" required />
                                </div>

                                <div class="form-group">
                                    <asp:TextBox ID="password_field" runat="server" TextMode="Password" CssClass="form-control" placeholder="Mot de passe" required />
                                    <span toggle="#password_field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                
                                <div runat="server" id="ErrorDIV" class="alert w-100 opacity-75 alert-danger d-inline-block" role="alert">
                                    <h6 runat="server" id="ErrorMSG" class="d-inline float-start"> ??? </h6> 
                                    <i class="fa fa-times d-inline float-right mt-2" aria-hidden="true"></i>
                                </div>

                                <div class="form-group">
                                    <asp:Button runat="server" style="background-color:#FFC107; color:black; opacity: .8;" Text="Se connecter" OnClick="Button1_Click" CssClass="form-control btn text-black px-3" />
                                </div>
                                
                            </form>

                        </div>
                    </div>
                </div>
            </div>

        </section>
    </form>

    
    <script src="boostrap/jquery.min.js"></script>
    <script src="boostrap/popper.js"></script>
    <script src="boostrap/js/bootstrap.bundle.js"></script>
    <script src="boostrap/main.js"></script>


</body>
</html>
