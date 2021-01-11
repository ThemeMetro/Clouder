{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}
		
		{if $registerdomainenabled || $transferdomainenabled}
		<!--Domain Section-->
			<div class="mass-head">
				<div class="container">
				
					<div class="domain-hero">
						<!--Domain Search Input Box-->
						<form class="form-search" action="domainchecker.php" method="post">
							<div class="input-group">
								<input type="text" name="domain" placeholder="{$LANG.findyourdomain}" value="{$domain}" id="inputDomain" class="form-control search-query input-lg" autocapitalize="none" />
								<span class="input-group-btn">
									{if $registerdomainenabled}
									<button type="submit" class="btn btn-lg btn-primary" value="{$LANG.search}" onclick="$('#modalpleasewait').modal();">
										<span class="visible-xs"><i class="fa fa-search icon-only"></i></span> <span class="hidden-xs">{$LANG.search}</span>
									</button>
									{/if}
									 {if $transferdomainenabled}
									<button type="submit" name="transfer" class="btn btn-lg btn-inverse" value="{$LANG.domainstransfer}" onclick="$('#modalpleasewait').modal();">
										<span class="visible-xs"><i class="fa fa-share icon-only"></i></span> <span class="hidden-xs">{$LANG.domainstransfer}</span>
									</button>									 
									 {/if}
								</span>
							</div>
						</form>
						<!--End Domain Search Input Box-->
						
						<!-- Domain Offers-->
						<div class="domain-pricing">
							<ul class="list-unstyled list-inline">
								<li><img src="{$WEB_ROOT}/templates/{$template}/assets/images/gallery/tlds/com.png">$9.99</li>
								<li><img src="{$WEB_ROOT}/templates/{$template}/assets/images/gallery/tlds/net.png">$9.99</li>
								<li><img src="{$WEB_ROOT}/templates/{$template}/assets/images/gallery/tlds/online.png">$2.99</li>
								<li><img src="{$WEB_ROOT}/templates/{$template}/assets/images/gallery/tlds/host.png">$49.00</li>
								<!--li><img src="{$WEB_ROOT}/templates/{$template}/assets/images/gallery/tlds/me.png">$9.99</li-->
								<!--li><img src="{$WEB_ROOT}/templates/{$template}/assets/images/gallery/tlds/in.png">$1.99</li-->
							</ul>
						</div>
						<!-- Domain Offers-->
					</div>
					
				</div>			
			</div>
		{/if}
		
		<div class="{if $registerdomainenabled || $transferdomainenabled}no-border {else}mass-head{/if} block-s5 no-padding-top hero-bg-wrap">
			<div class="container">
			<!--CONTENT-->
			
				<div class="row">
					<div class="bg-shape-poly col-md-9">
					
						<div class="carousel tc-carousel slide" data-ride="carousel" id="TM-home">
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
							
							
								<!-- Carousel items 1 -->
								<div class="item active">
								
									<h1>Web Hosting</h1>
									<h2>Get a website that works It's quick and easy..</h2>
								
									<a href="web_hosting.php" class="btn btn-lg btn-primary">View Plans & Features</a>
									
								</div>
								<!-- Carousel items 2-->
								<div class="item">
								
									<h1>Reseller Hosting</h1>
									<h2 class="description">Start Your Own Web Hosting Business Today..</h2>
								
									<a href="reseller_hosting.php" class="btn btn-lg btn-success">View Plans & Features</a>
									
								</div>
								<!-- Carousel items 3-->
								<div class="item">
								
									<h1>VPS Hosting</h1>
									<h2>Step up to the power of a Fully Managed Cloud VPS..</h2>
								
									<a href="vps_hosting.php" class="btn btn-lg btn-danger">View Plans & Features</a>
									
								</div>
								<!-- Carousel items 4-->
								<div class="item">
								
									<h1>Dedicated Servers</h1>
									<h2>Go Dedicated and get the whole box to yourself..</h2>
								
									<a href="dedicated_services.php" class="btn btn-lg btn-secondary">View Plans & Features</a>
									
								</div>
							</div>

							<!-- Indicators -->
							<ol class="carousel-indicators left">
								<li data-target="#TM-home" data-slide-to="0" class="active"></li>
								<li data-target="#TM-home" data-slide-to="1"></li>
								<li data-target="#TM-home" data-slide-to="2" ></li>
								<li data-target="#TM-home" data-slide-to="3" ></li>
							</ol>
							
						</div>
				
					</div>
					
					<div class="col-md-3 pull-right hidden-xs hidden-sm">
						<div class="promo-tag">
							<h4>Sign up now & Get</h4>
							<span class="discount">20%</span>
							<span class="small">OFF</span>
							<p>by using coupon code <br /><span class="coupon">Holiday</span></p>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<div class="block-s3 bottom2x margin-up light">
			<div class="TM-pricing-container">
				<div class="container">
					<div class="owl-carousel pricing-slider">
						<!-- Wrapper for partners slides --> 
						<div class="slide-item">
							<!-- Shred Hosting-->
							<div class="TMC-pricing-table">
								<h4>Shared Hosting</h4>
								<div class="desc">
									The Next Generation Of Hosting Speed -- Security -- Scalability
								</div>
								<div class="price">
									From<span>$2.95</span>/mo					
								</div>
								<a href="web_hosting.php" class="btn btn-primary btn-lg btn-block">
									Choose Plan
								</a>
							</div>
						</div>
						<div class="slide-item">
							<!-- Reseller Hosting-->
							<div class="TMC-pricing-table">
								<h4>Reseller Hosting</h4>
								<div class="desc">
									Reseller plans are designed for you to earn money!
								</div>
								<div class="price">
									From<span>$24.95</span>/mo						
								</div>
								<a href="reseller_hosting.php" class="btn btn-primary btn-lg btn-block">
									Choose Plan
								</a>
								<!-- Popular plan code -->
								<div class="sticker-wrapper">
									<div class="sticker bg-success">
										Get FREE WHMCS
									</div>
								</div>
								<!-- //End popular plan code-->
							</div>
						</div>
						<div class="slide-item">
							<!-- VPS Hosting-->
							<div class="TMC-pricing-table">
								<h4>VPS Hosting</h4>
								<div class="desc">
									Dedicated functionality, but without the expense.
								</div>
								<div class="price">
									From<span>$19.95</span>/mo					
								</div>
								<a href="vps_hosting.php" class="btn btn-primary btn-lg btn-block">
									Choose Plan
								</a>
							</div>
						</div>
						<div class="slide-item">
							<!-- Dedicated Servers-->
							<div class="TMC-pricing-table">
								<h4>Dedicated Servers</h4>
								<div class="desc">
									Total control over your hosting configuration and environment.
								</div>
								<div class="price">
									From<span>$199.00</span>/mo						
								</div>
								<a href="dedicated_servers.php" class="btn btn-primary btn-lg btn-block">
									Choose Plan
								</a>
							</div>
						</div>
						<!-- /Wrapper for slides -->
					</div>
				</div>
			</div>
		</div>
		


		<div class="block-s1 inverse arrow-block">
			<div class="container">
				<h1 class="text-center text-uppercase bolder">Why get online with us?</h1>
			</div>
		</div>		

		<div class="block-s3 padding2x light">
			<div class="container">
			
				<div class="owl-carousel features-slider">
					<!-- Wrapper for slides -->  
					<div class="slide-item">
						<div class="TM-box s2">
							<i class="fas fa-server"></i>
							<h3>Fast load time</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
						</div>
					</div>
					
					<div class="slide-item">
						<div class="TM-box s2">
							<i class="fas fa-life-ring"></i>
							<h3>Included Apps</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
						</div>
					</div>
					
					<div class="slide-item">
						<div class="TM-box s2">
							<i class="fas fa-sliders-h"></i>
							<h3>Flexibility</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
						</div>
					</div>

					<div class="slide-item">
						<div class="TM-box s2">
							<i class="fas fa-lock"></i>
							<h3>Total Secure</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
						</div>
					</div>

					<div class="slide-item">
						<div class="TM-box s2">
							<i class="fas fa-comments"></i>
							<h3>Great Support</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
						</div>
					</div>
					
					<div class="slide-item">
						<div class="TM-box s2">
							<i class="fas fa-cloud"></i>
							<h3>Real Cloud</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
						</div>
					</div>
					
					<div class="slide-item">
						<div class="TM-box s2">
							<i class="fas fa-briefcase"></i>
							<h3>Powerful Tools</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
						</div>
					</div>
					<!-- /Wrapper for slides -->
				</div>
			</div>
		</div>

		<div class="block-s3 padding4x sec-img-bg bg-opacity inverse text-center">
			<div class="container">
				<div class="row">
					<div class="col-md-9 center-block">
						<h1 class="text-uppercase bolder"><span class="text-primary">Switching</span> From Another Host?</h1>
						<p class="text-gray">Our dedicated Migrations Team is standing by to transfer your existing content from your prior host and configure it to perform optimally on our platform. We can also transfer domain registrations from other registrars in order to provide you complete management of your entire online portfolio all in one place!</p>
						
						<br />
						<a href="#" class="btn btn-primary btn-lg">Read More..</a>
					</div>
				</div>
			</div>	
		</div>	

		
		
		<div class="block-s3 padding2x">
			<div class="container">
				<h1 class="text-center text-uppercase bolder">What <span class="text-secondary text-underline">People</span> Says?</h1>
					
				<div class="space-20"></div>
					
				<div class="carousel tc-carousel slide text-center" data-ride="carousel" id="TM-testimonials">
					<!-- Wrapper for slides -->
					<div class="carousel-inner">
					
					
						<!-- Carousel items 1 -->
						<div class="item active">									
							<div class="testimonial-massage">
								<i class="fa fa-quote-left"></i> <i>This is the most awesome, full featured, easy, costomizeble theme. It’s extremely responsive and very helpful to all suggestions.</i>
							</div>
									
							<p><span class="testimonial-name">Mark Doe,</span> <a href="#" target="_blank">Red Publicity, LLC</a></p>
							
						</div>
						<!-- Carousel items 2-->
						<div class="item">
							<div class="testimonial-massage">
								<i class="fa fa-quote-left"></i> <i>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse.</i>
							</div>
								
							<p><span class="testimonial-name">John Smith,</span> <a href="#" target="_blank">Red Publicity, LLC</a></p>
							
						</div>
						<!-- Carousel items 3-->
						<div class="item">
							<div class="testimonial-massage">
								<i class="fa fa-quote-left"></i> </i>Williamsburg carles vegan helvetica. Cosby sweater eu banh mi, qui irure terry richardson ex squid Aliquip placeat salvia cillum iphone.</i>
							</div>
								
							<p><span class="testimonial-name">Linda Adams,</span> <a href="#" target="_blank">New Publicity, LLC</a></p>
							
						</div>
					</div>

					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#TM-testimonials" data-slide-to="0" class="active"></li>
						<li data-target="#TM-testimonials" data-slide-to="1" class=""></li>
						<li data-target="#TM-testimonials" data-slide-to="2" ></li>
					</ol>
					
					  <!-- Controls -->
					  <a class="left carousel-control" href="#TM-testimonials" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					  </a>
					  <a class="right carousel-control" href="#TM-testimonials" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					  </a>
				</div>
			</div>			
		</div>
		
		<div class="modal fade in" id="modalpleasewait">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header text-center">
						 <h4><i class="fa fa-spinner fa-pulse text-warning"></i> {$LANG.pleasewait}</h4>
					</div>
				</div>
			</div>
		</div>