<%@ Page Title="" Language="C#" MasterPageFile="~/ui/root.Master" AutoEventWireup="true" CodeBehind="edit-date-plan.aspx.cs" Inherits="OnlineDataWebApp.ui.edit_date_plan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container pt-5">
                <div class="row">
                    <div class="col-12 text-center">
                        <h3 class="font-bold">Plan Your Date</h3>
                    </div>
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="card card-body">
                            <div class="row">
                                <div class="col-12">
                                    <h6>Date</h6>
                                    <asp:TextBox ID="txtDate" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h6>Time</h6>
                                    <asp:TextBox ID="txtTime" TextMode="Time" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h6>Description</h6>
                                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" Height="80px" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <asp:LinkButton ID="lnkUpdatePlan" runat="server" CssClass="btn btn-primary btn-block" OnClick="lnkUpdatePlan_OnClick">Update Plan </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lnkUpdatePlan" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
