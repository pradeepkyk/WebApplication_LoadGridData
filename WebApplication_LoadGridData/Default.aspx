<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication_LoadGridData.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
  margin-top: 50px;
}

.card-body {
  margin: 0 auto;
}


.input-large {
  height: 50px;
  font-size: 24px;
  padding: 10px;
}
.form-group {
  margin-bottom: 15px;
  font-size: 16px;
  line-height: 1.5;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<main role="main" class="container">
    <div class="row justify-content-center align-items-center">
        <div class="col-sm-4">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">Login</h2>
                </div>
                <div class="card-body">
                    <%--<form role="form" class="form-signin" runat="server">--%>
                    <div class="form-group">
                        <label for="txtUsername">Username:</label>
                        <asp:TextBox ID="txtUsername" runat="server" class="form-control input-large" placeholder="Enter username" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Password:</label>
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control input-large" placeholder="Enter password" TextMode="Password" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblMessage" runat="server" Visible="true" CssClass="text-danger"></asp:Label>
                    </div>
                    <%--<div class="form-group">
                         <div class="float-right">
                           <asp:Button ID="btnLoginButton" class="btn btn-lg btn-primary" runat="server" Text="Sign in" OnClick="btnLoginButton_Click" />
                        </div>
                    </div>--%>
                    <div class="form-group row">
                      <div class="col-sm-8 text-right">
                        <a href="#">Forgot Password?</a>
                      </div>
                      <div class="col-sm-4">
                        <asp:Button ID="btnLoginButton" class="btn btn-lg btn-primary btn-block" runat="server" Text="Sign in" OnClick="btnLoginButton_Click" />
                      </div>
                    </div>
                    <%--</form>--%>
                </div>
            </div>
        </div>
    </div>
</main>


</asp:Content>
