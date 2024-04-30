<%@ Page Title="Votre panier" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Panier.aspx.cs" Inherits="NutritionUniverse.Panier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <%--<link href="boostrap/stylePanier.css" rel="stylesheet" />--%>
     <link href="https://fr.allfont.net/allfont.css?fonts=droid-serif" rel="stylesheet" type="text/css" />
    <link href="boostrap/css/style.css" rel="stylesheet" />
    <style>
        html, body{
            width:100%;
            height:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    
    <div class="container d-flex w-100 ms-0 me-0">
        <div class="row ">
            <div class="col-md-8 d-block " >
                <asp:GridView ID="GridView1"  GridLines="None"  runat="server" CssClass="w-100 table mt-0 d-inline-block" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" HorizontalAlign="Justify">
                    <Columns>
                        
                        <asp:TemplateField ConvertEmptyStringToNull="False" SortExpression="Photo" ShowHeader="False" HeaderText="Panier">
                            <ItemTemplate>
                                <br />
                                <asp:Image runat="server" CssClass="rounded img-thumbnail rounded-circle" DataField="Photo" Width="170" Height="170" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String( (byte[]) Eval("Photo")  ) %>' />
                                <br />
                            </ItemTemplate>
                            <HeaderStyle CssClass="fs-3 text-uppercase" />
                            <ItemStyle Width="200px" Wrap="False" CssClass="p-0 m-0" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Produit" SortExpression="Produit">
                            <ItemTemplate>
                                <asp:Label CssClass="fs-5 fw-bold" ID="txtProd" runat="server" Text='<%# Bind("Produit") %>'></asp:Label><br />
                                <asp:Label CssClass="btn-shine fs-6 fst-italic text-wrap" ID="txtMarq" runat="server" Text='<%# Bind("Marque") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle ForeColor="White" />
                            <ItemStyle Width="200px" CssClass="align-content-center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Prix/Unite" SortExpression="Prix/Unite">
                            <ItemTemplate>
                                <asp:Label ID="txtPrix" CssClass=" font-monospace fs-4" runat="server" Text='<%# Bind("[Prix/Unite]") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle ForeColor="White" />
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quantite" SortExpression="Quantite">
                            <ItemTemplate>
                                <div class="input-group">
                                    <asp:TextBox ID="txtQ" TextMode="Number" name="quantity" CssClass="quantity form-control input-number" min="1" max="100" runat="server" Text='<%# Eval("Quantite") %>'></asp:TextBox>
                                </div>
                            </ItemTemplate>
                            <HeaderStyle ForeColor="White" />
                            <ItemStyle CssClass="quantity" />
                        </asp:TemplateField>

                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/imgs/icons8-modifier-14.png" CssClass="btn btn-outline-warning border-2 btn-floating"   />
                                <br />
                                <br />
                                <asp:ImageButton ID="btnRemove" ImageUrl="~/imgs/icons8-effacer-15.png" CssClass="btn btn-outline-danger border-2 btn-floating" runat="server"   />
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="bg-warning" />
                </asp:GridView>
            </div>
            </div>
    

            <div class="col-md-4 py-5" style="width:30%;">
                <h4>Resumé de la commande </h4>
                <div class="card">
                    <div class="d-flex justify-content-between px-2 py-4">
                        <div class="d-flex flex-column">
                            <span runat="server" id="nbArt" class="fs-5">?? nbr Articles </span>
                        </div>
                        <div>
                            <span runat="server" id="QteXnb" class="fs-5">Prix Dhs</span>
                        </div>
                    </div>
                    <hr class="mt-0 line" />
                    <div class="px-2  py-4">
                        <div class="d-flex justify-content-between mb-2">
                            <span>Politique de retour <i class="fa fa-check-circle-o" aria-hidden="true"></i></span>
                            <span>50.00 Dhs</span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span>Frais de livraison <i class="fa fa-clock-o"></i></span>
                            <span>19.00 Dhs</span>
                        </div>
                    </div>
                    <hr class="mt-2 line" />
                    <div class="px-2 py-3 d-flex justify-content-between">
                        <div class="d-flex flex-column">
                            <span>Total TTC:</span>
                        </div>
                        <h5 runat="server" id="Total" class="font-monospace" >?? Dhs</h5>
                    </div>
                    <div class="px-2 py-4">
                        <asp:Button Text="Passer la commande" OnClick="btnConfimrer_Click" runat="server" ID="btnConfimrer" CssClass="btn fs-5 btn-warning btn-block free-button mb-3 pb-1" />
                        <div class="text-center">
                            <a class="link link-warning" href="#">Vous avez un code promo ?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

   
    <br />
    <br />
    <br />
    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NutritionUniverse.Properties.Settings.chaineCNX %>" SelectCommand="
SELECT P.Photo,P.NomPro AS 'Produit', P.MarquePro AS 'Marque',CONVERT(varchar, P.Prix) + ' DHS' AS 'Prix unitaire', PC.Qte AS 'Quantite' from
Produit P inner join ProduitCommande PC on P.NumPro = PC.NumPro inner join Commande C on
PC.NumCom = C.NumCom inner join Client Cl on C.IDC = Cl.IDC where Statut='non-valide' and
Cl.Username=@x" 
        UpdateCommand="UPDATE ProduitCommande set Qte=@x">
        <SelectParameters>
            <asp:SessionParameter Name="x" SessionField="Login" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="x" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NutritionUniverse.Properties.Settings.chaineCNX %>" 

        SelectCommand="SELECT P.Photo,P.NomPro AS 'Produit', P.MarquePro AS 'Marque',CONVERT(nvarchar, P.Prix) +
        ' Dhs/unite' AS 'Prix/Unite', CONVERT(nvarchar,PC.Qte) AS 'Quantite' from Produit P inner join ProduitCommande PC on P.NumPro
        = PC.NumPro inner join Commande C on PC.NumCom = C.NumCom inner join Client Cl on C.IDC = Cl.IDC where 
        Statut='non-valide' and Cl.Username=@x" 
        DeleteCommand="DELETE FROM [ProduitCommande] WHERE [NumCom] = @NC and [NumPro] = @NP" 
        UpdateCommand="UPDATE [ProduitCommande] SET [Qte] = @Q WHERE [NumCom]=@NC AND [NumPro]=@NP">

        <SelectParameters>
            <asp:SessionParameter Name="x" SessionField="Login" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="NC" DbType="String" />
            <asp:Parameter Name="NP" DbType="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Q" DbType="String" />
            <asp:Parameter Name="NC" DbType="String" />
            <asp:Parameter Name="NP" DbType="String" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>

    <script src="boostrap/js/jsCart/jquery.min.js"></script>
	<script src="boostrap/js/jsCart/popper.js"></script>
	<script src="boostrap/js/jsCart/bootstrap.min.js"></script>
	<script src="boostrap/js/jsCart/main.js"></script>
</asp:Content>
