{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}



{include file="$template/includes/flashmessage.tpl"}

<div class="row">
	<div class="col-sm-7">
		<form class="using-password-strength" method="post" action="{routePath('user-password')}" role="form">
			<input type="hidden" name="submit" value="true" />
			<div class="TM-card">
				<div class="form-group">
					<label for="inputExistingPassword" class="control-label">{$LANG.existingpassword}</label>
					<input type="password" class="form-control" name="existingpw" id="inputExistingPassword" autocomplete="off" />
				</div>
				<div id="newPassword1" class="form-group has-feedback">
					<label for="inputNewPassword1" class="control-label">{$LANG.newpassword}</label>
					<input type="password" class="form-control" name="newpw" id="inputNewPassword1" autocomplete="off" />
					<span class="form-control-feedback glyphicon"></span>
					{include file="$template/includes/pwstrength.tpl"}
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-default generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
						{$LANG.generatePassword.btnLabel}
					</button>
				</div>
				<div id="newPassword2" class="form-group has-feedback">
					<label for="inputNewPassword2" class="control-label">{$LANG.confirmnewpassword}</label>
					<input type="password" class="form-control" name="confirmpw" id="inputNewPassword2" autocomplete="off" />
					<span class="form-control-feedback glyphicon"></span>
					<div id="inputNewPassword2Msg"></div>
				</div>
			</div>
			<div class="form-actions">
				<input class="btn btn-primary" type="submit" value="{$LANG.clientareasavechanges}" />
				<input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
			</div>
		</form>
	</div>
</div>
