{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{if $contactid}

    {if $successful}
        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
    {/if}

    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}

    <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

	<h4>{$LANG.clientareachoosecontact}</h4>
    <form  role="form" method="post" action="{$smarty.server.PHP_SELF}?action=contacts">
		<div class="TM-card">
			<div class="row">
				<div class="col-sm-6">
					<select name="contactid" id="inputContactId" onchange="submit()" class="form-control">
						{foreach item=contact from=$contacts}
							<option value="{$contact.id}"{if $contact.id eq $contactid} selected="selected"{/if}>{$contact.name} - {$contact.email}</option>
						{/foreach}
						<option value="new">{$LANG.clientareanavaddcontact}</option>
					</select>
				</div>
			</div>
		</div>
       </form>
		

    <form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=contacts&id={$contactid}">
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
				<div class="form-group">
					<label for="inputTaxId" class="control-label">{lang key=$taxIdLabel}</label>
					 <input type="text" name="tax_id" id="inputTaxId" class="form-control" value="{$contactTaxId}" />
				</div>
			</div>
	
			<h4>{$LANG.subaccountactivate}</h4>
			
			<div class="form-group">
				<div class="controls checkbox">
					<label>
						<input type="checkbox" name="subaccount" id="inputSubaccountActivate"{if $subaccount} checked{/if} /> {$LANG.subaccountactivatedesc}
					</label>
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
            {if $hasLinkedProvidersEnabled}
				<h5 class="bolder heading">Linked Accounts</h5>
				<div class="TM-card">
					{include file="$template/includes/linkedaccounts.tpl" linkContext="linktable" }
				</div>
            {/if}
        </div>
	
		<div class="TM-card">
			<div class="form-group">
				<label class="control-label">{$LANG.clientareacontactsemails}</label>
				<div class="controls checkbox">
					{foreach $emailPreferences as $emailType => $value}
						<label>
						<input type="hidden" name="email_preferences[{$emailType}]" value="0">
						<input type="checkbox" name="email_preferences[{$emailType}]" id="{$emailType}emails" value="1"{if $value} checked="checked"{/if} />
						{lang key="clientareacontactsemails"|cat:$emailType}
						</label>{if !($emailType@last)}<br />{/if}
					{/foreach}
				</div>
			</div>
		</div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
            <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
            <a class="btn btn-danger" data-toggle="confirmation" data-btn-ok-label="{lang key='yes'}" data-btn-ok-icon="fa fa-check" data-btn-ok-class="btn-success" data-btn-cancel-label="{lang key='no'}" data-btn-cancel-icon="fa fa-ban" data-btn-cancel-class="btn-default" data-title="{lang key='clientareadeletecontact'}" data-content="{lang key='clientareadeletecontactareyousure'}" data-popout="true" href="clientarea.php?action=contacts&delete=true&id={$contactid}&token={$token}">{lang key='clientareadeletecontact'}</a>
        </div>

    </form>
{else}

    {include file="$template/clientareaaddcontact.tpl"}

{/if}

<script>
    jQuery(document).ready( function ()
    {
        WHMCS.form.register();
        jQuery('.removeAccountLink').click(function (e) {
            e.preventDefault();
            var authUserID = jQuery(this).data('authid');
            swal(
                {
                    title: "Are you sure?",
                    text: "This permanently unlinks the authorized account.",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes, unlink it!",
                    closeOnConfirm: false
                },
                function(){
                    WHMCS.http.jqClient.post('{routePath('auth-manage-client-delete')}' + authUserID,
                        {
                            'token': '" . generate_token("plain") . "'
                        }).done(function(data) {
                        if (data.status == 'success') {
                            jQuery('#remoteAuth' + authUserID).remove();
                            swal("Unlinked!", data.message, "success");
                        } else {
                            swal("Error!", data.message, "error");
                        }
                    });
                });
        });
    });
</script>
