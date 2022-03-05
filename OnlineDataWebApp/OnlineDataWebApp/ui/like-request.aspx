<%@ Page Title="" Language="C#" MasterPageFile="~/ui/root.Master" AutoEventWireup="true" CodeBehind="like-request.aspx.cs" Inherits="OnlineDataWebApp.ui.like_request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:updatepanel id="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container pt-5">
                <div class="row">
                    <div class="col-12 text-center">
                        <h3 class="font-bold">Like Request</h3>
                    </div>
                    <div class="col-12">
                        <div class="row">
                    <div class="card card-body col-12 m-3" runat="server" visible="False" id="noDataDiv">
                        <h4>No Request Found</h4>
                    </div>
                    <asp:Repeater ID="repeaterUser" runat="server" OnPreRender="repeaterUser_OnPreRender">
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
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            
        </Triggers>
    </asp:updatepanel>
</asp:Content>
