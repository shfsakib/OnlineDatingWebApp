<%@ Page Title="" Language="C#" MasterPageFile="~/ui/root.Master" AutoEventWireup="true" CodeBehind="profile-details.aspx.cs" Inherits="OnlineDataWebApp.ui.profile_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container pt-5">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6 text-center">
                        <img id="profileImg" runat="server"
                            style="width: 225px; height: 225px; border-radius: 50%;" />
                        <asp:FileUpload ID="fileProfile" CssClass="form-control mt-2" Visible="False"
                            accept=".png,.jpg,.jpeg" runat="server" />
                        <div class="d-flex text-center justify-content-center">
                            <h3 class="mt-4" runat="server" id="lblFullName">User Name</h3>
                            <asp:TextBox ID="txtName" placeholder="e.g. e.g. John Abraham" autocomplete="off" class="form-control"
                                Style="margin-top: 20px;" Visible="False" runat="server"></asp:TextBox>
                        </div>
                        <% if (Request.QueryString["type"] != null)
                            { %>
                        <div class="row mt-3">
                            <div class="col-12 text-center">
                                <h5 class="font-bold">Total Date Request Sent:&nbsp;<asp:Label ID="lblReqSent" runat="server" Text=""></asp:Label>
                                </h5>
                            </div>
                            <div class="col-12 text-center">
                                <h5 class="font-bold">Total Date Request Denied:&nbsp;<asp:Label ID="lblReqDenied" runat="server" Text=""></asp:Label>
                                </h5>
                            </div>
                            <div class="col-12 text-center">
                                <h5 class="font-bold">Total Date Request Ignored:&nbsp;<asp:Label ID="lblReqIgnored" runat="server" Text=""></asp:Label>
                                </h5>
                            </div>
                        </div>
                        <% } %>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
                <div class="row mb-4">
                    <div class="col-12">
                        <div class="card card-body mt-4">
                            <div class="row">
                                <div class="col-12 text-left">
                                    <h3 class="font-bold">Personal Information</h3>
                                </div>

                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-12">
                                    <h5 class="font-bold">Occupation</h5>
                                    <asp:Label ID="lblOccupation" runat="server" CssClass="font-20"
                                        Text="Doctor,Engineer etc."></asp:Label>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Gender</h5>
                                    <asp:Label ID="lblGender" runat="server" CssClass="font-20"
                                        Text="Male"></asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Age</h5>
                                    <asp:Label ID="lblAge" runat="server" CssClass="font-20" Text="XXX"></asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Height (in cm)</h5>
                                    <asp:Label ID="lblHeight" runat="server" CssClass="font-20" Text="XXXX">
                                    </asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Weight (in kg)</h5>
                                    <asp:Label ID="lblWeight" runat="server" CssClass="font-20" Text="XXXX">
                                    </asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Interest</h5>
                                    <asp:Label ID="lblInterest" runat="server" CssClass="font-20"
                                        Text="Men,Women or Both"></asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Likes</h5>
                                    <asp:Label ID="lblLikes" runat="server" CssClass="font-20"
                                        Text="Hangout,Exploring etc."></asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Dislikes</h5>
                                    <asp:Label ID="lblDislikes" runat="server" CssClass="font-20"
                                        Text="Gaming etc."></asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Goals</h5>
                                    <asp:Label ID="lblGoal" runat="server" CssClass="font-20"
                                        Text="World tour etc."></asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Commitment Type</h5>
                                    <asp:Label ID="lblCommitment" runat="server" CssClass="font-20"
                                        Text="friends/relationship/marriage"></asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Description used to attract other daters</h5>
                                    <asp:Label ID="lblDescription" runat="server" CssClass="font-20"
                                        Text="Write about yourself"></asp:Label>

                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-12 text-left">
                                    <h3 class="font-bold">Favorite Information</h3>
                                </div>

                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Restaurants</h5>
                                    <asp:Label ID="lblRestaurant" runat="server" CssClass="font-20"
                                        Text="Restaurant Name"></asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Movies</h5>
                                    <asp:Label ID="lblMovie" runat="server" CssClass="font-20"
                                        Text="Avengers, Spider Man etc."></asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Books</h5>
                                    <asp:Label ID="lblBooks" runat="server" CssClass="font-20"
                                        Text="Sherlock Holmes etc."></asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Poems Quotes</h5>
                                    <asp:Label ID="lblPoem" runat="server" CssClass="font-20"
                                        Text="Poes Quotes etc."></asp:Label>

                                </div>

                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Saying</h5>
                                    <asp:Label ID="lblSaying" runat="server" CssClass="font-20" Text="Saying etc.">
                                    </asp:Label>

                                </div>

                            </div>
                            <div class="row mt-4">
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-12 text-left">
                                    <h3 class="font-bold">Contact Information</h3>
                                </div>

                                <div class="col-12">
                                    <hr>
                                </div>

                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">City</h5>
                                    <asp:Label ID="lblCity" runat="server" CssClass="font-20"
                                        Text="New York, Las Vegas etc."></asp:Label>

                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">State</h5>
                                    <asp:Label ID="lblState" runat="server" CssClass="font-20" Text="NY,LV etc.">
                                    </asp:Label>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
