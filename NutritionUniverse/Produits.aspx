<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Produits.aspx.cs" Inherits="NutritionUniverse.Produits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            left: -1px;
            top: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NutritionUniverse.Properties.Settings.chaineCNX %>" 
        SelectCommand="SELECT [NumPro], [NomPro], [MarquePro], [Prix], [Stock], [DateExp], [NbrVente] FROM [Produit]" DeleteCommand="DELETE FROM [Produit] WHERE [NumPro] = @NumPro" InsertCommand="INSERT INTO [Produit] ([NumPro], [NomPro], [MarquePro], [Prix], [Stock], [DateExp], [NbrVente]) VALUES (@NumPro, @NomPro, @MarquePro, @Prix, @Stock, @DateExp, @NbrVente)" UpdateCommand="UPDATE [Produit] SET [NomPro] = @NomPro, [MarquePro] = @MarquePro, [Prix] = @Prix, [Stock] = @Stock, [DateExp] = @DateExp, [NbrVente] = @NbrVente WHERE [NumPro] = @NumPro">
        <DeleteParameters>
            <asp:Parameter Name="NumPro" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NumPro" Type="Int32" />
            <asp:Parameter Name="NomPro" Type="String" />
            <asp:Parameter Name="MarquePro" Type="String" />
            <asp:Parameter Name="Prix" Type="Double" />
            <asp:Parameter Name="Stock" Type="Int32" />
            <asp:Parameter DbType="Date" Name="DateExp" />
            <asp:Parameter Name="NbrVente" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NomPro" Type="String" />
            <asp:Parameter Name="MarquePro" Type="String" />
            <asp:Parameter Name="Prix" Type="Double" />
            <asp:Parameter Name="Stock" Type="Int32" />
            <asp:Parameter DbType="Date" Name="DateExp" />
            <asp:Parameter Name="NbrVente" Type="Int32" />
            <asp:Parameter Name="NumPro" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NutritionUniverse.Properties.Settings.chaineCNX %>" 
        SelectCommand="SELECT * FROM [Catégorie]" DeleteCommand="DELETE FROM [Catégorie] WHERE [NumCat] = @NumCat" InsertCommand="INSERT INTO [Catégorie] ([NumCat], [NomCat], [DescCat]) VALUES (@NumCat, @NomCat, @DescCat)" UpdateCommand="UPDATE [Catégorie] SET [NomCat] = @NomCat, [DescCat] = @DescCat WHERE [NumCat] = @NumCat">
        <DeleteParameters>
            <asp:Parameter Name="NumCat" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NumCat" Type="Int32" />
            <asp:Parameter Name="NomCat" Type="String" />
            <asp:Parameter Name="DescCat" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NomCat" Type="String" />
            <asp:Parameter Name="DescCat" Type="String" />
            <asp:Parameter Name="NumCat" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="container mt-4">
        <div class="row tm-content-row">
            <div class="col-12 tm-block-col ">
                <div class="tm-bg-primary-dark tm-block-products tm-block ">
                    <div class="tm-product-table-container text-center">
                        <asp:GridView ID="GridView1" CssClass="table text-center table-hover tm-table-small tm-product-table" runat="server" AutoGenerateColumns="False" DataKeyNames="NumPro" DataSourceID="SqlDataSource1">
                            <HeaderStyle CssClass="h5 align-middle text-center" />
                            
                            <Columns>
                                <asp:BoundField DataField="NumPro" HeaderText="NumPro" ReadOnly="True" SortExpression="NumPro" Visible="False">
                                <HeaderStyle CssClass="w-25" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NomPro" HeaderText="Nom du produit" SortExpression="NomPro">
                                <HeaderStyle Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MarquePro" HeaderText="Marque" SortExpression="MarquePro">
                                <HeaderStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Prix" HeaderText="Prix" SortExpression="Prix">
                                <HeaderStyle Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock">
                                <HeaderStyle Width="5%" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Date d'expiration" SortExpression="DateExp">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" TextMode="Date" runat="server" Text='<%# Bind("DateExp","{0:d}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateExp","{0:d}")  %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="15%" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="NbrVente" HeaderText="Nombre de vente" SortExpression="NbrVente">
                                <HeaderStyle Width="15%" />
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:ImageButton ImageUrl="~/imgs/icons8-confirm-30.png" ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Update" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton ImageUrl="~/imgs/icons8-flèche-gauche-30.png" ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Cancel" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ImageUrl="~/imgs/icons8-modifier-14.png" ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton ImageUrl="~/imgs/icons8-effacer-15.png" ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" />
                                    </ItemTemplate>
                                    <ControlStyle  />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <br />
                    <asp:LinkButton Text="Ajouter un nouveau produit" runat="server" PostBackUrl="~/AjoutProduit.aspx"  CssClass="btn btn-primary btn-block text-uppercase w-100 mb-3"></asp:LinkButton>
                </div>
            </div>




            <div class="auto-style1">
                <div class="tm-bg-primary-dark tm-block-products tm-block">
                    <h2 class="text-light ms-2 mb-5">Categories</h2>
                    <div class="tm-product-table-container">
                        <asp:GridView runat="server" CssClass="table table-hover tm-table-small tm-product-table" ID="GV2" AutoGenerateColumns="False" DataKeyNames="NumCat" DataSourceID="SqlDataSource2" >
                            <HeaderStyle CssClass="h5 align-middle text-center" />
                            <Columns>
                                <asp:BoundField DataField="NumCat" HeaderText="NumCat" ReadOnly="True" SortExpression="NumCat" Visible="False" />
                                <asp:TemplateField HeaderText="Nom de la categorie" SortExpression="NomCat">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NomCat") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("NomCat") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="20%" CssClass="align-middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description" SortExpression="DescCat">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" TextMode="MultiLine" Width="100%" Height="100" runat="server" Text='<%# Bind("DescCat") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DescCat") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="60%" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:ImageButton ImageUrl="~/imgs/icons8-confirm-30.png" ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Update" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton ImageUrl="~/imgs/icons8-flèche-gauche-30.png" ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Cancel" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ImageUrl="~/imgs/icons8-modifier-14.png" ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton ImageUrl="~/imgs/icons8-effacer-15.png" ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" />
                                    </ItemTemplate>
                                    <ControlStyle CssClass="ms-5" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                        <br />

                    <asp:Button Text="Ajouter une categorie" ID="btnAjouterCat" PostBackUrl="~/AjoutCat.aspx" CssClass="btn btn-primary btn-block w-100 text-uppercase mb-3" runat="server" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
