<%@ Page Title="" Language="C#" MasterPageFile="~/ui/root.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs"
    Inherits="OnlineDataWebApp.ui.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6 text-center">
                        <img src="../Resources/images/user.png"
                            style="width: 225px; height: 225px; border-radius: 50%;" />
                        <asp:FileUpload ID="fileProfile" CssClass="form-control mt-2" accept=".png,.jpg,.jpeg" runat="server" />
                        <div class="d-flex text-center justify-content-center">
                            <h3 class="mt-4" runat="server" id="lblFullName">User Name</h3>
                            <asp:TextBox ID="txtName" placeholder="e.g. e.g. John Abraham" class="form-control" Style="margin-top: 20px;" Visible="False" runat="server"></asp:TextBox>
                            <asp:LinkButton ID="lnkUpdate" Style="margin-top: 30px; margin-left: 15px;" title="Update" OnClick="lnkUpdate_OnClick" Visible="False" runat="server"><i class="fas fa-check fa-lg"></i></asp:LinkButton>
                            <asp:LinkButton ID="lnkChangeName" Style="margin-top: 30px; margin-left: 15px;" title="Change Name" OnClick="lnkChangeName_OnClick" runat="server"><i class="fas fa-edit fa-lg"></i></asp:LinkButton>
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
                <div class="row mb-4">
                    <div class="col-12">
                        <div class="card card-body mt-4">
                            <div class="row">
                                <div class="col-10 text-left">
                                    <h3 class="font-bold">Personal Information</h3>
                                </div>
                                <div class="col-2 text-right">
                                    <asp:LinkButton ID="lnkUpdateInfo" Style="margin-top: 30px; margin-left: 15px;" Visible="False" title="Update Personal Information" runat="server"><i class="fas fa-check fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lnkChangeInfo" Style="margin-top: 30px; margin-left: 15px;" runat="server" title="Edit Personal Information"><i class="fas fa-edit fa-lg"></i></asp:LinkButton>
                                </div>
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-12">
                                    <h5 class="font-bold">Occupation</h5>
                                    <asp:Label ID="lblOccupation" runat="server" CssClass="font-20" Text="Doctor,Engineer etc."></asp:Label>
                                    <asp:TextBox ID="txtOccupation" placeholder="e.g. Doctor,Engineer etc." class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Age</h5>
                                    <asp:Label ID="lblAge" runat="server" CssClass="font-20" Text="XXX"></asp:Label>
                                    <asp:TextBox ID="txtAge" placeholder="e.g. XXX" class="form-control" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Height (in cm)</h5>
                                    <asp:Label ID="lblHeight" runat="server" CssClass="font-20" Text="XXXX"></asp:Label>
                                    <asp:TextBox ID="txtHeight" placeholder="e.g. XXXX" class="form-control" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Weight (in kg)</h5>
                                    <asp:Label ID="lblWeight" runat="server" CssClass="font-20" Text="XXXX"></asp:Label>
                                    <asp:TextBox ID="txtWeight" placeholder="e.g. XXXX" class="form-control" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Interest</h5>
                                    <asp:Label ID="lblInterest" runat="server" CssClass="font-20" Text="Men,Women or Both"></asp:Label>
                                    <asp:TextBox ID="txtInterest" placeholder="e.g. Men,Women or Both" class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Likes</h5>
                                    <asp:Label ID="lblLikes" runat="server" CssClass="font-20" Text="Hangout,Exploring etc."></asp:Label>
                                    <asp:TextBox ID="txtLikes" placeholder="e.g. Hangout,Exploring etc." class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Dislikes</h5>
                                    <asp:Label ID="lblDislikes" runat="server" CssClass="font-20" Text="Gaming etc."></asp:Label>
                                    <asp:TextBox ID="txtDislikes" placeholder="e.g. Gaming etc." class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Goals</h5>
                                    <asp:Label ID="lblGoal" runat="server" CssClass="font-20" Text="World tour etc."></asp:Label>
                                    <asp:TextBox ID="txtGoal" placeholder="e.g. World tour etc." class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Commitment Type</h5>
                                    <asp:Label ID="lblCommitment" runat="server" CssClass="font-20" Text="friends/relationship/marriage"></asp:Label>
                                    <asp:DropDownList ID="ddlCommitment" CssClass="form-control" runat="server">
                                        <asp:ListItem>SELECT</asp:ListItem>
                                        <asp:ListItem>Friends</asp:ListItem>
                                        <asp:ListItem>Relationship</asp:ListItem>
                                        <asp:ListItem>Marriage</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Description used to attract other daters</h5>
                                    <asp:Label ID="lblDescription" runat="server" CssClass="font-20" Text="Write about yourself"></asp:Label>
                                    <asp:TextBox ID="txtDescription" Height="80px" TextMode="MultiLine" placeholder="e.g. Write about yourself" class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-10 text-left">
                                    <h3 class="font-bold">Favorite Information</h3>
                                </div>
                                <div class="col-2 text-right">
                                    <asp:LinkButton ID="lnkUpdateFavorite" Style="margin-top: 30px; margin-left: 15px;" Visible="False" title="Update Contact Information" runat="server"><i class="fas fa-check fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lnkChangeFavorite" Style="margin-top: 30px; margin-left: 15px;" runat="server" title="Edit Contact Information"><i class="fas fa-edit fa-lg"></i></asp:LinkButton>
                                </div>
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Restaurants</h5>
                                    <asp:Label ID="lblRestaurant" runat="server" CssClass="font-20" Text="Restaurant Name"></asp:Label>
                                    <asp:TextBox ID="txtRestaurant" placeholder="e.g. World Cuisine, The Gallery etc." class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Movies</h5>
                                    <asp:Label ID="lblMovie" runat="server" CssClass="font-20" Text="Avengers, Spider Man etc."></asp:Label>
                                    <asp:TextBox ID="txtMovie" placeholder="e.g. Avengers, Spider Man etc." class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Books</h5>
                                    <asp:Label ID="lblBooks" runat="server" CssClass="font-20" Text="Sherlock Holmes etc."></asp:Label>
                                    <asp:TextBox ID="txtBooks" placeholder="e.g. Sherlock Holmes etc." class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Poems Quotes</h5>
                                    <asp:Label ID="lblPoem" runat="server" CssClass="font-20" Text="Poes Quotes etc."></asp:Label>
                                    <asp:TextBox ID="txtPoem" placeholder="e.g. Write your favorite poem or quotes" class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                              
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Saying</h5>
                                    <asp:Label ID="lblSaying" runat="server" CssClass="font-20" Text="Saying etc."></asp:Label>
                                    <asp:TextBox ID="txtSaying" placeholder="e.g. Write your say" class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>

                            </div>
                            <div class="row mt-4">
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-10 text-left">
                                    <h3 class="font-bold">Contact Information</h3>
                                </div>
                                <div class="col-2 text-right">
                                    <asp:LinkButton ID="lnkUpdateContact" Style="margin-top: 30px; margin-left: 15px;" Visible="False" title="Update Contact Information" runat="server"><i class="fas fa-check fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lnkChangeContact" Style="margin-top: 30px; margin-left: 15px;" runat="server" title="Edit Contact Information"><i class="fas fa-edit fa-lg"></i></asp:LinkButton>
                                </div>
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-12">
                                    <h5 class="font-bold">Email</h5>
                                    <asp:Label ID="lblEmail" runat="server" CssClass="font-20" Text="name@example.com"></asp:Label>
                                    <asp:TextBox ID="txtEmail" TextMode="Email" placeholder="e.g. name@example.com" class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Contact No.</h5>
                                    <asp:Label ID="lblContact" runat="server" CssClass="font-20" Text="XXX XXX XXXX"></asp:Label>
                                    <asp:TextBox ID="txtContact" placeholder="e.g. name@example.com" class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Address</h5>
                                    <asp:Label ID="lblAddress" runat="server" CssClass="font-20" Text="XXXXXXXXXX"></asp:Label>
                                    <asp:TextBox ID="txtAddress" TextMode="MultiLine" Height="100px" placeholder="e.g. Enter your address" class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">City</h5>
                                    <asp:Label ID="lblCity" runat="server" CssClass="font-20" Text="New York, Las Vegas etc."></asp:Label>
                                    <asp:TextBox ID="txtCity" placeholder="e.g. New York, Las Vegas etc." class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">State</h5>
                                    <asp:Label ID="lblState" runat="server" CssClass="font-20" Text="NY,LV etc."></asp:Label>
                                    <asp:TextBox ID="txtState" placeholder="e.g. NY,LV etc." class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-10 text-left">
                                    <h3 class="font-bold">Other Information</h3>
                                </div>
                                <div class="col-2 text-right">
                                    <asp:LinkButton ID="lnkUpdateOther" Style="margin-top: 30px; margin-left: 15px;" Visible="False" title="Update Contact Information" runat="server"><i class="fas fa-check fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lnkChangeOther" Style="margin-top: 30px; margin-left: 15px;" runat="server" title="Edit Contact Information"><i class="fas fa-edit fa-lg"></i></asp:LinkButton>
                                </div>
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-12">
                                    <h5 class="font-bold">Visibility</h5>
                                    <asp:Label ID="lblVisible" runat="server" CssClass="font-20" Text="Public"></asp:Label>
                                    <asp:DropDownList ID="ddlVisible" CssClass="form-control" runat="server">
                                        <asp:ListItem>SELECT</asp:ListItem>
                                        <asp:ListItem>Public</asp:ListItem>
                                        <asp:ListItem>Private</asp:ListItem> 
                                    </asp:DropDownList>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">User Name</h5>
                                    <asp:Label ID="lblUserName" runat="server" CssClass="font-20" Text="UserName"></asp:Label>
                                    <asp:TextBox ID="txtUserName" placeholder="e.g. johnabraham" class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 mt-2">
                                    <h5 class="font-bold">Password</h5>
                                    <asp:Label ID="lblPassword" runat="server" CssClass="font-20" Text="********"></asp:Label>
                                    <asp:TextBox ID="txtPassword" placeholder="e.g. Password" class="form-control" Visible="True" runat="server"></asp:TextBox>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
