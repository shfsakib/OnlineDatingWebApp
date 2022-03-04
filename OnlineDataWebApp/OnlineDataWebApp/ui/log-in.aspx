<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="log-in.aspx.cs" Inherits="OnlineDataWebApp.ui.log_in" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dating App | Login</title>
    <meta charset="UTF-8" />
    <meta name="bits" content="Dating App" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- fav icon -->
    <link href="../Resources/images/fav.png" rel="icon" type="image/png" />
    <!-- Bootstrap css link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
    <link href="../Resources/bootstrap.min.css" rel="stylesheet" />
    <!-- custom css -->
    <link href="../Resources//css/style.css" rel="stylesheet" />
    <!-- font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" />
    <link href="../Resources/font-awesome.css" rel="stylesheet" />
    <!--font link-->
    <link href="http://fonts.cdnfonts.com/css/sansserifflf" rel="stylesheet" />
    <link href="../Resources/sansserifflf.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="login-content">
                    <section class="login-section">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block">
                                    <img src="/Resources/images/love.gif" alt="" class="login-img" />
                                    <img src="/Resources/images/logo-front.png" style="position: relative; top: 0%; left: 50%; transform: translate(-50%, -50%);" />
                                </div>
                                <div class="col-lg-6 text-center login-card">
                                    <h1 class="weight-text">Login</h1>
                                    <hr>
                                    <div class="row">
                                        <div class="col-12 text-left">
                                            <span class="font-20 weight-text">User Name</span>
                                            <asp:TextBox ID="txtUserName" runat="server" autocomplete="off" required placeholder="e.g. john123"></asp:TextBox>
                                        </div>
                                        <div class="col-12 text-left">
                                            <span class="font-20 weight-text">Password</span>
                                            <asp:TextBox ID="txtPassword" TextMode="Password" autocomplete="off" runat="server" required placeholder="password"></asp:TextBox>
                                        </div>
                                        <div class="col-6 text-left weight-text font-18 pt-2">
                                            <%--<input type="checkbox" id="remember"><label for="remember">&nbsp;Remeber me</label>--%>
                                        </div>
                                        <div class="col-6 text-right weight-text font-18 pt-2">
                                            <%--<a href="#" class="forgot-pass">Forgot password?</a>--%>
                                        </div>
                                        <div class="col-12 text-left">
                                            <asp:Button ID="btnLogin" OnClick="btnLogin_OnClick" class="base-button" runat="server" Text="Login" />
                                        </div>
                                        <div class="col-12 text-left mt-2">
                                            Don't have an account? <a href="/ui/register.aspx">Register here</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnLogin" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
    <!-- bootstrap & js link-->
    <script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin=" anonymous "></script>
    <script src="../Resources/jquery-3.5.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj " crossorigin="anonymous "></script>
    <script src="../Resources/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx " crossorigin="anonymous "></script>
    <script src="../Resources/bootstrap.bundle.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.4/sweetalert2.min.js" integrity="sha512-vDRRSInpSrdiN5LfDsexCr56x9mAO3WrKn8ZpIM77alA24mAH3DYkGVSIq0mT5coyfgOlTbFyBSUG7tjqdNkNw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.4/sweetalert2.all.min.js" integrity="sha512-hDt6c6JA9ytE/b7OF73Bhj1lXT0wucQXm9yKjSV7BrJ6o5CVs1hq7nIQWU4OhOyrUbbL1KhN7Jt00v7UZA18og==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="../Resources/sweetalert2.min.js"></script>
    <script src="../Resources/sweetalert2.all.min.js"></script>
      <!-- Custom js -->
    <script src="../Resources/js/style.js"></script>
</body>
</html>
