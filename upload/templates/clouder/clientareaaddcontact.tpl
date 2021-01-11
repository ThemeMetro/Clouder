{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

<script>
var stateNotRequired = true;
    jQuery(document).ready(function() {
    WHMCS.form.register();
});
</script>
<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

	<h4>{$LANG.clientareachoosecontact}</h4>
    <form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=contacts">
		<div class="TM-card">
			<div class="row">
				<div class="col-sm-6">
					<select name="contactid" id="inputContactId" onchange="submit()" class="form-control">
						{foreach item=contact from=$contacts}
							<option value="{$contact.id}">{$contact.name} - {$contact.email}</option>
						{/foreach}
						<option value="new" selected="selected">{$LANG.clientareanavaddcontact}</option>
					</select>
				</div>
			</div>
		</div>
    </form>

<form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=addcontact">
    <input type="hidden" name="submit" value="true" />

	<h4>{$LANG.orderForm.personalInformation}</h4>
	<div class="TM-card">
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="inputFirstName" class="control-label">{$LANG.clientareafirstname}</label>
					<input type="text" name="firstname" id="inputFirstName" value="{$contactfirstname}" class="form-control" />
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="inputLastName" class="control-label">{$LANG.clientarealastname}</label>
					<input type="text" name="lastname" id="inputLastName" value="{$contactlastname}" class="form-control" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="inputEmail" class="control-label">{$LANG.clientareaemail}</label>
					<input type="email" name="email" id="inputEmail" value="{$contactemail}" class="form-control" />
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="inputPhone" class="control-label">{$LANG.clientareaphonenumber}</label>
					<input type="tel" name="phonenumber" id="inputPhone" value="{$contactphonenumber}" class="form-control" />
				</div>
			</div>
		</div>
	</div>
	
	<h4>{$LANG.orderForm.billingAddress}</h4>
	<div class="TM-card">
		<div class="form-group">
            <label for="inputCompanyName" class="control-label">{$LANG.clientareacompanyname}</label>
            <input type="text" name="companyname" id="inputCompanyName" value="{$contactcompanyname}" class="form-control" />
         </div>
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="inputAddress1" class="control-label">{$LANG.clientareaaddress1}</label>
					<input type="text" name="address1" id="inputAddress1" value="{$contactaddress1}" class="form-control" />
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="inputAddress2" class="control-label">{$LANG.clientareaaddress2}</label>
					<input type="text" name="address2" id="inputAddress2" value="{$contactaddress2}" class="form-control" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div class="row">
					<div class="col-sm-6">
					   <div class="form-group">
							<label for="inputCity" class="control-label">{$LANG.clientareacity}</label>
							<input type="text" name="city" id="inputCity" value="{$contactcity}" class="form-control" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="inputState" class="control-label">{$LANG.clientareastate}</label>
							<input type="text" name="state" id="inputState" value="{$contactstate}" class="form-control" />
						</div>	
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="inputPostcode" class="control-label">{$LANG.clientareapostcode}</label>
							<input type="text" name="postcode" id="inputPostcode" value="{$contactpostcode}" class="form-control" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="control-label" for="country">{$LANG.clientareacountry}</label>
							{$countriesdropdown}
						</div>
					</div>
				</div>
			</div>
		</div>
		{if $showTaxIdField}		
        <div class="form-group">
            <label for="inputTaxId" class="control-label">{lang key=$taxIdLabel}</label>
			<input type="text" name="tax_id" id="inputTaxId" class="form-control" value="{$contactTaxId}" />
        </div>
		{/if}
	</div>
	
	<h4>{$LANG.subaccountactivate}</h4>
	
     <div class="form-group">
         <div class="controls checkbox">
             <label><input type="checkbox" name="subaccount" id="inputSubaccountActivate"{if $subaccount} checked{/if} /> {$LANG.subaccountactivatedesc}</label>
         </div>
      </div>

    <div id="subacct-container" class="TM-card{if !$subaccount} hidden{/if}">
		<h4>{$LANG.subaccountpermissions}</h4>
          
		<button type="button" class="btn btn-sm btn-primary btn-check-all" data-checkbox-container="contactPermissions" data-btn-check-toggle="1" id="btnSelectAll-contactPermissions" data-label-text-select="{lang key='checkAll'}" data-label-text-deselect="{lang key='uncheckAll'}">
            {lang key='checkAll'}
        </button>
		  
        <div class="form-group">
            <label class="full control-label"></label>
             <div class="checkbox clearfix" id="contactPermissions">
                {foreach $allPermissions as $permission}
                    <div class="col-sm-6">
                        <label>
                            <input type="checkbox" name="permissions[]" value="{$permission}"{if in_array($permission, $permissions)} checked{/if} />
                            <span>
                                {assign var='langPermission' value='subaccountperms'|cat:$permission}{$LANG.$langPermission}
                            </span>
                        </label>
                    </div>
                {/foreach}
            </div>
        </div>
        <div class="form-group">
			<div class="row">
				<div class="col-sm-9">
					<div id="newPassword1" class="form-group has-feedback">
						<label for="inputNewPassword1">{$LANG.newpassword}</label>
						<input type="password" class="form-control" id="inputNewPassword1" name="password" autocomplete="off" />
						<span class="form-control-feedback glyphicon"></span>
						{include file="$template/includes/pwstrength.tpl" noDisable=true}
					</div>
				</div>
                <div class="col-sm-3">
					<div class="form-group">
					<label>&nbsp;</label>
						<button type="button" class="btn btn-default form-control generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
							{$LANG.generatePassword.btnLabel}
						</button>
					</div>
                </div>
			</div>
			<div class="row">
				<div class="col-sm-9">
					<div id="newPassword2" class="form-group has-feedback">
						<label for="inputNewPassword2">{$LANG.confirmnewpassword}</label>
						<input type="password" class="form-control" id="inputNewPassword2" name="password2" autocomplete="off" />
						<span class="form-control-feedback glyphicon"></span>
						<div id="inputNewPassword2Msg">
						</div>
					</div>
				</div>
			</div>
		</div>
		
    </div>

	<div class="TM-card">
		<div class="form-group">
			<label class="control-label">{$LANG.clientareacontactsemails}</label>
			<div class="controls checkbox">
				<label>
					<input type="checkbox" name="generalemails" id="generalemails" value="1"{if $generalemails} checked{/if} />
					{$LANG.clientareacontactsemailsgeneral}
				</label>
				<br />
				<label>
					<input type="checkbox" name="productemails" id="productemails" value="1"{if $productemails} checked{/if} />
					{$LANG.clientareacontactsemailsproduct}
				</label>
				<br />
				<label>
					<input type="checkbox" name="domainemails" id="domainemails" value="1"{if $domainemails} checked{/if} />
					{$LANG.clientareacontactsemailsdomain}
				</label>
				<br />
				<label>
					<input type="checkbox" name="invoiceemails" id="invoiceemails" value="1"{if $invoiceemails} checked{/if} />
					{$LANG.clientareacontactsemailsinvoice}
				</label>
				<br />
				<label>
					<input type="checkbox" name="supportemails" id="supportemails" value="1"{if $supportemails} checked{/if} />
					{$LANG.clientareacontactsemailssupport}
				</label>
			</div>
		</div>
	</div>

    <div class="form-actions">
        <input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
        <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
    </div>

</form>

