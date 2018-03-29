﻿<%@ Page Title="Examen" Language="C#"  AutoEventWireup="true" CodeFile="startnewquiz.aspx.cs" Inherits="_Default" %>

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
      <form runat="server" class="download-section">
    <asp:scriptmanager ID="Scriptmanager1" runat="server"></asp:scriptmanager>
    <br />
    <br />
<asp:UpdatePanel ID="UpdatePanel1" runat="server" updatemode="Always" AutoPostBack="true">
  <ContentTemplate>
      &nbsp;<asp:Label ID="Label1" runat="server" Font-Size="XX-Large"></asp:Label>
    <asp:Timer ID="tm1" Interval="1000" runat="server" ontick="tm1_Tick" />
  </ContentTemplate>
<Triggers>
    <asp:AsyncPostBackTrigger ControlID="tm1" EventName="Tick" />
  </Triggers>
</asp:UpdatePanel>
    <asp:Label ID="lblmessage" runat="server" ForeColor="#ff0000" Visible="false" /><br />
    <asp:HiddenField ID="quizfield" runat="server" />

    <div id="quizdetails" runat="server" class="text-center">
        <!-- quiz title -->
        <asp:Label ID="lblquizname" runat="server" Font-Size="XX-Large" />
        <br />
        <br />
        <br />
    </div>
    <div id="Questions" runat="server" style="margin:0 auto 0 auto;width:300px">
        <br />
        <br />
        <asp:Image ID="Image" runat="server" Height="191px" Width="392px" />
        <br />
        <asp:Label ID="lbMessage" runat="server" Font-Size="XX-Large"></asp:Label>
        <br />
         <br />
        <asp:Button ID="btnExit" runat="server" OnClick="btnExit_Click" Text="Exit" class="btn btn-default btn-lg" />
        <br />
        <asp:Label runat="server" id="lbQuestion" Height="50px" Width="500px" Font-Size="X-Large"/>
        <br />

        <div id="multipleoptiondiv" runat="server" visible="false">
        <asp:Repeater ID="multiplequestionsrpt" runat="server" OnItemDataBound="multiplequestionsrpt_ItemDataBound" >
                <ItemTemplate>
                    <asp:HiddenField ID="hfID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id")%>' Visible="false" />
                    <asp:RequiredFieldValidator ID="rfvquiz" runat="server" Display="Dynamic" ControlToValidate="rbloptions" ValidationGroup="quizvalidation" ForeColor="Red" Text="Por favor seleccione una respuesta" SetFocusOnError="true"/><br />
                    <asp:RadioButtonList ID="rbloptions" runat="server" ValidationGroup="quizvalidation" style="margin:0 auto 0 auto;width:400px"/>
                </ItemTemplate>
            </asp:Repeater>
        <br />
            <br />
        <br />
        <asp:Button ID="btnNextmultiple" runat="server" OnClick="btnNext_Clickmultiple" Text="Next" ValidationGroup="quizvalidation" class="btn btn-default btn-lg" />
        <br />
        <br />
            </div>

        <div id="singleoptiondiv" runat="server" visible="false">
        <asp:TextBox ID="txtanswer" runat="server" Height="50px" Width="400px" class="btn btn-default btn-lg" OnTextChanged="txtanswer_TextChanged" AutoPostBack="true" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtanswer" Display="Dynamic" ErrorMessage="Por favor ingrese una respuesta" SetFocusOnError="true" ForeColor="Red" ValidationGroup="txtanswersingle"/>
        <br />
            <asp:Label ID="lberror" runat="server" ForeColor="#ff0000" Visible="false" /><br />
            <br />
        <br />
        <asp:Button ID="btnNextsingle" runat="server" OnClick="btnNext_Clicksingle" Text="Next" ValidationGroup="txtanswersingle" class="btn btn-default btn-lg" />
        <br />
        <br />
            </div>
        
    <br />
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