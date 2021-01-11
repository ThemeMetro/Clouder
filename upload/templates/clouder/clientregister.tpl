{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{if in_array('state', $optionalFields)}
    <script>
        var statesTab = 10;
        var stateNotRequired = true;
    </script>
{/if}

<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    window.langPasswordStrength = "{$LANG.pwstrength}";
    window.langPasswordWeak = "{$LANG.pwstrengthweak}";
    window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
    window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
    jQuery(document).ready(function()
    {
        jQuery("#inputNewPassword1").keyup(registerFormPasswordStrengthFeedback);
    });
</script>
{if $registrationDisabled}
    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.registerCreateAccount|cat:' <strong><a href="cart.php" class="alert-link">'|cat:$LANG.registerCreateAccountOrder|cat:'</a></strong>'}
{/if}

{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

{if !$registrationDisabled}
<div id="registration">
    <form method="post" class="using-password-strength" action="{$smarty.server.PHP_SELF}" role="form" name="orderfrm" id="frmCheckout">
        <input type="hidden" name="register" value="true"/>

        <div id="containerNewUserSignup">

            {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"}

            <h4>{$LANG.orderForm.personalInformation}</h4>
			<div class="TM-card">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group prepend-icon">
							<label for="inputFirstName" class="field-icon">
								<i class="fa fa-user"></i>
							</label>
							<input type="text" name="firstname" id="inputFirstName" class="field form-control" placeholder="{$LANG.orderForm.firstName}" value="{$clientfirstname}" {if !in_array('firstname', $optionalFields)}required{/if} autofocus>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group prepend-icon">
							<label for="inputLastName" class="field-icon">
								<i class="fa fa-user"></i>
							</label>
							<input type="text" name="lastname" id="inputLastName" class="field form-control" placeholder="{$LANG.orderForm.lastName}" value="{$clientlastname}" {if !in_array('lastname', $optionalFields)}required{/if}>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group prepend-icon">
							<label for="inputEmail" class="field-icon">
								<i class="fa fa-envelope"></i>
							</label>
							<input type="email" name="email" id="inputEmail" class="field form-control" placeholder="{$LANG.orderForm.emailAddress}" value="{$clientemail}">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group prepend-icon">
							<label for="inputPhone" class="field-icon">
								<i class="fa fa-phone"></i>
							</label>
							<input type="tel" name="phonenumber" id="inputPhone" class="field" placeholder="{$LANG.orderForm.phoneNumber}" value="{$clientphonenumber}">
						</div>
					</div>
				</div>
			</div>

            <h4>{$LANG.orderForm.billingAddress}</h4>		
			<div class="TM-card">
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group prepend-icon">
							<label for="inputCompanyName" class="field-icon">
								<i class="fa fa-building"></i>
							</label>
							<input type="text" name="companyname" id="inputCompanyName" class="field" placeholder="{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})" value="{$clientcompanyname}">
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group prepend-icon">
							<label for="inputAddress1" class="field-icon">
								<i class="far fa-building"></i>
							</label>
							<input type="text" name="address1" id="inputAddress1" class="field form-control" placeholder="{$LANG.orderForm.streetAddress}" value="{$clientaddress1}"  {if !in_array('address1', $optionalFields)}required{/if}>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group prepend-icon">
							<label for="inputAddress2" class="field-icon">
								<i class="fa fa-map-marker"></i>
							</label>
							<input type="text" name="address2" id="inputAddress2" class="field" placeholder="{$LANG.orderForm.streetAddress2}" value="{$clientaddress2}">
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group prepend-icon">
							<label for="inputCity" class="field-icon">
								<i class="far fa-building"></i>
							</label>
							<input type="text" name="city" id="inputCity" class="field form-control" placeholder="{$LANG.orderForm.city}" value="{$clientcity}"  {if !in_array('city', $optionalFields)}required{/if}>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="form-group prepend-icon">
							<label for="state" class="field-icon" id="inputStateIcon">
								<i class="fa fa-map-signs"></i>
							</label>
							<label for="stateinput" class="field-icon" id="inputStateIcon">
								<i class="fa fa-map-signs"></i>
							</label>
							<input type="text" name="state" id="state" class="field form-control" placeholder="{$LANG.orderForm.state}" value="{$clientstate}"  {if !in_array('state', $optionalFields)}required{/if}>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-group prepend-icon">
							<label for="inputPostcode" class="field-icon">
								<i class="fa fa-certificate"></i>
							</label>
							<input type="text" name="postcode" id="inputPostcode" class="field form-control" placeholder="{$LANG.orderForm.postcode}" value="{$clientpostcode}" {if !in_array('postcode', $optionalFields)}required{/if}>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group prepend-icon">
							<label for="inputCountry" class="field-icon" id="inputCountryIcon">
								<i class="fa fa-globe"></i>
							</label>
							<select name="country" id="inputCountry" class="field form-control">
								{foreach $clientcountries as $countryCode => $countryName}
									<option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected"{/if}>
										{$countryName}
									</option>
								{/foreach}
							</select>
						</div>
					</div>
					{if $showTaxIdField}
						<div class="col-sm-12">
							<div class="form-group prepend-icon">
								<label for="inputTaxId" class="field-icon">
									<i class="fas fa-building"></i>
								</label>
								<input type="text" name="tax_id" id="inputTaxId" class="field" placeholder="{lang key=\WHMCS\Billing\Tax\Vat::getLabel()} ({$LANG.orderForm.optional})" value="{$clientTaxId}">
							</div>
						</div>
					{/if}
				</div>
			</div>
            {if $customfields || $currencies}
            <h4>{$LANG.orderadditionalrequiredinfo}</h4>
			<div class="TM-card">
				<div class="row">
					{if $customfields}
					{foreach $customfields as $customfield}
						<div class="col-sm-6">
							<div class="form-group">
								{if $customfield.type eq 'tickbox'}
									<label class=checkbox-inline" for="customfield{$customfield.id}">
										{$customfield.input}
										{$customfield.name}
									</lable>
									{if $customfield.description}<span class="field-help-text">{$customfield.description}</span>{/if}
								{else}
									<label for="customfield{$customfield.id}">{$customfield.name}</label>
									{if $customfield.type eq "link"}
										<div class="input-group">
											<span class="input-group-addon" id="customfield{$customfield.id}"><i class="fas fa-link"></i></span>
											{$customfield.input}
										</div>
									{else}
									{$customfield.input}
									{/if}
									{if $customfield.description}<span class="field-help-text">{$customfield.description}</span>{/if}
								{/if}
							</div>
						</div>
					{/foreach}
					{/if}
					{if $customfields && count($customfields)%2 > 0 }
						<div class="clearfix"></div>
					{/if}
					{if $currencies}
					<div class="col-sm-6">
						<div class="form-group prepend-icon">
							<label for="inputCurrency" class="field-icon">
								<i class="far fa-money-bill-alt"></i>
							</label>
							<select id="inputCurrency" name="currency" class="field form-control">
								{foreach from=$currencies item=curr}
									<option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
								{/foreach}
							</select>
						</div>
					</div>
					{/if}
				</div>
			</div>
			{/if}
        </div>
        
        <div id="containerNewUserSecurity" {if $remote_auth_prelinked && !$securityquestions } class="hidden"{/if}>

            <h4>{$LANG.orderForm.accountSecurity}</h4>
			<div class="TM-card">
				<div id="containerPassword" class="row{if $remote_auth_prelinked && $securityquestions} hidden{/if}">
					<div id="passwdFeedback" style="display: none;" class="alert alert-info text-center col-sm-12"></div>
					<div class="col-sm-6">
						<div class="form-group prepend-icon">
							<label for="inputNewPassword1" class="field-icon">
								<i class="fa fa-lock"></i>
							</label>
							<input type="password" name="password" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="field" placeholder="{$LANG.clientareapassword}" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group prepend-icon">
							<label for="inputNewPassword2" class="field-icon">
								<i class="fa fa-lock"></i>
							</label>
							<input type="password" name="password2" id="inputNewPassword2" class="field" placeholder="{$LANG.clientareaconfirmpassword}" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<button type="button" class="btn btn-default btn-sm btn-xs-block generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
								{$LANG.generatePassword.btnLabel}
							</button>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="password-strength-meter">
							<div class="progress">
								<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
								</div>
							</div>
							<p class="text-center small text-muted" id="passwordStrengthTextLabel">{$LANG.pwstrength}: {$LANG.pwstrengthenter}</p>
						</div>
					</div>
				</div>
			</div>
			
			{if $securityquestions}
			<div class="TM-card">
				<div class="row">
					<div class="form-group col-sm-12">
						<select name="securityqid" id="inputSecurityQId" class="field form-control">
							<option value="">{$LANG.clientareasecurityquestion}</option>
							{foreach $securityquestions as $question}
								<option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
									{$question.question}
								</option>
							{/foreach}
						</select>
					</div>
					<div class="col-sm-6">
						<div class="form-group prepend-icon">
							<label for="inputSecurityQAns" class="field-icon">
								<i class="fa fa-lock"></i>
							</label>
							<input type="password" name="securityqans" id="inputSecurityQAns" class="field form-control" placeholder="{$LANG.clientareasecurityanswer}" autocomplete="off">
						</div>
					</div>
				</div>
			</div>
			{/if}
        </div>
		
		{if $showMarketingEmailOptIn}
			<h4>{lang key='emailMarketing.joinOurMailingList'}</h4>
			<div class="TM-card">
				<p>{$marketingEmailOptInMessage}</p>
				<div class="panel panel-switch {if $marketingEmailOptIn} checked{/if}">
					<div class="panel-body">
						<span class="switch-label">{lang key='emailMarketing.joinOurMailingList'}: </span>
						<label class="switch switch--text">
							<input class="switch__checkbox" type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if}>
							<span class="switch__container"><span class="switch__handle"></span></span>
						</label> 
					</div>
				</div>
			</div>
		{/if}

        {include file="$template/includes/captcha.tpl"}

        <br/>
        {if $accepttos}
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default tospanel">
                        <div class="panel-heading">
                            <h3 class="panel-title"><span class="fa fa-exclamation-triangle tosicon"></span> &nbsp; {$LANG.ordertos}</h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-12">
                                <label class="checkbox">
                                    <input type="checkbox" name="accepttos" class="accepttos">
                                    {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
        <div class="form-actions">
            <input class="btn btn-lg btn-primary{$captcha->getButtonClass($captchaForm)}" type="submit" value="{$LANG.clientregistertitle}"/>
        </div>
    </form>
</div>
{/if}
