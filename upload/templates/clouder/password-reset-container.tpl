{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

<div id="wrapper" class="main-content" style="min-height: auto; margin: auto;">
	<div class="login-container">
			
			<div class="login-header">
				
				<a href="{$WEB_ROOT}/">
					<img src="{$WEB_ROOT}/templates/{$template}/assets/images/logo.png" alt="logo" class="img-responsive">
				</a>					
					
			</div>
				
			<!-- BEGIN FORGOT BOX -->
		<div class="login-box visible">				
				<p class="bigger-110 text-uppercase">
					<i class="fas fa-key"></i> <b>{$LANG.pwreset}</b>
				</p>
					
				<hr />


			<div class="logincontainer" style="margin: 0; padding: 0;">
				{* {include file="$template/includes/pageheader.tpl" title=$LANG.pwreset} *}

				{if $loggedin && $innerTemplate}
					{include file="$template/includes/alert.tpl" type="error" msg=$LANG.noPasswordResetWhenLoggedIn textcenter=true}
				{else}
					{if $successMessage}
						{include file="$template/includes/alert.tpl" type="success" msg=$successTitle textcenter=true}
						<p>{$successMessage}</p>
					{else}
						{if $errorMessage}
							{include file="$template/includes/alert.tpl" type="error" msg=$errorMessage textcenter=true}
						{/if}

						{if $innerTemplate}
							{include file="$template/password-reset-$innerTemplate.tpl"}
						{/if}
					{/if}
				{/if}
			</div>
		</div>
		
		<div class="login-copyright-text">
			<p class="smaller-90">{$LANG.copyright} &copy; {$date_year} {$companyname}. <span class="hidden-xs">{$LANG.allrightsreserved}.</span></p>
		</div>
				
	</div>
</div>
