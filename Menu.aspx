<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Admin_Menu" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Universidad Hispanoamericana</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Cabin:700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="../Styles/grayscale.min.css" rel="stylesheet">
    </head>
<body>
    <br />
    <br />
<form runat="server" class="masthead">
    <div runat="server" style="margin:0 auto 0 auto;text-align:center">
    <asp:Label ID="Label" runat="server" Font-Size="XX-Large"  Text="Menu Principal" Font-Bold="true"/>
    </div>
    <div runat="server" style="margin:0 auto 0 auto;width:225px">
    <br />
    <br />
    <br />
    <br />
        <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick" Font-Bold="true">
            <Items>
               <asp:MenuItem NavigateUrl="~/Admin/setquestions?q=1" Text="Mantenimiento Preguntas" Value="MantenimientoPreguntas"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Admin/editquiz" Text="Mantenimiento Quiz" Value="MantenimientoQuiz"></asp:MenuItem>
                <asp:MenuItem Text="Mantenimiento Usuarios" Value="MantenimientoUsuarios" ></asp:MenuItem>
                </Items>
        </asp:Menu>
              </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

            
    </form>
     <footer>
                <div class="content-wrapper">
                    <div class="float-left">
                        <p>
                            &copy; <%: DateTime.Now.Year %> - All Rights Reserved
                        </p>
                    </div>
                </div>
            </footer>
</body>
</html>
