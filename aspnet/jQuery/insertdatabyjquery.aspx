﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insertdatabyjquery.aspx.cs" Inherits="aspnet.jQuery.insertdatabyjquery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/json2/0.1/json2.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=btnSave]").bind("click", function () {
                var user = {};
                user.Username = $("[id*=txtUsername]").val();
                user.Password = $("[id*=txtPassword]").val();
                $.ajax({
                    type: "POST",
                    url: "insertdatabyjquery.aspx/SaveUser",
                    data: '{user: ' + JSON.stringify(user) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("User has been added successfully.");
                        window.location.reload();
                    }
                });
                return false;
            });
        });
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            Username:
        </td>
        <td>
            <asp:TextBox ID="txtUsername" runat="server" Text="" />
        </td>
    </tr>
    <tr>
        <td>
            Password:
        </td>
        <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <asp:Button ID="btnSave" Text="Save" runat="server" />
        </td>
    </tr>
</table>
<hr />
<asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3AC0F2"
    HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2">
    <Columns>
        <asp:BoundField DataField="Username" HeaderText="Username" />
        <asp:BoundField DataField="Password" HeaderText="Password" />
    </Columns>
</asp:GridView>

        </div>
    </form>
</body>
</html>
