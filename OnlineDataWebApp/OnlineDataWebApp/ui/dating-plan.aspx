<%@ Page Title="" Language="C#" MasterPageFile="~/ui/root.Master" AutoEventWireup="true" CodeBehind="dating-plan.aspx.cs" Inherits="OnlineDataWebApp.ui.dating_plan" %>

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
                                    <asp:LinkButton ID="lnkPlan" runat="server" CssClass="btn btn-primary btn-block" OnClick="lnkPlan_OnClick"><i class="fa fa-calendar"></i>&nbsp; Create Plan </asp:LinkButton>
                                </div>
                                <div class="col-12 mt-3 table-responsive">
                                    <asp:GridView ID="gridDatePlan" Width="100%" OnPageIndexChanging="gridDatePlan_OnPageIndexChanging" class="table table-bordered table-hover table-striped" AutoGenerateColumns="False" ShowHeader="False" ShowHeaderWhenEmpty="False" EmptyDataText="No Plan Found" AllowPaging="True" PageSize="30" runat="server">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="hiddenId" runat="server" Value='<%#Eval("PlanId") %>'></asp:HiddenField>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%# Convert.ToDateTime(Eval("Time")).ToString("hh:mm tt") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Description">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEdit" href='<%#"/ui/edit-date-plan.aspx?id="+Eval("PlanId") %>' runat="server" CssClass="btn btn-primary btn-block"><i class="fa fa-edit"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lnkPlan" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
