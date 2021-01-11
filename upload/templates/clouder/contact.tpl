{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{if $sent}
    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.contactsent textcenter=true}
{/if}

{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

{if !$sent}
                  
<!-- BEGIN FORM-->
<form method="post" action="contact.php" role="form">
	<input type="hidden" name="action" value="send" />
				 
	<div class="TM-card">
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="inputName">{$LANG.supportticketsclientname}</label>
					<input type="text" name="name" value="{$name}" class="form-control" id="inputName" />
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="inputEmail">{$LANG.supportticketsclientemail}</label>
					<input type="email" name="email" value="{$email}" class="form-control" id="inputEmail" />
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputSubject">{$LANG.supportticketsticketsubject}</label>
			<input type="subject" name="subject" value="{$subject}" class="form-control" id="inputSubject" />
		</div>
					  
		<div class="form-group">
			<label for="inputMessage">{$LANG.contactmessage}</label>
			<textarea name="message" rows="10" class="form-control" id="inputMessage">{$message}</textarea>
		</div>
	</div>
	
	{if $captcha}	
	<div class="form-group text-center">
		{include file="$template/includes/captcha.tpl"}
	</div>
	{/if}
					
	<div class="form-actions text-center">
		<button type="submit" class="btn btn-lg btn-primary{$captcha->getButtonClass($captchaForm)}">{$LANG.contactsend}</button>
	</div>
</form>
<!-- END FORM-->

{/if}
