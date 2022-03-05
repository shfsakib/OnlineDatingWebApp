<%@ Page Title="" Language="C#" MasterPageFile="~/ui/root.Master" AutoEventWireup="true" CodeBehind="date-request.aspx.cs" Inherits="OnlineDataWebApp.ui.date_request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:updatepanel id="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container pt-5">
                <div class="row">
                    <div class="col-12 text-center">
                        <h3 class="font-bold">Date Request</h3>
                    </div>
                    
                 <div class="col-12 table-responsive">
                     <asp:GridView id="gridDateReq" Width="100%" OnPageIndexChanging="gridDateReq_OnPageIndexChanging" OnRowDataBound="gridDateReq_OnRowDataBound" class="table table-bordered table-hover table-striped" AutoGenerateColumns="False" ShowHeader="False" ShowHeaderWhenEmpty="False" EmptyDataText="No Request Found" AllowPaging="True" PageSize="30" runat="server">
                         <Columns>
                             <asp:TemplateField>
                                 <ItemTemplate>
                                     <div class="row">
                                         <div class="col-lg-2 text-center">
                                             <asp:HiddenField id="hiddenId" runat="server" Value='<%#Eval("DateId") %>'></asp:HiddenField>
                                             <asp:HiddenField id="hiddenStatus" runat="server" Value='<%#Eval("Status") %>'></asp:HiddenField>
                                        <img id="imageProduct" runat="server" class="card-img-top" style="height: 100% !important; max-width: 225px; background: white; border-radius: 50%;" src='<%#Eval("SenderPicture") %>' alt="brand">                                             
                                         </div>
                                         <div class="col-lg-8">
                                                    <h3 class="card-title mt-4 font-bold" id="notify" runat="server" > 
                                                    <%#Eval("SenderName") %> sent you date request.</h3> 
                                            
                                             <asp:Image id="imgStatus"  Height="70px" Width="200px" runat="server"></asp:Image>                                                
                                             
                                         </div>
                                         <div class="col-lg-2">
                                             
                                             <asp:LinkButton ID="lnkAccept" class="btn btn-success mt-2 btn-block" OnClick="lnkAccept_OnClick" runat="server"><i class="fas fa-check"></i>&nbsp;&nbsp;Accept Request</asp:LinkButton>                                                   
                                                   <asp:LinkButton ID="lnkDeny" class="btn btn-danger mt-2 btn-block" OnClick="lnkDeny_OnClick" runat="server"><i class="fas fa-times"></i>&nbsp;&nbsp;Deny Request</asp:LinkButton>                                                   
                                                   <asp:LinkButton ID="lnkIgnore" class="btn btn-info mt-2 btn-block" OnClick="lnkIgnore_OnClick" runat="server"><i class="fas fa-times"></i>&nbsp;&nbsp;Ignore Request</asp:LinkButton>                                                   
                                            
                                         </div>
                                       
                                     </div>
                                 </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                     </asp:GridView>
                 </div>
                             
                    </div>
                </div>  
        </ContentTemplate>
        <Triggers>
            
        </Triggers>
    </asp:updatepanel>
</asp:Content>
