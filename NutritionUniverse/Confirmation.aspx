<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="NutritionUniverse.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    <link href='https://fonts.googleapis.com/css?family=Lato:300,400|Montserrat:700' rel='stylesheet' type='text/css'/>
    <style>
        @import url(//cdnjs.cloudflare.com/ajax/libs/normalize/3.0.1/normalize.min.css);
        @import url(//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css);
    </style>
    <link rel="stylesheet" href="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/default_thank_you.css"/>
    <script src="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/jquery-1.9.1.min.js"></script>
    <script src="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/html5shiv.js"></script>
    </head>
<body>
    <form runat="server">
        <header class="site-header" id="header">
        <h3 runat="server" id="ActionTitle" class="site-header__title" data-lead-id="site-header-title">Action réussie !</h3>
    </header>

    <div class="main-content">
        <i class="fa fa-check main-content__checkmark" id="checkmark"></i>
        <p class="main-content__body" id="ActText" runat="server" data-lead-id="main-content-body">??</p>
    </div>

    </form>
</body>
</html>
