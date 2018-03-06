<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Admin_Menu" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu</title>
    <style type="text/css">
        #form1 {
            height: 265px;
            width: 1414px;
        }
    </style>
</head>
<body style="width: 1411px; height: 471px; margin-left: 9px">
    <form id="form1" runat="server">
    <div style="height: 147px" "text-align: center">
    <h2>Menu Principal</h2>
    </div>
         <div>
        <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick" style="text-align: left" Height="200px" Width="50px">
            <Items>
               <asp:MenuItem NavigateUrl="~/Admin/viewquiz.aspx" Text="Mantenimiento Preguntas" Value="MantenimientoPreguntas"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Admin/editquiz.aspx" Text="Mantenimiento Quiz" Value="MantenimientoQuiz"></asp:MenuItem>
                <asp:MenuItem Text="Mantenimiento Usuarios" Value="MantenimientoUsuarios"></asp:MenuItem>
                </Items>
        </asp:Menu>
              </div>
    </form>
</body>
</html>
