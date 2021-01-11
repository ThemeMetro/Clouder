{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{if $overdueinvoice}
    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.upgradeerroroverdueinvoice}
{elseif $existingupgradeinvoice}
    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.upgradeexistingupgradeinvoice}
{elseif $upgradenotavailable}
    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.upgradeNotPossible textcenter=true}
{/if}

{if $overdueinvoice}



{elseif $existingupgradeinvoice}

    <p>
        <a href="submitticket.php" class="btn btn-default btn-lg">{$LANG.submitticketdescription}</a>
    </p>

{elseif $upgradenotavailable}

    <p>
        <a href="submitticket.php" class="btn btn-default btn-lg">{$LANG.submitticketdescription}</a>
    </p>

{else}

    {if $type eq "package"}
		<div class="section">
			<div class="section-header">
				<h3>{$LANG.upgradecurrentconfig}:</h3>
			</div>
			<div class="section-body">
				<div class="panel panel-default">
					<div class="panel-body">
						<strong>{$groupname} - {$productname}</strong> {if $domain} ({$domain}){/if}
					</div>
				</div>
			</div>
		</div>
		
		<div class="section">
			<div class="section-header">
				<h3>{$LANG.upgradenewconfig}:</h3>
				<p class="desc">{$LANG.upgradechoosepackage}</p>
			</div>
			<div class="section-body">
				<div class="row row row-eq-height">
					{foreach key=num item=upgradepackage from=$upgradepackages}
						<div class="col-md-4">
							<div class="TM-card pricing-tables small-padding">
								<form method="post" action="{$smarty.server.PHP_SELF}">
									<input type="hidden" name="step" value="2">
									<input type="hidden" name="type" value="{$type}">
									<input type="hidden" name="id" value="{$id}">
									<input type="hidden" name="pid" value="{$upgradepackage.pid}">
									
									<h4 class="product-name">{$upgradepackage.groupname} - {$upgradepackage.name}</h4>
										
									<div class="product-content">
										<ul class="product-features list-unstyled">
											<li>
												{$upgradepackage.description|replace:"<br/>":"</li>"}
											</li>
										</ul>
										<div class="form-group">
											{if $upgradepackage.pricing.type eq "free"}
												{$LANG.orderfree}<br />
												<input type="hidden" name="billingcycle" value="free">
												{elseif $upgradepackage.pricing.type eq "onetime"}
												{$upgradepackage.pricing.onetime} {$LANG.orderpaymenttermonetime}
												<input type="hidden" name="billingcycle" value="onetime">
											{elseif $upgradepackage.pricing.type eq "recurring"}
												<select name="billingcycle" class="form-control">
													{if $upgradepackage.pricing.monthly}<option value="monthly">{$upgradepackage.pricing.monthly}</option>{/if}
													{if $upgradepackage.pricing.quarterly}<option value="quarterly">{$upgradepackage.pricing.quarterly}</option>{/if}
													{if $upgradepackage.pricing.semiannually}<option value="semiannually">{$upgradepackage.pricing.semiannually}</option>{/if}
													{if $upgradepackage.pricing.annually}<option value="annually">{$upgradepackage.pricing.annually}</option>{/if}
													{if $upgradepackage.pricing.biennially}<option value="biennially">{$upgradepackage.pricing.biennially}</option>{/if}
													{if $upgradepackage.pricing.triennially}<option value="triennially">{$upgradepackage.pricing.triennially}</option>{/if}
												</select>
											{/if}
										</div>
									</div>
									<div class="product-footer">
										 <input type="submit" value="{$LANG.upgradedowngradechooseproduct}" class="btn btn-block btn-primary" />                                        
									</div>
								</form>
							</div>
						</div>
					{/foreach}
				</div>
			</div>
		</div>

    {elseif $type eq "configoptions"}
        <p>{$LANG.upgradechooseconfigoptions}</p>
        {if $errormessage}
            {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
        {/if}
        <form method="post" action="{$smarty.server.PHP_SELF}">
            <input type="hidden" name="step" value="2" />
            <input type="hidden" name="type" value="{$type}" />
            <input type="hidden" name="id" value="{$id}" />

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th></th>
                        <th>{$LANG.upgradecurrentconfig}</th>
                        <th></th>
                        <th>{$LANG.upgradenewconfig}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach key=num item=configoption from=$configoptions}
                        <tr>
                            <td>{$configoption.optionname}</td>
                            <td>
                                {if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
                                    {$configoption.selectedname}
                                {elseif $configoption.optiontype eq 3}
                                    {if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}
                                {elseif $configoption.optiontype eq 4}
                                    {$configoption.selectedqty} x {$configoption.options.0.name}
                                {/if}
                            </td>
                            <td>=></td>
                            <td>
                                {if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
                                    <select name="configoption[{$configoption.id}]">
                                        {foreach key=num item=option from=$configoption.options}
                                            {if $option.selected}<option value="{$option.id}" selected>{$LANG.upgradenochange}</option>{else}<option value="{$option.id}">{$option.nameonly} {$option.price}{/if}</option>
                                        {/foreach}
                                    </select>
                                {elseif $configoption.optiontype eq 3}
                                    <input type="checkbox" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked{/if}> {$configoption.options.0.name}
                                {elseif $configoption.optiontype eq 4}
                                    <input type="text" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}" size="5"> x {$configoption.options.0.name}
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>

            <p class="text-center">
                <input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-primary" />
            </p>

        </form>
    {/if}
{/if}
