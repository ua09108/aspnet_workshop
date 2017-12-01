<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jsontrasnfertoashx.aspx.cs" Inherits="aspnet.jQuery.jsontrasnfertoashx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Button1").click(function () {
                var person1 = new Object();
                person1.Name = "Superman";
                person1.Age = 29;

                var person2 = new Object();
                person2.Name = "Batman";
                person2.Age = 29;

                var array = [];
                array.push(person1);
                array.push(person2);

                $.ajax({
                    url: "../webservice/callwebmethod.ashx",
                    type: "post",
                    data: JSON.stringify(array),
                    success: function (data) {
                        document.write(data);
                    }
                });
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>

                <input id="Button1" type="button" value="button" />

        </div>
    </form>
</body>
</html>
