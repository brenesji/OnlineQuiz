<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="addquestion.aspx.cs" Inherits="Admin_addquestion" %>

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
    <asp:HiddenField ID="quizfield" runat="server" />
    <asp:HiddenField ID="questionfield" runat="server" />    
    <div id="addquestiondiv" runat="server" class="text-center">
            <asp:Label ID="Label" runat="server" Font-Size="XX-Large"  Text="Agregar Nueva Pregunta" Font-Bold="true"/>
        <br />
            <div style="float:right;padding-right:15px;">
                    <asp:HyperLink ID="homelnk" runat="server" class="fa fa-home" Font-Size="XX-Large" NavigateUrl="~/Admin/setquestions?q=1" ></asp:HyperLink>
                </div>
        <br />
        <br />
        <div id="selecttypediv" runat="server">            
            <b>Seleccione el tipo de pregunta</b>&nbsp;&nbsp;
        <asp:DropDownList ID="ddltype" runat="server" AutoPostBack="true" OnSelectedIndexChanged="questiontypechanged">
            <asp:ListItem Text="Por favor seleccione" Value="0" Selected="True" />
            <asp:ListItem Text="Single" Value="1" />
            <asp:ListItem Text="Multiple" Value="2" />
            <%--<asp:ListItem Text="Text" Value="2" />--%>
        </asp:DropDownList><br />
            <br />
        </div>
        <asp:Label ID="lblmessage" runat="server" ForeColor="#ff0000" Visible="false" /><br />
        <div style="clear: both"></div>
        <div id="multipleoptiondiv" runat="server" visible="false">
        <asp:FileUpload id="FileUploadControl2" runat="server"/>
        <asp:Button runat="server" id="UploadButton2" text="Upload" onclick="UploadButton_Click2" />
        <br /><br /><br />
        <asp:Image ID="Image3" runat="server" Height="191px" Width="392px" />
        <br />
        <asp:Label runat="server" id="StatusLabel2" />
            <br />
            <br />
            <b>Pregunta</b><br />
            <asp:TextBox ID="txtmultipleoption" runat="server" Height="23px" Width="400px" TextMode="MultiLine" />&nbsp;<asp:RequiredFieldValidator ID="multiplequestionvalidator" runat="server" ControlToValidate="txtmultipleoption" Display="Dynamic" ErrorMessage="please enter Question" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" />
            <br />
            <asp:CheckBox ID="ImageCheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="ImageCheckBox1_CheckedChanged" />
            <br />
            <br />
            <b>Opcion 1</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption1" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmultipleoption1" Display="Dynamic" ErrorMessage="Por favor ingrese la opcion 1" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><br />
            <br />
            <b>Opcion 2</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption2" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmultipleoption2" Display="Dynamic" ErrorMessage="Por favor ingrese la opcion 2" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><br />
            <br />
            <b>Opcion 3</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption3" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtmultipleoption3" Display="Dynamic" ErrorMessage="Por favor ingrese la opcion 3" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><br />
            <br />
            <b>Opcion 4</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption4" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtmultipleoption4" Display="Dynamic" ErrorMessage="Por favor ingrese la opcion 4" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><br />
            <br />
            <b>Opcion 5</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption5" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtmultipleoption5" Display="Dynamic" ErrorMessage="Por favor ingrese la opcion 5" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><br />
            <br /><br />
            <b>Categoria</b><br />
            <asp:DropDownList id ="ddlCategorias1" runat ="server" Height="23px">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Cmpron. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de imágenes</asp:ListItem>
                <asp:ListItem>Razmto. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de figuras</asp:ListItem>
                <asp:ListItem>Razmto. cuantitativo</asp:ListItem>
            </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlCategorias1" Display="Dynamic" ErrorMessage="Por favor ingrese la categoria" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><br /><br />
            <asp:Button ID="multiplequestionsubmit" runat="server" OnClick="multiplequestionsubmit_Click" Text="Submit" Height="23px" Width="100px" ValidationGroup="txtmultipleoption" /><br /><br />
            <asp:Label ID="lblanswer" runat="server" Font-Bold="true" ForeColor="Red" Visible="false">Por favor ingrese la respuesta</asp:Label>&nbsp;&nbsp;
            <asp:DropDownList ID="ddlmultipleanswer" runat="server" AutoPostBack="false" Visible="false">
                <asp:ListItem Text="option 1" Value="multipleoption1" Selected="True" />
                <asp:ListItem Text="option 2" Value="multipleoption2" />
                <asp:ListItem Text="option 3" Value="multipleoption3" />
                <asp:ListItem Text="option 4" Value="multipleoption4" />
                <asp:ListItem Text="option 5" Value="multipleoption5" />
            </asp:DropDownList><br /><br />
            <asp:Button ID="multipleanswersubmit" runat="server" OnClick="multipleanswersubmit_Click" Text="Submit" Height="23px" Width="100px" Visible="false" />
        </div>

        <div style="clear: both"></div>
        <div id="singleoptiondiv" runat="server" visible="false">
        <asp:FileUpload id="FileUploadControl1" runat="server"/>
        <asp:Button runat="server" id="UploadButton1" text="Upload" onclick="UploadButton_Click1" />
        <br /><br /><br />
        <asp:Image ID="Image2" runat="server" Height="191px" Width="392px" />
        <br />
        <asp:Label runat="server" id="StatusLabel1" />
            <br />
        <br />
            <b>Pregunta</b><br />
            <asp:TextBox ID="txtsingleoption" runat="server" Height="23px" Width="400px" TextMode="MultiLine" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtsingleoption" Display="Dynamic" ErrorMessage="Por favor ingrese la pregunta" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" />
            <br />
            <asp:CheckBox ID="ImageCheckBox" runat="server" AutoPostBack="true" OnCheckedChanged="ImageCheckBox_CheckedChanged" />
            <br /><br />
            <b>Respuesta</b><br />
            <asp:TextBox ID="txtsingleoptionanswer" runat="server" Text="" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtsingleoptionanswer" Display="Dynamic" ErrorMessage="Por favor ingrese la respuesta" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <b>Categoria</b><br />
            <asp:DropDownList id ="ddlCategorias2" runat ="server" Height="23px">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Cmpron. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de imágenes</asp:ListItem>
                <asp:ListItem>Razmto. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de figuras</asp:ListItem>
                <asp:ListItem>Razmto. cuantitativo</asp:ListItem>
            </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlCategorias2" Display="Dynamic" ErrorMessage="Por favor ingrese la categoria" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><br /><br />
            <asp:Button ID="singleoptionsubmit" runat="server" OnClick="singleoptionsubmit_Click" Text="Submit" Height="23px" Width="100px" ValidationGroup="singleoptionvalidation" />
        </div>
        <br /><br />        
    </div>
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

