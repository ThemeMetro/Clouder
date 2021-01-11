{include file="orderforms/{$carttpl}/common.tpl"}

<script>
var _localLang = {
    'addToCart': '{$LANG.orderForm.addToCart|escape}',
    'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
}
</script>

{if file_exists("templates/orderforms/{$carttpl}/layouts/head.tpl")}
	{include file="templates/orderforms/{$carttpl}/layouts/head.tpl"}
{/if}

<div id="order-standard_cart">

    <div class="row">

        <div class="col-md-12">
			{if file_exists("templates/orderforms/{$carttpl}/layouts/head.tpl")}
			{else}
            <div class="header-lined">
                <h1>{$LANG.cartdomainsconfig}</h1>
            </div>
			{/if}
			
			{* {include file="orderforms/{$carttpl}/sidebar-categories-collapsed.tpl"} *}

        </div>

        <div class="col-md-12">

            

            <form method="post" action="{$smarty.server.PHP_SELF}?a=confdomains" id="frmConfigureDomains">
                <input type="hidden" name="update" value="true" />

				{if file_exists("templates/orderforms/$carttpl/layouts/head.tpl")}
				{else}
				<h5 class="hidden-xs">{$LANG.orderForm.reviewDomainAndAddons}</h5>
				{/if}
				<p class="visible-xs">{$LANG.orderForm.reviewDomainAndAddons}</p>
				

                {if $errormessage}
                    <div class="alert alert-danger" role="alert">
                        <p>{$LANG.orderForm.correctErrors}:</p>
                        <ul>
                            {$errormessage}
                        </ul>
                    </div>
                {/if}

                {foreach $domains as $num => $domain}

                    <div class="sub-heading">
                        <span>{$domain.domain}</span>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group hidden-xs">
                                <label>{$LANG.orderregperiod}:</label>
                                {$domain.regperiod} {$LANG.orderyears} {if $domain.hosting}{else}<a href="cart.php" style="color:#cc0000;">[{$LANG.cartdomainsnohosting}]</a>{/if}
                            </div>
                            <div class="form-group visible-xs">
                                <label>{$LANG.orderregperiod}:</label>
                                {$domain.regperiod} {$LANG.orderyears}<br /> {if $domain.hosting}{else}<a href="cart.php" style="color:#cc0000;">[{$LANG.cartdomainsnohosting}]</a>{/if}
                            </div>
                        </div>
					</div>
					
					
					<div class="row">
                        {if $domain.eppenabled}
                            <div class="col-sm-12">
                                <div class="form-group prepend-icon">
                                    <input type="text" name="epp[{$num}]" id="inputEppcode{$num}" value="{$domain.eppvalue}" class="field" placeholder="{$LANG.domaineppcode}" />
                                    <label for="inputEppcode{$num}" class="field-icon">
                                        <i class="fas fa-lock"></i>
                                    </label>
                                    <span class="field-help-text">
                                        {$LANG.domaineppcodedesc}
                                    </span>
                                </div>
                            </div>
                        {/if}
                    </div>
					
                    {if $domain.dnsmanagement || $domain.emailforwarding || $domain.idprotection}
					
						<div class="row">
							<div class="col-md-12">
								<div class="row addon-products">

									{if $domain.dnsmanagement}
										<div class="col-sm-{math equation="12 / numAddons" numAddons=$domain.addonsCount}">
											<div class="panel panel-default panel-addon{if $domain.dnsmanagementselected} panel-addon-selected{/if}">
												<div class="panel-body">
													<input type="checkbox" name="dnsmanagement[{$num}]"{if $domain.dnsmanagementselected} checked{/if} />
													<span class="panel-addon-name">{$LANG.domaindnsmanagement}</span>
													<span class="panel-addon-price">{$domain.dnsmanagementprice} / {$domain.regperiod} {$LANG.orderyears}</span>
													<p>{$LANG.domainaddonsdnsmanagementinfo}</p>
												</div>
											</div>
										</div>
									{/if}

									{if $domain.idprotection}
										<div class="col-sm-{math equation="12 / numAddons" numAddons=$domain.addonsCount}">
											<div class="panel panel-default panel-addon{if $domain.idprotectionselected} panel-addon-selected{/if}">
												<div class="panel-body">
													<input type="checkbox" name="idprotection[{$num}]"{if $domain.idprotectionselected} checked{/if} />
													<span class="panel-addon-name">{$LANG.domainidprotection}</span>
													<span class="panel-addon-price">{$domain.idprotectionprice} / {$domain.regperiod} {$LANG.orderyears}</span>
													<p>{$LANG.domainaddonsidprotectioninfo}</p>
												</div>
											</div>
										</div>
									{/if}

									{if $domain.emailforwarding}
										<div class="col-sm-{math equation="12 / numAddons" numAddons=$domain.addonsCount}">
											<div class="panel panel-default panel-addon{if $domain.emailforwardingselected} panel-addon-selected{/if}">
												<div class="panel-body">
													<input type="checkbox" name="emailforwarding[{$num}]"{if $domain.emailforwardingselected} checked{/if} />
													<span class="panel-addon-name">{$LANG.domainemailforwarding}</span>
													<span class="panel-addon-price">{$domain.emailforwardingprice} / {$domain.regperiod} {$LANG.orderyears}</span>
													<p>{$LANG.domainaddonsemailforwardinginfo}</p>
												</div>
											</div>
										</div>
									{/if}

								</div>
							</div>
						</div>
                    {/if}
                    {foreach from=$domain.fields key=domainfieldname item=domainfield}
                        <div class="row">
                            <div class="col-sm-4">{$domainfieldname}:</div>
                            <div class="col-sm-8">{$domainfield}</div>
                        </div>
                    {/foreach}

                {/foreach}

                {if $atleastonenohosting}

                    <div class="sub-heading">
                        <span>{$LANG.domainnameservers}</span>
                    </div>

                    <p>{$LANG.cartnameserversdesc}</p>
					
					<div class="well">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label for="inputNs1">{$LANG.domainnameserver1}</label>
									<input type="text" class="form-control" id="inputNs1" name="domainns1" value="{$domainns1}" />
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="inputNs2">{$LANG.domainnameserver2}</label>
									<input type="text" class="form-control" id="inputNs2" name="domainns2" value="{$domainns2}" />
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="inputNs3">{$LANG.domainnameserver3}</label>
									<input type="text" class="form-control" id="inputNs3" name="domainns3" value="{$domainns3}" />
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="inputNs1">{$LANG.domainnameserver4}</label>
									<input type="text" class="form-control" id="inputNs4" name="domainns4" value="{$domainns4}" />
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="inputNs5">{$LANG.domainnameserver5}</label>
									<input type="text" class="form-control" id="inputNs5" name="domainns5" value="{$domainns5}" />
								</div>
							</div>
						</div>
					</div>

                {/if}

                <div class="text-center padding-all">
                    <button type="submit" class="btn btn-primary btn-lg">
                        {$LANG.continue}
                        &nbsp;<i class="fas fa-arrow-circle-right"></i>
                    </button>
                </div>

            </form>
        </div>
    </div>
</div>

{if file_exists("templates/orderforms/{$carttpl}/layouts/foot.tpl")}
	{include file="templates/orderforms/{$carttpl}/layouts/foot.tpl"}
{/if}
