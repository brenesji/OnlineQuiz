<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="editquiz.aspx.cs" Inherits="Admin_editquiz" %>
<%@ Register Assembly="FredCK.CKEditor" Namespace="FredCK.CKEditor" TagPrefix="FredCK" %>

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
 
    <script src="../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#<%= txtstartdate.ClientID  %>").datepicker({ dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true, minDate: '+0d' });
            $("#<%= txtenddate.ClientID  %>").datepicker({ dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true, minDate: '+0d' });
        });
    </script>
    <script type="text/javascript" src="../Scripts/ckeditor/ckeditor.js"></script>
    <style type="text/css">
        #ui-datepicker-div {
            display: none;
        }
    </style>

    <asp:HiddenField ID="quizfield" runat="server" />
    <div id="editquiz" runat="server">
        <br />
        <h2>Edit Quiz</h2>
        <br />
        <asp:Label ID="lblname" Text="Quiz Name" runat="server" />
        <br />
        <asp:TextBox ID="txtname" runat="server" height="25px" Width="350px"/>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="namevalidator" runat="server" ControlToValidate="txtname" Display="Dynamic" ErrorMessage="please enter quiz name" SetFocusOnError="true" ForeColor="Red" ValidationGroup="submitvalidation" />
        <asp:RegularExpressionValidator ID="nameregexvalidator" runat="server" ErrorMessage="only alphabets allowed" ControlToValidate="txtname" Display="Dynamic" ValidationExpression ="^[a-zA-Z'.\s]{1,100}$" SetFocusOnError="true" ForeColor="Red" ValidationGroup="submitvalidation" />
        
        <br />
        <br />
        <asp:Label ID="lbldescription" Text="Description" runat="server" />
        <br />
        <asp:TextBox ID="txtdescription" runat="server" height="25px" Width="350px"/>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="descriptionvalidator" runat="server" ControlToValidate="txtdescription" Display="Dynamic" ErrorMessage="please enter description" SetFocusOnError="true" ForeColor="Red" ValidationGroup="submitvalidation" />

        <br />
        <br />
        <asp:Label ID="lblstartdate" Text="Start Date" runat="server" />
        <br />
        <asp:TextBox ID="txtstartdate" runat="server" height="25px" Width="125px"/>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="startdatevalidator" runat="server" ControlToValidate="txtstartdate" Display="Dynamic" ErrorMessage="please enter start date" SetFocusOnError="true" ForeColor="Red" ValidationGroup="submitvalidation" />

        <br />
        <br />
        <asp:Label ID="lblenddate" Text="End Date" runat="server" />
        <br />
        <asp:TextBox ID="txtenddate" runat="server" height="25px" Width="125px"/>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="enddatevalidator" runat="server" ControlToValidate="txtenddate" Display="Dynamic" ErrorMessage="please enter end date" SetFocusOnError="true" ForeColor="Red" ValidationGroup="submitvalidation" />
                
        <br />
        <br />
        <asp:Label ID="lblcompletiondescription" Text="Completion description" runat="server" />
        <br />
        <asp:TextBox ID="txtcompletiondescription" runat="server" height="25px" Width="350px" TextMode="MultiLine"/>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="completiondescriptionvalidator" runat="server" ControlToValidate="txtcompletiondescription" Display="Dynamic" ErrorMessage="please enter completion description" SetFocusOnError="true" ForeColor="Red" ValidationGroup="submitvalidation" />     

        <br />
        <br />
        <asp:Label ID="lblterms" Text="Terms and Conditions" runat="server" />
        <FredCK:CKEditor ID="txtterms" runat="server" BasePath="~/scripts/ckeditor" Width="950px"></FredCK:CKEditor>

        <br />
        <br />
        <asp:Button ID="submitquiz" runat="server" Text="Submit" Height="25px" Width="75px" OnClick="submitquiz_click" ValidationGroup="submitvalidation" />     
    </div>
    <br /><asp:Label ID="lblalert" runat="server" Visible="false" ForeColor="Red" /><br />
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

