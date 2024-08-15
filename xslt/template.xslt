<?xml version="1.0" encoding="utf-8"?>
<!--Un XLST es en principio un XML con caracterizticas añadidas-->
<!--para comenzar a usar un XSLT, es necesario contar con el entorno correto, para ello me sirve la etiqueta xsl:stylesheet-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<!--la etiqueta xsl:output me va a indicar el metodo de salida, o en otras palabras, el resultado de la transformación de mi documento mediante su propiedad "method"-->
	<xsl:output method="html" indent="yes"/>

	<!--Creamos una Variable que reciba un parámetro desde el procesador-->
	<!--la propiedad "name" establece el nombre de la variable-->
	<!--la propiedad "select" establece  el origen del dato de la variable-->
	<xsl:param name="TipoMenu" select="TipoMenu"></xsl:param>

	<!--vamos a hacer "match" con un docuemnto XML, en función de un Nodo específico, esto con la finalidad de comenzar nuestra navegación a partir de X nodo.
	para ello, nos apoyamos de la etiqueta "xsl:template" con su propiedad "match"-->

	<!--<xsl:template match="Padre" >
		<h4>Este es el contenido de mi XML de Prueba</h4>
		<ul>
			<h2>Padre</h2>
			<li>
				<xsl:value-of select="@atributoPadre"/>
			</li>
			<xsl:for-each select="Hijo[@esteno != 'no']">
				<h3>Hijo</h3>
				<ul>
					<li>
						<p>
							Valor del Atributo: <xsl:value-of select="@atributoHijo"/>
						</p>
					</li>
					<xsl:for-each select="nodo">
						<ol>
							<li>
								<p>
									Valor del Nodo: <xsl:value-of select="."/>
								</p>
							</li>
						</ol>
					</xsl:for-each>
				</ul>
			</xsl:for-each>
		</ul>
	</xsl:template>-->

	<xsl:template match="Menu">

		<!--Script-->
		<script>
			console.log(
			"El valor recuperado es: " +
			<xsl:value-of select="$TipoMenu"/>
			)
		</script>

		<html lang="en">

			<head>
				<meta charset="utf-8"/>
				<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

				<title>Restaurantly Bootstrap Template - Index</title>
				<meta content="" name="description"/>
				<meta content="" name="keywords"/>

				<!-- Favicons -->
				<link href="assets/img/favicon.png" rel="icon"/>
				<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"/>

				<!-- Google Fonts -->
				<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"/>

				<!-- Vendor CSS Files -->
				<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet"/>
				<link href="assets/vendor/aos/aos.css" rel="stylesheet"/>
				<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
				<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
				<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
				<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
				<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>

				<!-- Template Main CSS File -->
				<link href="assets/css/style.css" rel="stylesheet"/>

				<!-- =======================================================
  * Template Name: Restaurantly - v3.1.0
  * Template URL: https://bootstrapmade.com/restaurantly-restaurant-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
			</head>

			<body>

				<!-- ======= Top Bar ======= -->
				<div id="topbar" class="d-flex align-items-center fixed-top">
					<div class="container d-flex justify-content-center justify-content-md-between">

						<div class="contact-info d-flex align-items-center">
							<i class="bi bi-phone d-flex align-items-center">
								<span>+1 5589 55488 55</span>
							</i>
							<i class="bi bi-clock d-flex align-items-center ms-4">
								<span> Mon-Sat: 11AM - 23PM</span>
							</i>
						</div>

						<div class="languages d-none d-md-flex align-items-center">
							<ul>
								<li>En</li>
								<li>
									<a href="#">De</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<!-- ======= Header ======= -->
				<header id="header" class="fixed-top d-flex align-items-cente">
					<div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

						<h1 class="logo me-auto me-lg-0">
							<a href="index.html">Restaurantly</a>
						</h1>
						<!-- Uncomment below if you prefer to use an image logo -->
						<!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

						<nav id="navbar" class="navbar order-last order-lg-0">
							<ul>
								<!--Crear una lista dinámica a partir de las ocpiones de nuestro XML-->
								<xsl:for-each select="Opciones/Opcion">
									<li>
										<!--xsl:choose funciono como un Switch, permitiendome crear casos que empaten en función de una condición y declarar una condición defautl-->
										<xsl:choose>
											<!--xsl:when es equivalente a los "case" del Switch-->
											<xsl:when test="$TipoMenu = @Id">
												<!--el uso del "@" hace referencia a un atributo del Nodo en cuestión-->
												<a class="nav-link scrollto active" href="{@Url}">
													<xsl:value-of select="@Texto"/>
												</a>
											</xsl:when>
											<!--xsl:otherwise es equivalten al "default" del Switch-->
											<xsl:otherwise>
												<!--el uso del "@" hace referencia a un atributo del Nodo en cuestión-->
												<a class="nav-link scrollto" href="{@Url}">
													<xsl:value-of select="@Texto"/>
												</a>
											</xsl:otherwise>
										</xsl:choose>
									</li>
								</xsl:for-each>
							</ul>
							<i class="bi bi-list mobile-nav-toggle"></i>
						</nav>
						<!-- .navbar -->
						<a href="#x" class="book-a-table-btn scrollto d-none d-lg-flex">Book a table</a>

					</div>
				</header>
				<!-- End Header -->

				<!-- ======= Choose Section ======= -->
				<xsl:choose>
					<xsl:when test="$TipoMenu = 0">
						<!--xsl:call-template me ayuda a invocar un template que contiene información o estructurar dentro del mismo, y así inferiro dentro del template principal-->
						<xsl:call-template name="Home"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 1">
						<xsl:call-template name="Carta"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 2">
						<xsl:call-template name="Contacto"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 3">
						<xsl:call-template name="PlayRoom"></xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="Home"></xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<!--End Choose Section-->

				<!-- ======= Footer ======= -->
				<footer id="footer">
					<div class="footer-top">
						<div class="container">
							<div class="row">

								<div class="col-lg-3 col-md-6">
									<div class="footer-info">
										<h3>Restaurantly</h3>
										<p>
											A108 Adam Street <br/>
											NY 535022, USA<br/>
											<br/>
											<strong>Phone:</strong> +1 5589 55488 55<br/>
											<strong>Email:</strong> info@example.com<br/>
										</p>
										<div class="social-links mt-3">
											<a href="#" class="twitter">
												<i class="bx bxl-twitter"></i>
											</a>
											<a href="#" class="facebook">
												<i class="bx bxl-facebook"></i>
											</a>
											<a href="#" class="instagram">
												<i class="bx bxl-instagram"></i>
											</a>
											<a href="#" class="google-plus">
												<i class="bx bxl-skype"></i>
											</a>
											<a href="#" class="linkedin">
												<i class="bx bxl-linkedin"></i>
											</a>
										</div>
									</div>
								</div>

								<div class="col-lg-2 col-md-6 footer-links">
									<h4>Useful Links</h4>
									<ul>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Home</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">About us</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Services</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Terms of service</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Privacy policy</a>
										</li>
									</ul>
								</div>

								<div class="col-lg-3 col-md-6 footer-links">
									<h4>Our Services</h4>
									<ul>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Web Design</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Web Development</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Product Management</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Marketing</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Graphic Design</a>
										</li>
									</ul>
								</div>

								<div class="col-lg-4 col-md-6 footer-newsletter">
									<h4>Our Newsletter</h4>
									<p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
									<form action="" method="post">
										<input type="email" name="email"/>
										<input type="submit" value="Subscribe"/>
									</form>

								</div>

							</div>
						</div>
					</div>

					<div class="container">
						<div class="copyright">
							Copyright <strong>
								<span>Restaurantly</span>
							</strong>. All Rights Reserved
						</div>
						<div class="credits">
							<!-- All the links in the footer should remain intact. -->
							<!-- You can delete the links only if you purchased the pro version. -->
							<!-- Licensing information: https://bootstrapmade.com/license/ -->
							<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/restaurantly-restaurant-template/ -->
							Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>
					</div>
				</footer>
				<!-- End Footer -->

				<div id="preloader"></div>
				<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
					<i class="bi bi-arrow-up-short"></i>
				</a>

				<!-- Vendor JS Files -->
				<script src="assets/vendor/aos/aos.js"></script>
				<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
				<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
				<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
				<script src="assets/vendor/php-email-form/validate.js"></script>
				<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

				<!-- Template Main JS File -->
				<script src="assets/js/main.js"></script>

			</body>

		</html>

	</xsl:template>

	<xsl:template name="Home">
		<!-- ======= Hero Section ======= -->
		<section id="hero" class="d-flex align-items-center">
			<div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
				<div class="row">
					<div class="col-lg-8">
						<h1>
							<!--Recuperamos el valor del Nodo del Nombre del restaurante-->
							Bienvenido a <span>
								<xsl:value-of select="Datos/NombreRestaurant"/>
							</span>
						</h1>
						<h2>
							<!--Recuperamos los datos del restaurante-->
							<xsl:value-of select="Datos/Descripcion"/>
						</h2>

						<div class="btns">
							<a href="#menu" class="btn-menu animated fadeInUp scrollto">Our Menu</a>
							<a href="#book-a-table" class="btn-book animated fadeInUp scrollto">Book a Table</a>
						</div>
					</div>
					<div class="col-lg-4 d-flex align-items-center justify-content-center position-relative" data-aos="zoom-in" data-aos-delay="200">
						<a href="https://www.youtube.com/watch?v=GlrxcuEDyF8" class="glightbox play-btn"></a>
					</div>

				</div>
			</div>
		</section>
		<!-- End Hero -->

		<!-- ======= Main Section ======= -->
		<main id="main">
			<!-- ======= Why Us Section ======= -->
			<section id="why-us" class="why-us">
				<div class="container" data-aos="fade-up">

					<div class="section-title">
						<h2>Popular Items</h2>
						<p>Nuestros mejores platillos</p>
					</div>

					<div class="row">
						<!--Productos Populares desde el XML-->
						<!--Creo un recorrido para seleccionar el primer platillo de cada tipo de platillo excepto de bebidas-->
						<xsl:for-each select="Platillos/Tipo[@Nombre != 'Bebidas']/Platillo[@Orden=1]">
							<div class="col-lg-4 mt-4 mt-lg-0">
								<div class="box" data-aos="zoom-in" data-aos-delay="200">
									<div class="section-title">
										<!-- Aquí se muestra el Nombre del Tipo -->
										<h2>
											<xsl:value-of select="../@Nombre"/>
										</h2>
									</div>
									<h4>
										<span style="display: contents;">
											<!--substring(cadena, lugar inicial, numero de pasos)-->
											<xsl:value-of select="substring(@Nombre, 1, 1)"/>
										</span>
										<!--string-length(cadena) => el total de datos de la cadena-->
										<xsl:value-of select="substring(@Nombre, 2, string-length(@Nombre))"/>
									</h4>
									<p>
										<xsl:value-of select="Descripcion"/>
									</p>
									<h5>
										<xsl:value-of select="Precio"/>
									</h5>
									<br/>
									<img src="{Imagen}" alt="" style="width: 100%; height: auto;"/>
								</div>
							</div>
						</xsl:for-each>
					</div>
				</div>
			</section>
			<!-- End Why Us Section -->

			<!-- ======= Events Section ======= -->
			<section id="events" class="events">
				<div class="container" data-aos="fade-up">

					<div class="section-title">
						<h2>Especialidades</h2>
						<p>Conoce nuestra Especialidad</p>
					</div>

					<div class="events-slider swiper-container" data-aos="fade-up" data-aos-delay="100">
						<div class="swiper-wrapper">

							<xsl:for-each select="Platillos/Tipo[@Nombre = 'Comidas']/Platillo[@Especialidad = 'SI']">
								<!--Principal-->
								<div class="swiper-slide">
									<div class="row event-item">
										<div class="col-lg-6">
											<!--inferimos la imagen en su pocision 1-->
											<img src="{Imagen[position()=1]}" class="img-fluid" alt=""/>
										</div>
										<div class="col-lg-6 pt-4 pt-lg-0 content">
											<h3>
												<!--Recuperamos el Nombre del Platillos-->
												<xsl:value-of select="@Nombre"/>
											</h3>
											<div class="price">
												<p>
													<span>
														<xsl:value-of select="Precio"/>
													</span>
												</p>
											</div>
											<p class="fst-italic">
												<!--recuperamos el texto especial-->
												<xsl:value-of select="TextoEspecial"/>
											</p>
											<!--Ingredientes-->
											<div class="col-lg-12">
												<div class="col-lg-12">
													<div class="col-lg-6 pt-4 pt-lg-0 content">
														<h3>
															<!--recuperamos el nombre de los ingredientes-->
															<xsl:value-of select="Ingredientes/Ingrediente[position()=1]/@Nombre"/>
														</h3>
														<p class="fst-italic">
															<!--recuperamos el valor de los ingredientes-->
															<xsl:value-of select="Ingredientes/Ingrediente[position()=1]"/>
														</p>
													</div>
													<!--inferimos la imagen en su pocision 1-->
													<img src="{Imagen[position()=2]}" class="img-fluid" alt=""/>
												</div>

												<div class="col-lg-12">
													<div class="row event-item">
														<xsl:for-each select="Ingredientes/Ingrediente[position()>1]">
															<div class="col-lg-6 pt-4 pt-lg-0 content">
																<h3>
																	<!--recuperamos el nombre de los ingredientes-->
																	<xsl:value-of select="@Nombre"/>
																</h3>
																<p class="fst-italic">
																	<!--recuperamos el valor de los ingredientes-->
																	<xsl:value-of select="Ingredientes/Ingrediente[position()=1]"/>
																</p>
																<!--inferimos la imagen en su pocision 1-->
																<img src="{@Imagen}" class="img-fluid" alt=""/>
															</div>
														</xsl:for-each>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>


							</xsl:for-each>
							<!-- End testimonial item -->
						</div>

						<div class="swiper-pagination"></div>
					</div>

				</div>
			</section>
			<!-- End Events Section -->
		</main>
		<!-- End Main -->
	</xsl:template>

	<xsl:template name="Carta">
		<h1>Carta</h1>
	</xsl:template>

	<xsl:template name="Contacto">
		<h1>Contacto</h1>
	</xsl:template>

	<xsl:template name="PlayRoom">
		<h1>PlayRoom</h1>
	</xsl:template>

</xsl:stylesheet>
