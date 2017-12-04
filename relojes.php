<?php
	session_start();
?>
<!DOCTYPE html>
	<html lang="en">
	<head>
		<meta cherset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>MAN'S WEAR HOUSE</title>
		<link rel="stylesheet" type="text/css" href="estilo.css">
		<link rel="stylesheet" type="text/css" href="scss/css/font-awesome.min.css">
		<link rel="icon" href="img/camisa.ico">
	</head>
	<body>
		<main class="principal">
		<!--=======================Header==============================	-->
			<header class="cabecera parallax" id="hdr">
				<div class="row log">
					  <?php 
                         $usuario = $_SESSION['usuario'];
                        if( isset($_SESSION['usuario']) ){
                        	/*Aqui ya entro a la sesion*/
                       echo "\n <a class='btn btn-outline-dark  mx-3' href='logout.php' title='usuario: $usuario'>Salir  <i class='fa fa-sign-out fa' aria-hidden='true'></i></a>";

                       echo "\n <button class='btn btn-outline-dark  mx-3' type='button' data-toggle='modal' data-target='#modalCarrito' title='Mostrar carrito'><i class='fa fa-shopping-cart fa' aria-hidden='true'></i></button> ";

                        }
                        else
                        {
                       		echo "<a class='btn btn-outline-dark  mx-3' href='login.php' title='usuario: $usuario'><i class='fa fa-user-circle' aria-hidden='true'></i>Entrar</a> ";
                        }
                      ?>


					<!--<div class="col icons" id="carrito"><i class="fa fa-shopping-cart"></i></div>-->
				</div>
				<div class="row busq">
					<div class="col" id="logo"></div>
					<div class="col" id="buscador">
						<div class="row"><i class="fa fa-search"></i>
							<div class="col">
								<input type="text" name="">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<ul class="menu">
						<li><a href="index.php"><p id="parrafo">Inicio</p></a></li>
						<li><a href="zapatos.php"><p id="parrafo">Zapatos</p></a></li>
						<li><a href="relojes.php"><p id="parrafo">Relojes</p></a></li>
						<li><a href="camisas.php"><p id="parrafo">Camisas</p></a></li>
						<li><a href="outfits.php"><p id="parrafo">Outfits</p></a></li>
					</ul>
				</div>
				<div class="main-string">
					<p>MAN'S WEAR HOUSE</p>
				</div>
			</header>
		<!--========================Seccion===============================-->
				<div class="articulo" id="titulo">
					<p>Relojes<p>
				</div>
				<div class="row articulo">
					<div class="col D">
						<div class="img">
							<img src="img/rolex.jpg" class="imagen">
						</div>
					</div>
					<div class="col I">
						<div class="img">
							<img src="img/reloj.jpg" class="imagen">
						</div>
					</div>
				</div>
				<div class="seccion">
					<?php
						include('bd/con.php');
						$conn = conectarDB("localhost","root","Melchor4_","tienda");
						/*if($conn){echo "Conecto";}
						else{ echo "No conecto";}*/

						$sql = "SELECT * FROM producto WHERE clasif_id=2";
						$result = mysqli_query($conn,$sql);
						$i=0;
						$j=0;
						if(!$result){ echo "No se realizo consulta";}
						else
						{	 					
								echo "\n<div class='row lista'>";		
								while($row = mysqli_fetch_array($result,MYSQLI_NUM))
								{
									echo "\n<div id='".$row[0]."' class='efecto'>";
                              		echo "\n  <img id='muestra' src='./img/relojes/".$row[1]."' alt='".$row[1]."'>";
                              		echo "\n  </div>";
								}
								echo "</div";
						}
					?>
				</div>
			<!--========================Footer=====================-->
			<footer class="pie"></footer>			
		</main>
	</body>
</html>