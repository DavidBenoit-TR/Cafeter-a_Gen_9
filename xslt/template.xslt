﻿<?xml version="1.0" encoding="utf-8"?>
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

				<!--JS References-->
				<script type="text/javascript" src="assets/js/jquery-1.11.2.min.js"></script>
				<!--CDN Sweet Alert 2-->
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
				<!--<script src="assets/vendor/php-email-form/validate.js"></script>-->
				<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
				<!-- jQuery -->
				<script type="text/javascript" src="assets/js/jquery-1.11.2.min.js"></script>

				<!-- Template Main JS File -->
				<script src="assets/js/main.js"></script>

			</body>

		</html>

	</xsl:template>

	<xsl:template name="Home">
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
						<p>Conoce nuestras Especialidades</p>
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

			<!-- ======= Specials Section ======= -->
			<section id="specials" class="specials">
				<div class="container" data-aos="fade-up">

					<div class="section-title">
						<h2>Bebidas</h2>
						<p>Refescate con nuestras deliciosas Bebidas</p>
					</div>

					<div class="row" data-aos="fade-up" data-aos-delay="100">
						<!--Barra Lateral-->
						<div class="col-lg-3">
							<ul class="nav nav-tabs flex-column">
								<!--Recorremos cada Bebida por su Nombre y Orden-->
								<xsl:for-each select="Platillos/Tipo[@Nombre = 'Bebidas']/Platillo">
									<li class="nav-item">
										<xsl:choose>
											<xsl:when test="@Orden = 1">
												<a class="nav-link show active" data-bs-toggle="tab" href="#tab-{@Orden}">
													<xsl:value-of select="@Nombre"/>
												</a>
											</xsl:when>
											<xsl:otherwise>
												<a class="nav-link show" data-bs-toggle="tab" href="#tab-{@Orden}">
													<xsl:value-of select="@Nombre"/>
												</a>
											</xsl:otherwise>
										</xsl:choose>
									</li>
								</xsl:for-each>
							</ul>
						</div>
						<!--Contenido-->
						<div class="col-lg-9 mt-4 mt-lg-0">
							<div class="tab-content">
								<xsl:for-each select="Platillos/Tipo[@Nombre = 'Bebidas']/Platillo">
									<xsl:choose>
										<xsl:when test="@Orden = 1">
											<div class="tab-pane active show" id="tab-{@Orden}">
												<div class="row">
													<div class="col-lg-8 details order-2 order-lg-1">
														<h3>
															<xsl:value-of select="Precio"/>
														</h3>
														<p class="fst-italic">
															<xsl:value-of select="Descripcion"/>
														</p>
													</div>
													<div class="col-lg-4 text-center order-1 order-lg-2">
														<img src="{Imagen}" alt="" class="img-fluid"/>
													</div>
												</div>
											</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="tab-pane show" id="tab-{@Orden}">
												<div class="row">
													<div class="col-lg-8 details order-2 order-lg-1">
														<h3>
															<xsl:value-of select="Precio"/>
														</h3>
														<p class="fst-italic">
															<xsl:value-of select="Descripcion"/>
														</p>
													</div>
													<div class="col-lg-4 text-center order-1 order-lg-2">
														<img src="{Imagen}" alt="" class="img-fluid"/>
													</div>
												</div>
											</div>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</div>
					</div>

				</div>
			</section>
			<!-- End Specials Section -->
		</main>
		<!-- End Main -->
	</xsl:template>

	<xsl:template name="Carta">
		<!-- ======= Menu Section ======= -->
		<section id="menu" class="menu section-bg">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Menu</h2>
					<p>Deleitate con nuestro delicioso Menu</p>
				</div>

				<div class="row" data-aos="fade-up" data-aos-delay="100">
					<div class="col-lg-12 d-flex justify-content-center">
						<ul id="menu-flters">
							<!--Dejamos el principal que nos mostrara todas las secciones-->
							<li data-filter="*" class="filter-active">All</li>
							<!--recorremos cada tipo de platillo para crear las opcioens-->
							<xsl:for-each select="Platillos/Tipo">
								<li data-filter=".filter-{@Nombre}">
									<xsl:value-of select="@Nombre"/>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</div>

				<div class="row menu-container" data-aos="fade-up" data-aos-delay="200">

					<!--Recorremos cada tipo de paltillo -->
					<xsl:for-each select="Platillos/Tipo/Platillo">
						<div class="col-lg-6 menu-item filter-{../@Nombre}">
							<img src="{Imagen}" class="menu-img" alt=""/>
							<div class="menu-content">
								<a href="#">
									<!--recuperamoss el nombre del paltillo-->
									<xsl:value-of select="@Nombre"/>
								</a>
								<span>
									<!--recuperamos el precio del platillo-->
									<xsl:value-of select="Precio"/>
								</span>
							</div>
							<div class="menu-ingredients">
								<!--recuperamos lka descripcion del platillo-->
								<xsl:value-of select="Descripcion"/>
							</div>
						</div>
					</xsl:for-each>

				</div>

			</div>
		</section>
		<!-- End Menu Section -->
	</xsl:template>

	<xsl:template name="Contacto">

		<!--API de Google-->
		<script>
			<![CDATA[
			(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
			key: "AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs",
			// Add other bootstrap parameters as needed, using camel case.
			// Use the 'v' parameter to indicate the version to load (alpha, beta, weekly, etc.)
			});]]>
		</script>

		<!--Referencia a mi archivo JS-->
		<script src="assets/js/MiScript.js" type="text/javascript"></script>

		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Contacto</h2>
					<p>Queremos Escucharte</p>
				</div>
			</div>
			<!--Mapa-->
			<div data-aos="fade-up">
				<style>
					#map {
					border:0;
					width: 100%;
					height: 350px;
					}
				</style>

				<div id="google-map">
					<div id="map"></div>
				</div>
				<text id="direccion"> esta es una etiqueta de texto </text>
				<div class="col-lg-12 margin-bottom-30" id="street"></div>

				<!--<iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen=""></iframe>-->
			</div>
			<!--Datos y Formulario-->
			<div class="container" data-aos="fade-up">

				<div class="row mt-5">
					<!--Datos de Contacto-->
					<div class="col-lg-4">
						<div class="info">
							<div class="address">
								<i class="bi bi-geo-alt"></i>
								<h4>Direccion:</h4>
								<p>
									<xsl:value-of select="Datos/Direccion"/>
								</p>
							</div>

							<div class="open-hours">
								<i class="bi bi-clock"></i>
								<h4>Horarios:</h4>
								<xsl:for-each select="Datos/Horarios/Horario">
									<p>
										<xsl:value-of select="."/>
									</p>
								</xsl:for-each>
							</div>

							<div class="email">
								<i class="bi bi-envelope"></i>
								<h4>Email:</h4>
								<p>
									<a href="mailto:{Datos/correo}">
										<xsl:value-of select="Datos/correo"/>
									</a>
								</p>
							</div>

							<div class="phone">
								<i class="bi bi-phone"></i>
								<h4>Telefono:</h4>
								<p>
									<xsl:value-of select="Datos/Telefono"/>
								</p>
							</div>

						</div>

					</div>
					<!--Formulario-->
					<div class="col-lg-8 mt-5 mt-lg-0">
						<!--Action => se refiere a la acción que se ejecutará al enviar le formulario, generalemnte usamos una URL o bien un controlador-->
						<!--method => hace referencia al cómo se enviará la petición del formulario, en esta caso y en su mayoría lo enviamos bajo una petición 'POST' que significa que enviará los datos en 2do plano dentro del cuerpo de la petición-->
						<form action="#" method="post" role="form" class="php-email-form">

							<div class="row">
								<div class="col-md-6 form-group">
									<input type="text" name="contact_name" class="form-control" id="contact_name" placeholder="Ingrese su Nombre" required=""/>
								</div>
								<div class="col-md-6 form-group mt-3 mt-md-0">
									<input type="email" class="form-control" name="contact_mail" id="contact_mail" placeholder="Ingrese su Email" required=""/>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6 form-group">
									<input type="number" id="contact_people" class="form-control" required="true" max="8" min="1" placeholder="# de Personas"/>
								</div>
								<div class="col-md-6 form-group mt-3 mt-md-0">
									<input type="number" id="contact_add" class="form-control" required="true" max="4" min="0" placeholder="# de Personas Adicionales"></input>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 form-group mt-3 mt-md-0">
									<input type="date" id="contact_fecha" name="contact_fecha" class="form-control" required="true"></input>
								</div>

								<div class="col-md-6 form-group mt-3 mt-md-0">
									<input type="time" id="contact_hora" name="contact_hora" class="form-control" required ="true" max="19:00:00" min="08:00:00"></input>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 form-group mt-3 mt-md-0">
									<output id="total" class="form-control" disable="true"></output>
								</div>
							</div>
							<!--<div class="my-3">
								<div class="loading">Loading</div>
								<div class="error-message"></div>
								<div class="sent-message">Your message has been sent. Thank you!</div>
							</div>-->
							<div class="text-center">
								<br/>
								<br/>
								<br/>
								<!--<button type="submit">Enviar Reservacion</button>-->
								<a class="book-a-table-btn" id="miBoton" onclick="enviar_formulario()">Presionar</a>
							</div>
						</form>

					</div>

				</div>

			</div>

			<script>
				$(document).ready(function () {
				//recuperar la fecha actual del servidor (donde se ejecuta el sistema)
				var now = new Date(Date.now());
				//recupero el control de "contact_hora"
				var timecontrol = document.getElementById("contact_hora");
				//recupero la hora y minutos actuales del servidor (donde se ejecuta el sistema)
				var horas = now.getHours();
				var minutos = now.getMinutes();

				//imprimo en consola los resultados
				//console.log("now: " + now);
				//console.log("horas: " + horas);
				//console.log("minutos: " + minutos);
				//console.log("timecontrol: " + timecontrol);

				//Validar Formato de la hora
				if (horas <![CDATA[<]]> 10) {
				horas = "0" + horas;
				}
				if (minutos <![CDATA[<]]> 10) {
				minutos = "0" + minutos;
				}

				var formatted = horas + ":" + minutos;
				//console.log("formatted: " + formatted);
				//Asigno la hora al control de "contact_hora"
				//JS
				timecontrol.value = formatted;
				//JQuery Puro
				$("#contact_hora").val(formatted);
				//JQUERY apelando al atributo
				$("#contact_hora").attr("value", formatted);

				//Para la Fecha
				var dia = now.getDate();
				var mes = now.getMonth() + 1; //asigno +1 ya que los meses son parte de un array que empieza en 0
				var anio = now.getFullYear();

				//imprimo los valores para corroborar
				//console.log("dia: " + dia);
				//console.log("mes: " + mes);
				//console.log("anio: " + anio);

				//validación de 0 utilizando operadores ternarios
				//condición ? verdadero : falso
				dia = dia <![CDATA[<]]> 10 ? "0" + dia : dia;
				mes = mes <![CDATA[<]]> 10 ? "0" + mes : mes;

				var fechaFormatted = anio + "-" + mes + "-" + dia;
				//console.log("fechaFormatted: " + fechaFormatted);

				//Asignar los valores usando JS, JQuery(2) al elemento 'contact_fecha'
				//JS
				var fechacontrol = document.getElementById("contact_fecha");
				fechacontrol.value = fechaFormatted;
				//JQuery asignando Valor
				$("#contact_fecha").val(fechaFormatted);
				//Jquery apelando al atributo
				$("#contact_fecha").attr("value", fechaFormatted);

				initMap();
				getGeo();


				}); //fin de docuemnt.ready

				//Validaciones
				var personas = document.getElementById('contact_people')
				var personas_add = document.getElementById('contact_add')

				personas.value = 1
				personas_add.value = 0

				validar();


			</script>
		</section>
		<!-- End Contact Section -->

	</xsl:template>

	<xsl:template name="PlayRoom">
		<h1>PlayRoom</h1>
	</xsl:template>

</xsl:stylesheet>
