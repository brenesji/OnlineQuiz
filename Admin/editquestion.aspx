<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="editquestion.aspx.cs" Inherits="Admin_editquestion" %>


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
    <asp:HiddenField ID="questionfield" runat="server" /> 
    <div id="editquestiondiv" runat="server" class="text-center">
            <asp:Label ID="Label" runat="server" Font-Size="XX-Large"  Text="Editar Pregunta" Font-Bold="true"/>
    <br />
        <div style="float:right;padding-right:15px;">
                    <asp:HyperLink ID="homelnk" runat="server" class="fa fa-home" Font-Size="XX-Large" NavigateUrl="~/Admin/setquestions?q=1" ></asp:HyperLink>
                </div>
    <br />
        <div id="multipleoptiondiv" runat="server" visible="false">
              <asp:Image ID="Image3" runat="server" Height="191px" Width="392px" />
        <br />
             <asp:Label runat="server" id="StatusLabel3" />
        <br />
        <asp:FileUpload id="FileUploadControl3" runat="server" class="btn btn-default btn-lg"/>
        <asp:Button runat="server" id="UploadButton3" text="Upload" onclick="UploadButton_Click3" class="btn btn-default btn-lg"/>
        <br />
            <br />
            <br />
            <b>Pregunta</b><br /><asp:TextBox ID="txtmultipleoption" runat="server" class="btn btn-default btn-lg" Height="50px" Width="600px" TextMode="MultiLine"/>&nbsp;<asp:RequiredFieldValidator ID="multipleoptionvalidator" runat="server" ControlToValidate="txtmultipleoption" Display="Dynamic" ErrorMessage="please enter Question" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" />
            <br />
              <br />
              <br />
            <b>Opcion 1</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption1" runat="server" class="btn btn-default btn-lg" Height="50px" OnTextChanged="txtmultipleoption_TextChanged" AutoPostBack="true"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmultipleoption1" Display="Dynamic" ErrorMessage="Por favor ingrese la opcion 1" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfoption1" runat="server" Visible="false" /><br /><br />
            <b>Opcion 2</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption2" runat="server" class="btn btn-default btn-lg" Height="50px" OnTextChanged="txtmultipleoption_TextChanged" AutoPostBack="true"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmultipleoption2" Display="Dynamic" ErrorMessage="Por favor ingrese la opcion 2" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfoption2" runat="server" Visible="false" /><br /><br />
            <b>Opcion 3</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption3" runat="server" class="btn btn-default btn-lg" Height="50px" OnTextChanged="txtmultipleoption_TextChanged" AutoPostBack="true"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtmultipleoption3" Display="Dynamic" ErrorMessage="Por favor ingrese la opcion 3" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfoption3" runat="server" Visible="false" /><br /><br />
            <b>Opcion 4</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption4" runat="server" class="btn btn-default btn-lg" Height="50px" OnTextChanged="txtmultipleoption_TextChanged" AutoPostBack="true"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtmultipleoption4" Display="Dynamic" ErrorMessage="Por favor ingrese la opcion 4" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfoption4" runat="server" Visible="false" /><br /><br />
            <b>Opcion 5</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption5" runat="server" class="btn btn-default btn-lg" Height="50px" OnTextChanged="txtmultipleoption_TextChanged" AutoPostBack="true"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtmultipleoption5" Display="Dynamic" ErrorMessage="Por favor ingrese la opcion 5" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfoption5" runat="server" Visible="false" /><br /><br />
            <b>Categoria</b><br />
            <asp:DropDownList id ="ddlCategorias1" runat ="server" class="btn btn-default btn-lg" OnTextChanged="txtmultipleoptioncategory_TextChanged" AutoPostBack="true">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Cmpron. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de imágenes</asp:ListItem>
                <asp:ListItem>Razmto. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de figuras</asp:ListItem>
                <asp:ListItem>Razmto. cuantitativo</asp:ListItem>
            </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlCategorias1" Display="Dynamic" ErrorMessage="Por favor ingrese la categoria" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfcategory" runat="server" Visible="false" /><br />
              <br />
              <br /><br />
            <asp:Label ID="lblanswer" runat="server" Font-Bold="true" ForeColor="Red" Visible="false">Respuesta</asp:Label>&nbsp;&nbsp;
            <asp:DropDownList ID="ddlmultipleanswer" runat="server" AutoPostBack="false" DataTextField="questionoption" DataValueField="id">                
            </asp:DropDownList><br /><br /><br />
            <asp:Button ID="multipleoptionsubmit" runat="server" OnClick="multipleoptionsubmit_Click" Text="Submit" class="btn btn-default btn-lg" ValidationGroup="multipleoptionvalidation" />
        </div>


        <div style="clear:both"></div>
        <div id="singleoptiondiv" runat="server" visible="false">
        <asp:Image ID="Image2" runat="server" Height="191px" Width="392px" />
        <br />
        <asp:Label runat="server" id="StatusLabel2" />
        <br />
        <asp:FileUpload id="FileUploadControl2" runat="server" class="btn btn-default btn-lg"/>
        <asp:Button runat="server" id="UploadButton2" text="Upload" onclick="UploadButton_Click2" class="btn btn-default btn-lg"/>
        <br />
            <br />
            <br />
            <b>Question</b><br /><asp:TextBox ID="txtsingleoption" runat="server" class="btn btn-default btn-lg" Height="50px" Width="600px" TextMode="MultiLine"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtsingleoption" Display="Dynamic" ErrorMessage="Por favor ingrese la pregunta" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" />
            <b>
            <br />
            <br />
            <br />
            Answer</b><br /><asp:TextBox ID="txtsingleoptionanswer" runat="server" class="btn btn-default btn-lg" Height="50px" OnTextChanged="txtsingleoption_TextChanged" AutoPostBack="true"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtsingleoptionanswer" Display="Dynamic" ErrorMessage="Por favor ingrese la respuesta" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <br />
            <b>Category</b><br />
            <asp:DropDownList id ="ddlCategorias2" runat ="server" class="btn btn-default btn-lg" OnTextChanged="txtmultipleoptioncategory_TextChanged" AutoPostBack="true">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Cmpron. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de imágenes</asp:ListItem>
                <asp:ListItem>Razmto. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de figuras</asp:ListItem>
                <asp:ListItem>Razmto. cuantitativo</asp:ListItem>
            </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlCategorias2" Display="Dynamic" ErrorMessage="Por favor ingrese la categoria" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br /><br /><br />
            <asp:Button ID="singleoptionsubmit" runat="server" OnClick="singleoptionsubmit_Click" Text="Submit" ValidationGroup="singleoptionvalidation" class="btn btn-default btn-lg" />
        </div>
        <br /><asp:Label ID="lblmessage" runat="server" ForeColor="#ff0000" Visible="false" /><br />
        <br />
        <br />
    
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





