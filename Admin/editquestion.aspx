<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="editquestion.aspx.cs" Inherits="Admin_editquestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="questionfield" runat="server" /> 
    <div id="editquestiondiv" runat="server">
        <h2>Edit Question</h2><br />
        <div id="multipleoptiondiv" runat="server" visible="false">
              <asp:Image ID="Image3" runat="server" Height="191px" Width="392px" />
        <br />
             <asp:Label runat="server" id="StatusLabel3" />
        <br />
        <asp:FileUpload id="FileUploadControl3" runat="server"/>
        <asp:Button runat="server" id="UploadButton3" text="Upload" onclick="UploadButton_Click3" />
        <br />
            <br />
            <br />
            <b>Question</b><br /><asp:TextBox ID="txtmultipleoption" runat="server" Height="23px" width="400px" TextMode="MultiLine"/>&nbsp;<asp:RequiredFieldValidator ID="multipleoptionvalidator" runat="server" ControlToValidate="txtmultipleoption" Display="Dynamic" ErrorMessage="please enter Question" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" />
            <b>
              <br />
              <br />
              <br />
              option 1</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption1" runat="server" Height="23px" width="200px" OnTextChanged="txtmultipleoption_TextChanged" AutoPostBack="true"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmultipleoption1" Display="Dynamic" ErrorMessage="please enter option 1" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfoption1" runat="server" Visible="false" /><br /><br />
            <b>option 2</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption2" runat="server" Height="23px" width="200px" OnTextChanged="txtmultipleoption_TextChanged" AutoPostBack="true"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmultipleoption2" Display="Dynamic" ErrorMessage="please enter option 2" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfoption2" runat="server" Visible="false" /><br /><br />
            <b>option 3</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption3" runat="server" Height="23px" width="200px" OnTextChanged="txtmultipleoption_TextChanged" AutoPostBack="true"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtmultipleoption3" Display="Dynamic" ErrorMessage="please enter option 3" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfoption3" runat="server" Visible="false" /><br /><br />
            <b>option 4</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption4" runat="server" Height="23px" width="200px" OnTextChanged="txtmultipleoption_TextChanged" AutoPostBack="true"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtmultipleoption4" Display="Dynamic" ErrorMessage="please enter option 4" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfoption4" runat="server" Visible="false" /><br /><br />
            <b>option 5</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtmultipleoption5" runat="server" Height="23px" width="200px" OnTextChanged="txtmultipleoption_TextChanged" AutoPostBack="true"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtmultipleoption5" Display="Dynamic" ErrorMessage="please enter option 5" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfoption5" runat="server" Visible="false" /><br /><br />
            <b>Category</b><br />
            <asp:DropDownList id ="ddlCategorias1" runat ="server" Height="23px" OnTextChanged="txtmultipleoptioncategory_TextChanged" AutoPostBack="true">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Cmpron. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de imágenes</asp:ListItem>
                <asp:ListItem>Razmto. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de figuras</asp:ListItem>
                <asp:ListItem>Razmto. cuantitativo</asp:ListItem>
            </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlCategorias1" Display="Dynamic" ErrorMessage="Please enter category" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><asp:HiddenField ID="hfcategory" runat="server" Visible="false" /><br />
              <br />
              <br /><br />
            <asp:Label ID="lblanswer" runat="server" Font-Bold="true" ForeColor="Red" Visible="false">Answer</asp:Label>&nbsp;&nbsp;
            <asp:DropDownList ID="ddlmultipleanswer" runat="server" AutoPostBack="false" DataTextField="questionoption" DataValueField="id">                
            </asp:DropDownList><br /><br /><br />
            <asp:Button ID="multipleoptionsubmit" runat="server" OnClick="multipleoptionsubmit_Click" Text="Submit" Height="23px" Width="100px" ValidationGroup="multipleoptionvalidation" />
        </div>


        <div style="clear:both"></div>
        <div id="singleoptiondiv" runat="server" visible="false">
        <asp:Image ID="Image2" runat="server" Height="191px" Width="392px" />
        <br />
        <asp:Label runat="server" id="StatusLabel2" />
        <br />
        <asp:FileUpload id="FileUploadControl2" runat="server"/>
        <asp:Button runat="server" id="UploadButton2" text="Upload" onclick="UploadButton_Click2" />
        <br />
            <br />
            <br />
            <b>Question</b><br /><asp:TextBox ID="txtsingleoption" runat="server" Height="23px" width="400px" TextMode="MultiLine"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtsingleoption" Display="Dynamic" ErrorMessage="please enter Question" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" />
            <b>
            <br />
            <br />
            <br />
            Answer</b><br /><asp:TextBox ID="txtsingleoptionanswer" runat="server" Text="" Height="23px" width="200px"/>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtsingleoptionanswer" Display="Dynamic" ErrorMessage="please enter Answer" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <br />
            <b>Category</b><br />
            <asp:DropDownList id ="ddlCategorias2" runat ="server" Height="23px" OnTextChanged="txtmultipleoption_TextChanged" AutoPostBack="true">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Cmpron. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de imágenes</asp:ListItem>
                <asp:ListItem>Razmto. verbal</asp:ListItem>
                <asp:ListItem>Razmto. de figuras</asp:ListItem>
                <asp:ListItem>Razmto. cuantitativo</asp:ListItem>
            </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlCategorias2" Display="Dynamic" ErrorMessage="Please enter category" SetFocusOnError="true" ForeColor="Red" ValidationGroup="multipleoptionvalidation" /><br /><br /><br />
            <asp:Button ID="singleoptionsubmit" runat="server" OnClick="singleoptionsubmit_Click" Text="Submit" Height="23px" Width="100px" ValidationGroup="singleoptionvalidation" />
        </div>
        <br /><asp:Label ID="lblmessage" runat="server" ForeColor="#ff0000" Visible="false" /><br />
        <br />
        <br />
    
    </div>    

</asp:Content>




