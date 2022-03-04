<%@ Page Title="" Language="C#" MasterPageFile="~/ui/root.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs"
    Inherits="OnlineDataWebApp.ui.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Resources/css/style.css" rel="stylesheet" /> 
    <div class="root-div">
        <div class="opacity-div">
            <div class="container h-100">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6 mt-5">
                        <div class="card card-body shadow" style="background: rgba(0,0,0,0.5); color: #ffffff;">
                            <div class="row">
                                <div class="col-12">
                                    <h3>I'm looking for</h3>
                                </div>
                                <div class="col-12 pt-4">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="radio-gender">
                                                <input type="radio" name="gender" value="Female" />
                                                <i class="fas fa-female fa-lg"></i>
                                                <h6 class="mb-0">Women</h6>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="radio-gender">
                                                <input type="radio" name="gender" value="Male" />
                                                <i class="fas fa-male fa-lg"></i>
                                                <h5 class="mb-0">Man</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 pt-4">
                                    <h6>Age</h6>
                                    <div class="row mt-2">
                                        <div class="col-6 text-center">
                                            <asp:TextBox ID="txtRange1" class="range1 form-control text-center" runat="server" Text="12">
                                            </asp:TextBox>
                                        </div>
                                        <div class="col-6 text-center">
                                            <asp:TextBox ID="txtRange2" class="range2 form-control text-center" runat="server" Text="51">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="multi-slider">
                                        <input id="a" type="range" min="12" class="range" max="50" value="12" />
                                        <input id="b" type="range" min="51" class="range" max="100" value="51" />
                                    </div>

                                </div>
                                <div class="col-12 pt-2">
                                    <h6>Commitment</h6>
                                    <asp:DropDownList ID="ddlCommitment" CssClass="form-control" runat="server">
                                        <asp:ListItem>SELECT</asp:ListItem>
                                        <asp:ListItem>Friends</asp:ListItem>
                                        <asp:ListItem>Relationship</asp:ListItem>
                                        <asp:ListItem>Marriage</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-12 pt-2">
                                    <h6>City</h6>
                                    <asp:TextBox ID="txtCity" class="form-control" runat="server"
                                        placeholder="New York, Las Vegas etc.">
                                    </asp:TextBox>
                                </div>
                                <div class="col-12 pt-2">
                                    <h6>State</h6>
                                    <asp:TextBox ID="txtState" class="form-control text-uppercase" runat="server"
                                        placeholder="NY, LV etc.">
                                    </asp:TextBox>
                                </div>
                                <div class="col-12 pt-2 text-center">
                                    <asp:LinkButton ID="lnkSearch" class="btn btn-primary" runat="server"><i class="fas fa-search"></i>&nbsp;Find Match</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <script src="../Resources/jquery-3.5.0.min.js"></script>
    <script src="../Resources/js/style.js"></script> 
</asp:Content>
