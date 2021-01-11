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
				
				<!-- BEGIN LOGIN BOX -->
				<div id="login-box" class="login-box visible">					
					<p class="bigger-110 text-uppercase">
						<i class="fas fa-key"></i> <b>{$LANG.account} {$LANG.login}</b>
					</p>
					
					<hr />
					
					{include file="$template/includes/flashmessage.tpl"}
								
					<form method="post" action="{routePath('login-validate')}">
						<div class="form-group">
							<div class="input-icon right">
								<span class="fas fa-key text-gray"></span>
								<input type="email" name="username" class="form-control" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
							</div>
						</div>
						<div class="form-group">
							<div class="input-icon right">
								<span class="fas fa-lock text-gray"></span>
								<input type="password" name="password" class="form-control" id="inputPassword" placeholder="{$LANG.clientareapassword}" autocomplete="off" >
							</div>
						</div>			
						
						
						<div class="footer-warp">
												
							<div class="pull-left">
								<label>
									<input type="checkbox" type="checkbox" name="rememberme" />
									<span class="labels"> {$LANG.loginrememberme}</span>
								</label>							
							</div>
							
							<div class="pull-right">
								<a href="{routePath('password-reset-begin')}" class="text-underline">{$LANG.loginforgotteninstructions}</a>
							</div>
							
							<div class="clearfix"></div>

							{if $captcha->isEnabled()}
								<div class="text-center">
									{include file="$template/includes/captcha.tpl"}
								</div>
							{/if}							
							<input id="login" type="submit" class="btn-login btn btn-primary btn-lg btn-block{$captcha->getButtonClass($captchaForm)}" value="{$LANG.loginbutton}" /> 
							<p><small>{$LANG.sso.redirectafterlogin}</small></p>
							
						</div>
						
					</form>
					
					{if $linkableProviders}
						<div class="providerLinkingFeedback"></div>					
						{include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
					{/if}
				</div>
				
				<div class="login-copyright-text">
					<p class="smaller-90">{$LANG.copyright} &copy; {$date_year} {$companyname}. <span class="hidden-xs">{$LANG.allrightsreserved}.</span></p>
				</div>
				<!-- END LOGIN BOX -->
				
			</div>
			<!-- END MAIN PAGE CONTENT --> 
	</div>