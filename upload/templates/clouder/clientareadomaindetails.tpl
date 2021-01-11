{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

{if $registrarcustombuttonresult=="success"}
    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.moduleactionsuccess textcenter=true}
{elseif $registrarcustombuttonresult}
    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.moduleactionfailed textcenter=true}
{/if}

{if $unpaidInvoice}
    <div class="alert alert-{if $unpaidInvoiceOverdue}danger{else}warning{/if}" id="alert{if $unpaidInvoiceOverdue}Overdue{else}Unpaid{/if}Invoice">
        <div class="pull-right">
            <a href="viewinvoice.php?id={$unpaidInvoice}" class="btn btn-xs btn-default">
                {lang key='payInvoice'}
            </a>
        </div>
        {$unpaidInvoiceMessage}
    </div>
{/if}

<div class="tab-content margin-bottom">
    <div class="tab-pane fade in active" id="tabOverview">
	
        {if $alerts}
            {foreach $alerts as $alert}
                {include file="$template/includes/alert.tpl" type=$alert.type msg="<strong>{$alert.title}</strong><br>{$alert.description}" textcenter=true}
            {/foreach}
        {/if}

        {if $systemStatus != 'Active'}
            <div class="alert alert-warning text-center" role="alert">
                {$LANG.domainCannotBeManagedUnlessActive}
            </div>
        {/if}

        <h3>{$LANG.overview}</h3>

        {if $lockstatus eq "unlocked"}
            {capture name="domainUnlockedMsg"}<strong>{$LANG.domaincurrentlyunlocked}</strong><br />{$LANG.domaincurrentlyunlockedexp}{/capture}
            {include file="$template/includes/alert.tpl" type="error" msg=$smarty.capture.domainUnlockedMsg}
        {/if}
		
		<div class="product-details">
			<div class="row row-eq-height row-eq-height-sm">
				<div class="col-sm-6">
					<div class="product-holder">
						<div class="product-content">
							<div class="product-image">
								<span class="fa-stack">
									<i class="fas fa-circle fa-stack-2x"></i>
									<i class="fas fa-globe fa-stack-1x fa-inverse"></i>
								</span>
							</div>
							<h4><a href="http://{$domain}" target="_blank">{$domain}</a></h4>
							
							<div class="status-sticker-wrapper">
								<div class="status-sticker product-status-{$rawstatus|strtolower}">
									{$status}
								</div>
							</div>							
						</div>
						{if $sslStatus}
							<div class="product-footer">
								{if $sslStatus->isInactive()}
									<div class="{if $sslStatus->isInactive()}ssl-inactive{/if}">
										<ul class="list-unstyled list-inline">
											<li><img src="{$sslStatus->getImagePath()}" width="16"> {$sslStatus->getStatusDisplayLabel()} {if $sslStatus->isActive()} {/if}</li>
										</ul>
									</div>
								{/if}
								{if $sslStatus->isActive() || $sslStatus->needsResync()}
									<button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#sslInfo"><i class="far fa-info-square"></i> {if !$sslStatus->needsResync()}{$sslStatus->getStatusDisplayLabel()}{else}{$LANG.loading}{/if}</button>
								{/if}
							</div>
						{/if}
					</div>
				</div>
				<div class="col-sm-6">
					<div class="product-info">
						<ul class="list-info list-v">
							<li>
								<span class="list-heading">{$LANG.clientareahostingregdate}</span>
								<span class="list-text">{$registrationdate}</span>
							</li>
							<li>							
								<span class="list-heading">{$LANG.clientareahostingnextduedate}</span>
								<span class="list-text">{$nextduedate}</span>
							</li>
							<li>
								<span class="list-heading">{$LANG.firstpaymentamount}</span>
								<span class="list-text">{$firstpaymentamount}</span>
							</li>
							<li>							
								<span class="list-heading">{$LANG.recurringamount}</span>
								<span class="list-text">{$recurringamount} {$LANG.every} {$registrationperiod} {$LANG.orderyears}</span>
							</li>
							<li>
								 <span class="list-heading">{$LANG.orderpaymentmethod}:</span>
								 <span class="list-text">{$paymentmethod}</span>
							 </li>
						 </ul>
					</div>
				</div>
			</div>
		</div>
        {if $registrarclientarea}
            <div class="moduleoutput">
                {$registrarclientarea|replace:'modulebutton':'btn'}
            </div>
        {/if}

        {foreach $hookOutput as $output}
            <div>
                {$output}
            </div>
        {/foreach}

        <br />

        {if $canDomainBeManaged
            and (
                $managementoptions.nameservers or
                $managementoptions.contacts or
                $managementoptions.locking or
                $renew)}
                {* No reason to show this section if nothing can be done here! *}

            <h4>{$LANG.doToday}</h4>

            <ul>
                {if $systemStatus == 'Active' && $managementoptions.nameservers}
                    <li>
                        <a class="tabControlLink" data-toggle="tab" href="#tabNameservers">
                            {$LANG.changeDomainNS}
                        </a>
                    </li>
                {/if}
                {if $systemStatus == 'Active' && $managementoptions.contacts}
                    <li>
                        <a href="clientarea.php?action=domaincontacts&domainid={$domainid}">
                            {$LANG.updateWhoisContact}
                        </a>
                    </li>
                {/if}
                {if $systemStatus == 'Active' && $managementoptions.locking}
                    <li>
                        <a class="tabControlLink" data-toggle="tab" href="#tabReglock">
                            {$LANG.changeRegLock}
                        </a>
                    </li>
                {/if}
                {if $renew}
                    <li>
                        <a href="{routePath('domain-renewal', $domain)}">
                            {$LANG.renewYourDomain}
                        </a>
                    </li>
                {/if}
            </ul>

        {/if}
		
		{if $sslStatus}
			{if $sslStatus->isActive() || $sslStatus->needsResync()}
			<div class="modal fade" id="sslInfo"  tabindex="-1" role="dialog" aria-labelledby="sslInfoModalLabel">
			  <div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<ul class="list-info list-v">
							<li>
								<span class="list-heading"><strong>{$LANG.sslState.startDate}:</strong></span>
								<span class="list-text"> {if !$sslStatus->needsResync() || $sslStatus->startDate}{$sslStatus->startDate->toClientDateFormat()}{else}{$LANG.loading}{/if}</span>
							</li>
							<li>
								<span class="list-heading"><strong>{$LANG.sslState.issuerName}:</strong></span>
								<span class="list-text">{if !$sslStatus->needsResync() || $sslStatus->issuerName}{$sslStatus->issuerName}{else}{$LANG.loading}{/if}<</span>
							</li>
							<li>
								<span class="list-heading"><strong>{$LANG.sslState.expiryDate}:</strong></span>
								<span class="list-text"> {if !$sslStatus->needsResync() || $sslStatus->expiryDate}{$sslStatus->expiryDate->toClientDateFormat()}{else}{$LANG.loading}{/if}<</span>
							</li>
						</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fas fa-times"></i></button>
					</div>
				</div>
			  </div>
			</div>
			{/if}
		{/if}

    </div>
    <div class="tab-pane fade" id="tabAutorenew">
		<div class="section">
			<div class="section-header">
				<h3>{$LANG.domainsautorenew}</h3>
				<p class="desc">{$LANG.domainrenewexp}</p>
			</div>
			
			<div class="section-body">
				{if $changeAutoRenewStatusSuccessful}
					{include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully}
				{/if}

				<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabAutorenew">
					<input type="hidden" name="id" value="{$domainid}">
					<input type="hidden" name="sub" value="autorenew" />
					<button class="panel panel-switch{if $autorenew} checked{/if}" type="submit">
						<div class="panel-body"> 
							<span class="switch-label">{$LANG.domainautorenewstatus}: </span>   
							{if $autorenew}
								<input type="hidden" name="autorenew" value="disable">
							{else}
								<input type="hidden" name="autorenew" value="enable">
							{/if}     
							<label class="switch switch--text">
								<input class="switch__checkbox" type="checkbox" {if $autorenew}checked{/if}>
								<span class="switch__container"><span class="switch__handle"></span></span>
							</label>    
						</div>
                         <div class="loader loader-panel">
                            {include file="$template/includes/loader.tpl"}    
                         </div>
					</button>
				</form>
			</div>
		</div>
    </div>
	
    <div class="tab-pane fade" id="tabNameservers">
        <h3>{$LANG.domainnameservers}</h3>
		<p class="desc">{$LANG.domainnsexp}</p>
		
        {if $nameservererror}
            {include file="$template/includes/alert.tpl" type="error" msg=$nameservererror textcenter=true}
        {/if}
        {if $subaction eq "savens"}
            {if $updatesuccess}
                {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
            {elseif $error}
                {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
            {/if}
        {/if}

        <form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabNameservers">
            <input type="hidden" name="id" value="{$domainid}" />
            <input type="hidden" name="sub" value="savens" />
            <div class="radio">
                <label>
                    <input type="radio" name="nschoice" value="default" onclick="disableFields('domnsinputs',true)"{if $defaultns} checked{/if} /><span class="labels"> {$LANG.nschoicedefault}</span>
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="nschoice" value="custom" onclick="disableFields('domnsinputs',false)"{if !$defaultns} checked{/if} /><span class="labels"> {$LANG.nschoicecustom}</span>
                </label>
            </div>
            <br />
            {for $num=1 to 5}
				<div class="TM-card">
					<div class="form-group">
						<label for="inputNs{$num}" class="control-label">{$LANG.clientareanameserver} {$num}</label>
						<input type="text" name="ns{$num}" class="form-control domnsinputs" id="inputNs{$num}" value="{$nameservers[$num].value}" />
					</div>
				</div>
            {/for}
           <div class="form-actions">
                <input type="submit" class="btn btn-primary" value="{$LANG.changenameservers}" />
            </div>
        </form>

    </div>
    <div class="tab-pane fade" id="tabReglock">		
		<div class="section">
			<div class="section-header">
				<h3>{$LANG.domainregistrarlock}</h3>
				<p class="desc">{$LANG.domainlockingexp}</p>
			</div>
			<div class="section-body">
				{if $subaction eq "savereglock"}
					{if $updatesuccess}
						{include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully}
					{elseif $error}
						{include file="$template/includes/alert.tpl" type="error" msg=$error}
					{/if}
				{/if}
				<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabReglock">
					<input type="hidden" name="id" value="{$domainid}">
					<input type="hidden" name="sub" value="savereglock" />
					<button class="panel panel-switch{if $lockstatus=="locked"} checked{/if}" type="submit">
						<div class="panel-body"> 
							<span class="switch-label">{$LANG.domainreglockstatus}: </span>   
							{if $lockstatus=="locked"}
							{else}
								<input type="hidden" name="autorenew" value="enable">
							{/if}     
							<label class="switch switch--text">
								<input class="switch__checkbox" name="reglock" type="checkbox" {if $lockstatus=="locked"}checked{/if}>
								<span class="switch__container"><span class="switch__handle"></span></span>
							</label>    
						</div>
						<div class="loader loader-panel">
						 {include file="$template/includes/loader.tpl"}    
						</div>
					</button>
				</form>
			</div>
		</div>
    </div>
    <div class="tab-pane fade" id="tabRelease">
		<div class="section">
			<div class="section-header">
				<h3>{$LANG.domainrelease}</h3>
				<p class="desc">{$LANG.domainreleasedescription}</p>
			</div>
			<div class="section-body">
				<form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails">
					<input type="hidden" name="sub" value="releasedomain">
					<input type="hidden" name="id" value="{$domainid}">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="form-group">
								<label for="inputReleaseTag" class="control-label">{$LANG.domainreleasetag}</label>
								<input type="text" class="form-control" id="inputReleaseTag" name="transtag" />
							</div>
						</div>
						<div class="panel-footer">
							<input type="submit" value="{$LANG.domainrelease}" class="btn btn-primary" />
						</div>
					</div>
				</form>
			</div>    
		</div>
    </div>
    <div class="tab-pane fade" id="tabAddons">
		<div class="section">
			<div class="section-header">
				<h3>{$LANG.domainaddons}</h3>
				<p class="desc">{$LANG.domainaddonsinfo}</p>
			</div>
			<div class="section-body">
				<div class="row">
					{if $addons.idprotection}
						<div class="col-md-6">
							<div class="TM-card pricing-tables text-center">
								<div class="icon">
									<i class="fas fa-shield-alt fa-4x"></i>
								</div>
								
								<h4>{$LANG.domainidprotection}</h4>
								<p class="desc">{$LANG.domainaddonsidprotectioninfo}</p>
								<form action="clientarea.php?action=domainaddons" method="post">
									<input type="hidden" name="id" value="{$domainid}"/>
									{if $addonstatus.idprotection}
										<input type="hidden" name="disable" value="idprotect"/>
										<input type="submit" value="{$LANG.disable}" class="btn btn-default" />
									{else}
										<input type="hidden" name="buy" value="idprotect"/>
										<input type="submit" value="{$LANG.domainaddonsbuynow} {$addonspricing.idprotection}" class="btn btn-primary" />
									{/if}
								</form>
							</div>
						</div>
					{/if}
					{if $addons.dnsmanagement}
						<div class="col-md-6">
							<div class="TM-card pricing-tables text-center">
								<div class="icon">
									<i class="fas fa-cloud fa-4x"></i>
								</div>
								<h4>{$LANG.domainaddonsdnsmanagement}</h4>
								<p class="desc">{$LANG.domainaddonsdnsmanagementinfo}</p>
								<form action="clientarea.php?action=domainaddons" method="post">
									<input type="hidden" name="id" value="{$domainid}"/>
									{if $addonstatus.dnsmanagement}
										<input type="hidden" name="disable" value="dnsmanagement"/>
										<a class="btn btn-primary" href="clientarea.php?action=domaindns&domainid={$domainid}">{$LANG.manage}</a> <input type="submit" value="{$LANG.disable}" class="btn btn-default" />
									{else}
										<input type="hidden" name="buy" value="dnsmanagement"/>
										<input type="submit" value="{$LANG.domainaddonsbuynow} {$addonspricing.dnsmanagement}" class="btn btn-primary "/>
									{/if}
								</form>
							</div>
						</div>
					{/if}
					{if $addons.emailforwarding}
						<div class="col-md-6">
							<div class="TM-card pricing-tables text-center">
								<div class="icon">
									<i class="fas fa-envelope fa-4x">&nbsp;</i><i class="fas fa-share fa-2x"></i>
								</div>
								<h4>{$LANG.domainemailforwarding}</h4>
								<p class="desc">{$LANG.domainaddonsemailforwardinginfo}</p>
								<form action="clientarea.php?action=domainaddons" method="post">
									<input type="hidden" name="id" value="{$domainid}"/>
									{if $addonstatus.emailforwarding}
										<input type="hidden" name="disable" value="emailfwd"/>
										<a class="btn btn-success" href="clientarea.php?action=domainemailforwarding&domainid={$domainid}">{$LANG.manage}</a> <input type="submit" value="{$LANG.disable}" class="btn btn-default" />
									{else}
										<input type="hidden" name="buy" value="emailfwd"/>
										<input type="submit" value="{$LANG.domainaddonsbuynow} {$addonspricing.emailforwarding}" class="btn btn-primary" />
									{/if}
								</form>
							</div>
						</div>
					{/if}
				</div>
			</div>
		</div>
    </div>
</div>