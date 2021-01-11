{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


<div id="wrapper">
	<div class="main-content">
		<div class="login-container">
		
			<div class="login-header">
				
				<a href="{$WEB_ROOT}/">
					<img src="{$WEB_ROOT}/templates/{$template}/assets/images/logo.png" alt="logo" class="img-responsive">
				</a>					
					
			</div>
			
			<!-- BEGIN FORGOT BOX -->
			<div class="login-box visible">	
			
				<p class="bigger-110 text-uppercase">
					<i class="fa fa-key"></i> <b>{$LANG.account} {$LANG.pwreset}</b>
				</p>

				{if $invalidlink}

					{include file="$template/includes/alert.tpl" type="danger" msg=$invalidlink textcenter=true}

				{elseif $success}

					{include file="$template/includes/alert.tpl" type="success" msg=$LANG.pwresetvalidationsuccess textcenter=true}

					<p class="text-center">
						{$LANG.pwresetsuccessdesc|sprintf2:'<a href="clientarea.php">':'</a>'}
					</p>

				{else}

					{if $errormessage}
						{include file="$template/includes/alert.tpl" type="danger" msg=$errormessage textcenter=true}
					{/if}

					<p>{$LANG.pwresetenternewpw}</p>

					<form class="using-password-strength" method="post" action="{$smarty.server.PHP_SELF}?action=pwreset">
						<input type="hidden" name="key" id="key" value="{$key}" />

						<div id="newPassword1" class="form-group has-feedback">
							<label class="control-label" for="inputNewPassword1">{$LANG.newpassword}</label>
							<input type="password" name="newpw" id="inputNewPassword1" class="form-control" autocomplete="off" />
							<span class="form-control-feedback glyphicon glyphicon-password"></span>
						</div>

						<div id="newPassword2" class="form-group has-feedback">
							<label class="control-label" for="inputNewPassword2">{$LANG.confirmnewpassword}</label>
							<input type="password" name="confirmpw" id="inputNewPassword2" class="form-control" autocomplete="off" />
							<span class="form-control-feedback glyphicon glyphicon-password"></span>
							<div id="inputNewPassword2Msg"></div>
						</div>

						<div class="form-group">
							<label class="control-label">{$LANG.pwstrength}</label>
							{include file="$template/includes/pwstrength.tpl"}
						</div>

						<div class="form-group">
							<div class="btn-group">
								<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
								<input class="btn btn-inverse btn-line" type="reset" value="{$LANG.cancel}" />
							</div>
						</div>

					</form>

				{/if}

			</div>
			<div class="login-copyright-text">
				<p class="smaller-90">{$LANG.copyright} &copy; {$date_year} {$companyname}. <span class="hidden-xs">{$LANG.allrightsreserved}.</span></p>
			</div>
		</div>
	</div>
</div>