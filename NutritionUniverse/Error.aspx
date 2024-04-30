<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="NutritionUniverse.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Error 404</title>
    <link href="boostrap/errorStyle.css" rel="stylesheet" />
</head>
<body>


    <main class="bsod container">
  <h1 class="neg title"><span class="bg">Error - 404</span></h1>
  <p runat="server" id="lblError">An error has occured, to continue:</p>
  <p>* Return to our homepage.<br />
  * Send us an e-mail about this error and try later.</p>
  <nav class="nav">
    <a href="Acceuil.aspx" class="link">Acceuil</a>&nbsp;&nbsp;<a href="Authentification.aspx" class="link">Login</a>
  </nav>
</main>
    
</body>

</html>
