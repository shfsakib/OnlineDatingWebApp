<%@ Page Title="" Language="C#" MasterPageFile="~/ui/root.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs"
    Inherits="OnlineDataWebApp.ui.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Resources/css/style.css" rel="stylesheet" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <div class="root-div">
                <div class="opacity-div">
                    <div class="container h-100">
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-6 mt-5 mb-5">
                                <div class="card card-body shadow" style="background: rgba(0,0,0,0.5); color: #ffffff;">
                                    <div class="row">
                                        <div class="col-12">
                                            <h3>I'm looking for</h3>
                                        </div>
                                        <div class="col-12 pt-4">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="radio-gender">
                                                        <input type="radio" name="gender" id="inputFemale" runat="server" value="Female" />
                                                        <i class="fas fa-female fa-lg"></i>
                                                        <h6 class="mb-0">Women</h6>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="radio-gender">
                                                        <input type="radio" name="gender" id="inputMale" runat="server" value="Male" />
                                                        <i class="fas fa-male fa-lg"></i>
                                                        <h6 class="mb-0">Man</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 pt-4">
                                            <h6>Age</h6>
                                            <div class="row mt-2">
                                                <div class="col-6 text-center">
                                                    <asp:TextBox ID="txtRange1" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" class="range1 form-control text-center" runat="server" TextMode="Number" min="12" max="50" placeholder="minimum age" autocomplete="off"> 
                                                    </asp:TextBox>
                                                </div>
                                                <div class="col-6 text-center">
                                                    <asp:TextBox ID="txtRange2" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" class="range2 form-control text-center" runat="server" TextMode="Number" min="51" placeholder="maximum age" autocomplete="off">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                            <%--  <div class="multi-slider">
                                                <input id="a" type="range" min="12" class="range" max="50" value="12" />
                                                <input id="b" type="range" min="51" class="range" max="100" value="51" />
                                            </div>--%>
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
                                            <asp:TextBox ID="txtCity" class="form-control text-uppercase" runat="server" autocomplete="off"
                                                placeholder="New York, Las Vegas etc.">
                                            </asp:TextBox>
                                        </div>
                                        <div class="col-12 pt-2">
                                            <h6>State</h6>
                                            <asp:TextBox ID="txtState" class="form-control text-uppercase" runat="server" autocomplete="off"
                                                placeholder="NY, LV etc.">
                                            </asp:TextBox>
                                        </div>
                                        <div class="col-12 pt-2 text-center">
                                            <asp:LinkButton ID="lnkSearch" OnClick="lnkSearch_OnClick" class="btn btn-primary" runat="server"><i class="fas fa-search"></i>&nbsp;Find Match</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="card card-body col-12 m-3" runat="server" visible="False" id="noDataDiv">
                        <h4>Search Not Found</h4>
                    </div>
                    <asp:Repeater ID="repeaterUser" runat="server" OnItemDataBound="repeaterUser_OnItemDataBound">
                        <ItemTemplate>
                            <div class="col-6 col-sm-3 col-md-4 col-lg-3" style="margin: 0 0 !important; padding: 5px 10px !important;">
                                <div class="card card-body m-2">
                                    <a style="cursor: pointer; text-decoration: none;" href='<%#"/ui/profile-details.aspx?id="+Eval("UserId") %>'>
                                        <img id="imageProduct" runat="server" class="card-img-top" style="height: 205px !important; background: white; border-radius: 50%;" src='<%#Eval("Picture") %>' alt="brand">
                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("UserId")%>' />
                                        <div class="card-body" style="padding: 5px 5px !important;">
                                            <div class="row">
                                                <div class="col-12">
                                                    <h5 class="card-title mt-4 font-bold" id="itemName" runat="server" style="overflow: hidden; white-space: normal; text-align: left; line-height: 1.7rem; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;">
                                                        <asp:Label ID="lblHead" runat="server" Text='<%#Eval("FullName") %>'></asp:Label></h5>
                                                    <p class="mb-0"><%#Eval("Age")+" years old" %></p>
                                                    <p class="mb-0"><%#Eval("Description") %></p>
                                                    <p class="mb-0"><%#Eval("City")+","+Eval("State") %></p>
                                                </div>
                                                <div class="col-12 text-center">
                                                   
                                                    <asp:LinkButton ID="lnkLike" class="btn btn-primary mt-2 btn-block" OnClick="lnkLike_OnClick" runat="server"><i class="far fa-heart"></i>&nbsp;&nbsp;Like</asp:LinkButton>
                                                  
                                                    <asp:LinkButton ID="lnkDisLike" class="btn btn-danger mt-2 btn-block" OnClick="lnkDisLike_OnClick" runat="server"><i class="fas fa-heart"></i>&nbsp;&nbsp;Dislike</asp:LinkButton>
 
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lnkSearch" />
            <asp:AsyncPostBackTrigger ControlID="inputMale" />
            <asp:AsyncPostBackTrigger ControlID="inputFemale" />
        </Triggers>
    </asp:UpdatePanel>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <script src="../Resources/jquery-3.5.0.min.js"></script>
    <script src="../Resources/js/style.js"></script>
</asp:Content>
