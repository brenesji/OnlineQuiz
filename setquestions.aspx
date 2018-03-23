<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="setquestions.aspx.cs" Inherits="Admin_setquestions" %>

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
      <form runat="server" class="download-section">
          <br />
    <br />
    <div id="questionsdiv" runat="server" class="text-center">
    <asp:Label ID="Label" runat="server" Font-Size="XX-Large"  Text="Preguntas Disponibles" Font-Bold="true"/>
           <br />
            <div style="float:right;padding-right:15px;">
                    <asp:HyperLink ID="homelnk" runat="server" class="fa fa-home" Font-Size="XX-Large" NavigateUrl="~/Admin/Menu.aspx" ></asp:HyperLink>
                </div>
    <br />
        <asp:Repeater ID="currrepeater" runat="server" OnItemCommand="currrepeater_ItemCommand">
            <HeaderTemplate>
                <table style="width: 100%">
                    <tr style="background-color: gray; color: white;">
                        <td style="height: 25px; padding-left: 10px; font-weight: bold;">Pregunta</td>
                        <td style="height: 25px; padding-left: 10px; font-weight: bold;">Tipo</td>
                        <td style="height: 25px; padding-left: 10px; font-weight: bold;">&nbsp;</td>
                        <td style="height: 25px; padding-left: 10px; font-weight: bold;">&nbsp;</td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr style="background-color: darkgray;border-color:white;">
                    <td style="height: 25px; padding-left: 10px;margin:0 auto 0 auto;text-align:left">
                        <asp:Label ID="lblquizname" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "title")%>' Font-Bold="true" ></asp:Label>
                    </td>
                    <td style="height: 25px; padding-left: 10px;">
                        <asp:Label ID="lblfromdate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "type")%>' ForeColor="Tomato" Font-Bold="true"></asp:Label>
                    </td>
                    <td style="height: 25px; padding-left: 10px;">
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" Font-Bold="true" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") + "|" +  DataBinder.Eval(Container.DataItem, "type") %>' CausesValidation="false">Editar</asp:LinkButton>
                    </td>
                    <td style="height: 25px; padding-left: 10px;">
                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" Font-Bold="true" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' CausesValidation="false">Borrar</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <br />
        <asp:HiddenField ID="quizfield" runat="server" /><hr />  
        <br /><asp:Label ID="Label1" runat="server" Font-Size="XX-Large"  Text="Opciones Disponibles"/><br />
        <p><a href="addquestion" id="addquestionlnk" runat="server">Agregar nueva pregunta</a></p> <br />
    </div>   
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

