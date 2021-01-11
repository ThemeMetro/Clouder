{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


	<div id="wrapper">
			<!-- BEGIN MAIN PAGE CONTENT -->
			
			<div class="login-container">
			
				<div class="login-header">
				
					<a href="{$WEB_ROOT}/">
						<img src="{$WEB_ROOT}/templates/{$template}/assets/images/logo.png" alt="logo" class="img-responsive">
					</a>					
					
				</div>
				
				<!-- BEGIN FORGOT BOX -->
				<div class="login-box visible">				
					<p class="bigger-110 text-uppercase">
						<i class="fa fa-lock"></i> <b>{$LANG.account} {$LANG.logouttitle}</b>
					</p>
					
					<hr />
					
					{include file="$template/includes/alert.tpl" type="success" msg=$LANG.logoutsuccessful textcenter=true}
					
					<div class="footer-wrap">
						<a href="{$WEB_ROOT}/" class="btn-login btn btn-primary btn-lg btn-block">{$LANG.logoutcontinuetext}</a>
					</div>					
				</div>
				
				
				<div class="login-copyright-text">
					<p class="smaller-90">{$LANG.copyright} &copy; {$date_year} {$companyname}. <span class="hidden-xs">{$LANG.allrightsreserved}.</span></p>
				</div>
				<!-- END FORGOT BOX -->
				
			</div>

			<!-- END MAIN PAGE CONTENT --> 
	</div>