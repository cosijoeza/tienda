<?php   
    include("bd/con.php");
    if(isset($_POST['usuario']) && isset($_POST['usuario'])){
        
        $usuario = $_POST['usuario']; 
        $password = $_POST['password']; 


        $conn = conectarDB("localhost","root","Melchor4_","tienda");

        $sql="SELECT id, nombre, apellidos, correo, usuario, password FROM usuario WHERE correo='$usuario' AND password='$password'";
         //$sql = "SELECT usuario, password, nombre, apellidos, id from clientes where email='$usuario' AND password='$password'";
        //echo "$sql ";

        $result = mysqli_query($conn, $sql);

        if($row = mysqli_fetch_array($result, MYSQLI_NUM)){
            //Recordar que no debe haberse mandado a pantalla (-> html)  nada antes de usar la sesion
            session_start();
            $_SESSION['id']  = $row[0];
            $_SESSION['nombre'] = $row[1];
            $_SESSION['apellidos']= $row[2];
            $_SESSION['usuario']= $row[4];

            //echo $_POST['usuario']; 
            //echo $_POST['password'];       

            header('Location: index.php');
        }
        else {
            header('Location: login.php');
        }
    }
    else{
        cabecera("Login");        
    }
?>

<body>
   <div class="container">
        <div class="row" id="fila">
            <div class="col-lg-4 col-md-4 col-sm-2 col-xl-4"></div>
            <div class="col-lg-4 col-md-4 col-sm-8 col-xl-4" id="formul">
                <form action="login.php" method="post">
                    <div class="form-login">
                        <h5>Iniciar sesión</h5>
                        <input name="usuario" type="text" id="usuario" class="form-control  my-2 " placeholder="Correo electrónico" /><br/>
                        <input name="password" type="text" id="password" class="form-control my-2 " placeholder="Password" /><br/>
                        <div class="wrapper">
                            <span class="group-btn">     
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Entrar <i class="fa fa-sign-in"></i></button>
                            </span>
                        </div>
                    </div>
                </form>
           </div>
           <div class="col-lg-4 col-md-4 col-sm-2 col-xl-4"></div>
        </div>
    </div>
</body>
</html>    