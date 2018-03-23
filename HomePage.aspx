<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>


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

  <body id="page-top" >

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Carrera de Psicología</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#login">Iniciar sesión</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#description">Descripción</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#Phone">Telefonos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#Social_Network">Redes Sociales</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Intro Header -->
    <header class="masthead">
      <div class="intro-body">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <%--Add code here--%>
            </div>
          </div>
        </div>
      </div>
    </header>
    <br>
    <br />
  </body>

    <form id="form1" runat="server">

   <!-- Login Section -->
    <section id="login" class="download-section content-section text-center">
      <div class="container">
        <div class="col-lg-8 mx-auto">
          <h2>Iniciar sesión</h2>
            <div class=" text-center" >
                <label class="text-justify"> Usuario:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                <asp:TextBox ID="TextBox1" runat="server" MaxLength="15"></asp:TextBox>
                <br />
                <br />
                <label class="text-justify">Contraseña:</label>&nbsp;
                <asp:TextBox ID="Txt_password" runat="server" MaxLength="15"></asp:TextBox>
                <br />
                <br />
            </div>
            <asp:Button ID="Btn_Login" runat="server" Text="Iniciar sesión" class="btn btn-default btn-lg" /> 
                <br />
                <br />
            <h6>Aun no tienes una cuenta?Aun no tienes una cuenta?</h6>      
            <asp:Button ID="New_Account" runat="server" Text="Registrate" class="btn btn-default btn-lg" />
        </div>
      </div>
    </section>

    <!-- Description Section -->
    <section id="description" class="content-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2>Descripción de la Carrera</h2>
            <p style="text-align:justify;"> 
                La Psicología, es la ciencia que estudia la comprensión de los procesos de pensamiento, las emociones y las acciones de las personas a nivel individual y colectivo, para así mejorar su salud, con una repercusión directa en la calidad de vida de la persona y de aquellos que se encuentra a su alrededor. Es una disciplina científica que analiza las dimensiones cognitivas, afectivas, conductuales y sociales que intervienen en la constitución, construcción y desarrollo del ser humano. 
                La Psicología es una carrera de mucho impacto y trascendencia, ofreciendo un aporte multidisciplinario ya que se relaciona directamente con profesionales de las áreas de Medicina, Psiquiatría, Trabajo Social, Educación, Nutrición, Enfermería, Administración de Empresas, entre otras; impactando la salud y el bienestar de la persona que vive inmersa en un contexto individual, que se proyecta a la pareja, a la familia, al ambiente laboral y comunitario.
                Cuando se habla de salud psicológica se está haciendo referencia a la vida cotidiana, el estilo de relación de la persona con ella misma, con otras personas y con su ambiente, por ende, hace referencia  a los trastornos mentales, que son cada vez más frecuentes en los países en desarrollo, como consecuencia de problemas persistentes asociados con la informalidad, la transición demográfica, la desigualdad, los conflictos, la violencia social, los desastres, entre otros.   
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Phone Section -->
    <section id="Phone" class="content-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
              <div class="fa-mobile-phone">
                  <h2>TELÉFONO</h2>
                       <p>
                           <i class="fa fa-phone fa-fw"></i>
                           Recinto Llorente de Tibás:
                           Tel: (506) 2241-9090  | 2545-0700 | 2241-9080</p>
                       <p> 
                           <i class="fa fa-phone fa-fw"></i>
                           Recinto Llorente de Tibás:
                           Tel: (506) 2241-9090  | 2545-0700 | 2241-9080</p>
                       <p> 
                           <i class="fa fa-phone fa-fw"></i>
                           Recinto Heredia:
                           Tel: (506) 2261-6061 | 2277-7500</p>
                       <p> 
                           <i class="fa fa-phone fa-fw"></i>
                           Sede Aranjuez:
                           Tel: (506) 2256-8197 | 2211-3000</p>
                       <p> 
                           <i class="fa fa-phone fa-fw"></i>                           
                           Sede Puntarenas:
                           Tel: (506) 2661-2515</p>        
              </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Sotial Network Section -->
    <section id="Social_Network" class="content-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2>Redes Sociales</h2>
            <p> Búscanos en página oficial de la universidad Hispanoamérica: 
              <a href="https://www.uhispanoamericana.ac.cr/Default.aspx"> Clik aquí</a>
            </p>
            <ul class="list-inline banner-social-buttons">
              <li class="list-inline-item">
                <a href="https://twitter.com/UniversidadUH" class="btn btn-default btn-lg">
                  <i class="fa fa-user fa-fw"></i>
                  <span class="network-name"> Twitter</span>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="https://www.facebook.com/uhispanoamericana/" class="btn btn-default btn-lg">
                  <i class="fa fa-facebook"></i>
                  <span class="network-name"> Facebook</span>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="https://www.youtube.com/user/UHispanoamericana" class="btn btn-default btn-lg">
                  <i class="fa fa-youtube"></i>
                  <span class="network-name"> YouTube</span>
                </a>
              </li>
            </ul> 
          </div>
        </div>
      </div>
    </section>

   <%-- btn-circle--%>
    <%--<a href="#contact" class="btn btn-circle js-scroll-trigger">
    <i class="fa fa-angle-double-down animated"></i>
    </a>--%>

    <!-- Footer -->
    <footer>
      <div class="container text-center">
        <p>Copyright &copy; Your Website 2018</p>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
   <script src="../js/grayscale.min.js"></script>

  </form>

</html>
