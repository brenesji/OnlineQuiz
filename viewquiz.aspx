<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="viewquiz.aspx.cs" Inherits="Admin_viewquiz" %>

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
      <form runat="server">
          <br />
    <br />
    <div id="availablecompetitions" class="text-center"> 
<asp:Label ID="Label" runat="server" Font-Size="XX-Large"  Text="Examenes Recientes"/>        
        <br />
        <div id="maincontent">
                <div style="float:right;padding-right:15px;">
                    <asp:HyperLink ID="homelnk" runat="server" class="fa fa-home" Font-Size="XX-Large" NavigateUrl="~/Admin/Menu.aspx" ></asp:HyperLink>
                </div>
                <div style="clear:both;"></div>               
            </div>  
        <asp:Label ID="lblmessage" runat="server" ForeColor="#ff0000" Visible="false" />
        <asp:Repeater ID="currrepeater" runat="server" Visible="false" OnItemCommand="currrepeater_ItemCommand">
            <HeaderTemplate>
                <table style="width: 100%">
                    <tr style="background-color: gray; color: white;">
                        <td style="height: 25px; padding-left: 10px; font-weight: bold;">Name</td>
                        <td style="height: 25px; padding-left: 10px; font-weight: bold;">Start Date</td>
                        <td style="height: 25px; padding-left: 10px; font-weight: bold;">End Date</td>
                        <td style="height: 25px; padding-left: 10px; font-weight: bold;">&nbsp;</td>
                        <td style="height: 25px; padding-left: 10px; font-weight: bold;">&nbsp;</td>
                        <td style="height: 25px; padding-left: 10px; font-weight: bold;">&nbsp;</td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr style="background-color: darkgray;">
                    <td style="height: 25px; padding-left: 10px;">
                        <asp:Label ID="lblquizname" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "name")%>' Font-Bold="true"></asp:Label>
                    </td>
                    <td style="height: 25px; padding-left: 10px;">
                        <asp:Label ID="lblfromdate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "startdate", "{0:dd/MM/yyyy}")%>' ForeColor="Green" Font-Bold="true"></asp:Label>
                    </td>
                    <td style="height: 25px; padding-left: 10px;">
                        <asp:Label ID="lbltodate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "enddate", "{0:dd/MM/yyyy}")%>' ForeColor="Red" Font-Bold="true"></asp:Label>
                    </td>
                    <td style="height: 25px; padding-left: 10px;">
                        <asp:LinkButton ID="lnkquestions" runat="server" CommandName="questions" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' CausesValidation="false">Questions</asp:LinkButton>
                    </td>
                    <td style="height: 25px; padding-left: 10px;">
                        <asp:LinkButton ID="lnkView" runat="server" CommandName="responses" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' CausesValidation="false">Responses</asp:LinkButton>
                    </td>
                    <td style="height: 25px; padding-left: 10px;">
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' CausesValidation="false">Edit</asp:LinkButton>
                    </td>

                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <br />
    <hr />
    <br />
    <asp:Label ID="Label1" runat="server" Font-Size="XX-Large"  Text="Opciones Disponibles"/>
    <br />
    <div id="quizsetup">
        <p><a href="newquiz">Start a new quiz</a></p>
    </div>
    <br />
    <footer>
                <div class="content-wrapper">
                    <div class="float-left">
                        <p>
                            &copy; <%: DateTime.Now.Year %> - All Rights Reserved
                        </p>
                    </div>
                </div>
            </footer>


          </form>
    </body>
</html>

