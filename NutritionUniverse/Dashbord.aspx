<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Dashbord.aspx.cs" Inherits="NutritionUniverse.Dashbord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h5 runat="server" id="bienv" class="text-light mx-xl-5 my-4">Bienvenue, </h5>
              
    <div class="container">
        <div class="row tm-content-row">
            <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                <div class="tm-bg-primary-dark tm-block">
                    <h2 class="tm-block-title"><i class="fa fa-line-chart" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp; Ventes</h2>
                    <br />
                    <canvas id="lineChart"></canvas>
                </div>
            </div>
            
            
            <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                    <h2 class="tm-block-title"><i class="fa fa-bell-o" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Notifications</h2>
                    <div class="tm-notification-items">
                        <asp:Repeater  ID="RepeterDetails" runat="server">
                            <ItemTemplate>
                                <div class="media tm-notification-item">
                                        <img src="imgs/icons8-user-64.png" alt="Avatar Image" class="rounded-circle" />
                                    <div class="media-body mx-2">
                                        <p class="mb-2">
                                            <asp:Label Font-Bold="true" runat="server" ID="txtUser" Text='<%# Eval("Username") %>' CssClass="mb-2" />
                                        <span> nous a rejoint et attend votre autorisation. Activez son compte dans la rubrique <asp:LinkButton Text="Comptes" CssClass="fw-bold text-warning text-decoration-none" PostBackUrl="~/ActivationComptes.aspx" runat="server" />.</span>
                                            <br />
                                            <br />
                                            <span runat="server" id="timeAgo" class="text-right tm-small tm-text-color-secondary">Il y a 9 heures</span>
                                        </p>
                                        
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            </div>
            
    </div>


</asp:Content>
