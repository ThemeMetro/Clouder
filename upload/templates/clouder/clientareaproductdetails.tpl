{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

{if $modulecustombuttonresult}
    {if $modulecustombuttonresult == "success"}
        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.moduleactionsuccess textcenter=true idname="alertModuleCustomButtonSuccess"}
    {else}
         {include file="$template/includes/alert.tpl" type="error" msg=$LANG.moduleactionfailed|cat:' ':$modulecustombuttonresult textcenter=true idname="alertModuleCustomButtonFailed"}
    {/if}
{/if}

{if $pendingcancellation}
    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.cancellationrequestedexplanation textcenter=true idname="alertPendingCancellation"}
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

        {if $tplOverviewTabOutput}
			{$tplOverviewTabOutput}
        {else}

		
		
		
		
		
		
			<div>
				<div class="product-details">
					<div class="row row-eq-height row-eq-height-sm">
						<div class="col-sm-6">
							<div class="product-holder product-status-{$rawstatus|strtolower}">
								<div class="product-content">
									<div class="product-image">
										<span class="fa-stack">
											<i class="fas fa-circle fa-stack-2x"></i>
											<i class="fas fa-{if $type eq "hostingaccount" || $type == "reselleraccount"}hdd{elseif $type eq "server"}database{else}archive{/if} fa-stack-1x fa-inverse"></i>
										</span>
									</div>
									<h4><small>{$groupname}</small> - {$product}</h4>
									
									<div class="status-sticker-wrapper">
										<div class="status-sticker product-status-{$rawstatus|strtolower}">
											{$status}
										</div>
									</div>
								</div> 
                                
                                {if $domain && $sslStatus}
									<div class="product-footer">
										{if $sslStatus->isInactive()}
											<div class="{if $sslStatus->isInactive()}ssl-inactive{/if}">
												<ul class="list-unstyled list-inline">
													<li><img src="{$sslStatus->getImagePath()}" width="16"> {$sslStatus->getStatusDisplayLabel()}</li>
												</ul>
											</div>
										{/if}
										{if $sslStatus->isActive() || $sslStatus->needsResync()}
											<button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#sslInfo"><i class="far fa-info-square"></i> {if !$sslStatus->needsResync()}{$sslStatus->getStatusDisplayLabel()}{else}{$LANG.loading}{/if}</button>
											
											<div class="modal fade" id="sslInfo" tabindex="-1" role="dialog" aria-labelledby="sslInfoModalLabel">
											  <div class="modal-dialog modal-sm" role="document">
												<div class="modal-content">
													<div class="modal-body">
														<ul class="list-info list-v">
															<li>
																<span class="list-heading"><strong>{$LANG.sslState.startDate}</strong>:</span>
																<span class="list-text">{if !$sslStatus->needsResync() || $sslStatus->startDate}{$sslStatus->startDate->toClientDateFormat()}{else}{$LANG.loading}{/if}</span>
															</li>
															<li>
																<span class="list-heading"><strong>{$LANG.sslState.expiryDate}</strong>:</span>
																<span class="list-text"> {if !$sslStatus->needsResync() || $sslStatus->expiryDate}{$sslStatus->expiryDate->toClientDateFormat()}{else}{$LANG.loading}{/if}</span>
															</li>
															<li>
																<span class="list-heading"><strong>{$LANG.sslState.issuerName}</strong>:</span>
																<span class="list-text">{if !$sslStatus->needsResync() || $sslStatus->issuerName}{$sslStatus->issuerName}{else}{$LANG.loading}{/if}</span>
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
									</div>
                                {/if}
							</div>
						</div>
						<div class="col-sm-6">
							<div class="product-info">
								<ul class="list-info list-v">
									<li>
										<span class="list-heading">{$LANG.clientareahostingregdate}</span>
										<span class="list-text">{$regdate}</span>
									</li>
									{if $firstpaymentamount neq $recurringamount}
										<li>
											<span class="list-heading">{$LANG.firstpaymentamount}</span>
											<span class="list-text">{$firstpaymentamount}</span>
											
										</li>
									{/if}
									{if $billingcycle != $LANG.orderpaymenttermonetime && $billingcycle != $LANG.orderfree}
										<li>
											<span class="list-heading">{$LANG.recurringamount}</span>
											<span class="list-text">{$recurringamount}</span>
											
										</li>
									{/if}
									<li>
										<span class="list-heading">{$LANG.orderbillingcycle}</span>
										<span class="list-text">{$billingcycle}</span>
									</li>
									{if $nextduedate == '-'}{else}
										<li>
											<span class="list-heading">{$LANG.clientareahostingnextduedate}</span>
											<span class="list-text">{$nextduedate}</span>
										</li>
									{/if}
									<li>
										<span class="list-heading">{$LANG.orderpaymentmethod}</span>
										<span class="list-text">{$paymentmethod}</span>
									</li>
								</ul>
							</div>
						</div>
					</div>

				</div>
			</div>
			
			{*
			{if $showcancelbutton || $packagesupgrade}
				<div class="row">
					{if $packagesupgrade}
						<div class="col-xs-{if $showcancelbutton}6{else}12{/if}">
							<a href="upgrade.php?type=package&amp;id={$id}" class="btn btn-block btn-primary">{$LANG.upgrade}</a>
						</div>
					{/if}
					{if $showcancelbutton}
						<div class="col-xs-{if $packagesupgrade}6{else}12{/if}">
							<a href="clientarea.php?action=cancel&amp;id={$id}" class="btn btn-block btn-danger {if $pendingcancellation}disabled{/if}">{if $pendingcancellation}{$LANG.cancellationrequested}{else}{$LANG.clientareacancelrequestbutton}{/if}</a>
						</div>
					{/if}
				</div>
			{/if}
			*}
			
		{if $systemStatus == 'Active'}
		

            {foreach $hookOutput as $output}
				<div>
					{$output}
				</div>
            {/foreach}

            {if $domain || $moduleclientarea || $configurableoptions || $customfields || $lastupdate}
				<div class="tc-tabs">
					<div class="row clearfix">
						<div class="col-xs-12">
							<ul class="nav nav-tabs nav-tabs-overflow no-margin-bottom">
								{if $domain}
									<li class="active">
										<a href="#domain" data-toggle="tab"><i class="fas fa-globe fa-fw"></i> {if $type eq "server"}{$LANG.sslserverinfo}{elseif ($type eq "hostingaccount" || $type eq "reselleraccount") && $serverdata}{$LANG.hostingInfo}{else}{$LANG.clientareahostingdomain}{/if}</a>
									</li>
								{elseif $moduleclientarea}
									<li class="active">
										<a href="#manage" data-toggle="tab"><i class="fas fa-globe fa-fw"></i> {$LANG.manage}</a>
									</li>
								{/if}
								{if $configurableoptions}
									<li{if !$domain && !$moduleclientarea} class="active"{/if}>
										<a href="#configoptions" data-toggle="tab"><i class="fas fa-cubes fa-fw"></i> {$LANG.orderconfigpackage}</a>
									</li>
								{/if}
								{if $metricStats}
									<li{if !$domain && !$moduleclientarea && !$configurableoptions} class="active"{/if}>
										<a href="#metrics" data-toggle="tab"><i class="fas fa-chart-line fa-fw"></i> {$LANG.metrics.title}</a>
									</li>
								{/if}
								{if $customfields}
									<li{if !$domain && !$moduleclientarea && !$metricStats && !$configurableoptions} class="active"{/if}>
										<a href="#additionalinfo" data-toggle="tab"><i class="fas fa-info fa-fw"></i> {$LANG.additionalInfo}</a>
									</li>
								{/if}
								{if $lastupdate}
									<li{if !$domain && !$moduleclientarea && !$configurableoptions && !$customfields} class="active"{/if}>
										<a href="#resourceusage" data-toggle="tab"><i class="fas fa-inbox fa-fw"></i> {$LANG.resourceUsage}</a>
									</li>
								{/if}
							</ul>
						</div>
					</div>
					<div class="tab-content product-details-tab-container">
						{if $domain}
							<div class="tab-pane fade in active" id="domain">
								<ul class="list-info list-v">
								{if $type eq "server"}
									<li>
                                        <span class="list-heading">{$LANG.serverhostname}</span>
                                        <span class="list-text">{$domain}</span>
									</li>
                                {if $dedicatedip}
									<li>
                                        <span class="list-heading">{$LANG.primaryIP}</span>
                                        <span class="list-text">{$dedicatedip}</span>
									</li>
                                {/if}
                                {if $assignedips}
									<li>
                                        <span class="list-heading">{$LANG.assignedIPs}</span>
                                        <span class="list-text">{$assignedips|nl2br}</span>
									</li>
                                {/if}
                                {if $ns1 || $ns2}
									<li>
                                        <span class="list-heading">{$LANG.domainnameservers}</span>
                                        <span class="list-text">{$ns1}<br />{$ns2}</span>
									</li>
                                {/if}
                            {else}
                                {if $domain}
									<li>
                                        <span class="list-heading">{$LANG.orderdomain}</span>
                                        <span class="list-text">{$domain}</span>
									</li>
                                {/if}
                                {if $username}
									<li>
                                        <span class="list-heading">{$LANG.serverusername}</span>
                                        <span class="list-text">{$username}</span>
									</li>
                                {/if}
                                {if $serverdata}
									<li>
                                        <span class="list-heading">{$LANG.servername}</span>
                                        <span class="list-text">{$serverdata.hostname}</span>
									</li>
									<li>
                                        <span class="list-heading">{$LANG.domainregisternsip}</span>
                                        <span class="list-text">{$serverdata.ipaddress}</span>
									</li>
                                    {if $serverdata.nameserver1 || $serverdata.nameserver2 || $serverdata.nameserver3 || $serverdata.nameserver4 || $serverdata.nameserver5}
										<li>
											<span class="list-heading">{$LANG.domainnameservers}</span>>
											<span class="list-heading">
													{if $serverdata.nameserver1}{$serverdata.nameserver1} ({$serverdata.nameserver1ip})<br />{/if}
													{if $serverdata.nameserver2}{$serverdata.nameserver2} ({$serverdata.nameserver2ip})<br />{/if}
													{if $serverdata.nameserver3}{$serverdata.nameserver3} ({$serverdata.nameserver3ip})<br />{/if}
													{if $serverdata.nameserver4}{$serverdata.nameserver4} ({$serverdata.nameserver4ip})<br />{/if}
													{if $serverdata.nameserver5}{$serverdata.nameserver5} ({$serverdata.nameserver5ip})<br />{/if}									
											</span>
										</li>
                                    {/if}
                                {/if}

                                <br>
                                <div class="TM-card">
                                    <a href="http://{$domain}" class="btn btn-sm btn-default hidden-xs" target="_blank">{$LANG.visitwebsite}</a>
                                    {if $domainId}
                                        <a href="clientarea.php?action=domaindetails&id={$domainId}" class="btn btn-sm btn-default" target="_blank">{$LANG.managedomain}</a>
                                    {/if}
                                    <input type="button" onclick="popupWindow('whois.php?domain={$domain}','whois',650,420);return false;" value="{$LANG.whoisinfo}" class="btn btn-sm btn-default" />
                                </div>
                            {/if}
								
								{if $moduleclientarea}
									<hr class="separator" />
									
									<div class="text-center module-client-area">
										{$moduleclientarea}
									</div>
									
									<hr class="separator" />
								{/if}
								
							</div>
                        {if $sslStatus}
                            <div class="tab-pane fade text-center" id="ssl-info">
                                {if $sslStatus->isActive()}
                                    <div class="alert alert-success" role="alert">
                                        {lang key='sslActive' expiry=$sslStatus->expiryDate->toClientDateFormat()}
                                    </div>
                                {else}
                                    <div class="alert alert-warning ssl-required" role="alert">
                                        {lang key='sslRequired'}
                                    </div>
                                {/if}
                            </div>
                        {/if}
						{elseif $moduleclientarea}
							<div class="tab-pane fade{if !$domain} in active{/if} text-center" id="manage">
								{if $moduleclientarea}									
									<div class="text-center module-client-area">
										{$moduleclientarea}
									</div>
								{/if}
							</div>
						{/if}
						{if $configurableoptions}
							<div class="tab-pane fade{if !$domain && !$moduleclientarea} in active{/if}" id="configoptions">
								{foreach from=$configurableoptions item=configoption}
								
									<h5 class="heading"><strong>{$configoption.optionname}</strong></h5>
									<div class="well well-sm">
										{if $configoption.optiontype eq 3}{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.optiontype eq 4}{$configoption.selectedqty} x {$configoption.selectedoption}{else}{$configoption.selectedoption}{/if}
									</div>
									
								{/foreach}
							</div>
						{/if}
						{if $metricStats}
							<div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions} in active{/if}" id="metrics">
								{include file="$template/clientareaproductusagebilling.tpl"}
							</div>
						{/if}
						{if $customfields}
							<div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions && !$metricStats} in active{/if} text-center" id="additionalinfo">
								{foreach from=$customfields item=field}
								
									<h5 class="heading"><strong>{$field.name}</strong></h5>
									<div class="well well-sm">
										{$field.value}
									</div>
									
								{/foreach}
							</div>
						{/if}
						{if $lastupdate}
							<div class="tab-pane fade text-center" id="resourceusage">
								<div class="col-sm-10 col-sm-offset-1">
									<div class="col-sm-6">
										<h5><strong>{$LANG.diskSpace}</strong></h5>
										<input type="text" value="{$diskpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
										<p>{$diskusage}MB / {$disklimit}MB</p>
									</div>
									<div class="col-sm-6">
										<h5><strong>{$LANG.bandwidth}</strong></h5>
										<input type="text" value="{$bwpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
										<p>{$bwusage}MB / {$bwlimit}MB</p>
									</div>
								</div>
								<div class="clearfix">
								</div>
								<p class="text-muted">{$LANG.clientarealastupdated}: {$lastupdate}</p>

								<script src="{$BASE_PATH_JS}/jquery.knob.js"></script>
								<script type="text/javascript">
								jQuery(function() {ldelim}
									jQuery(".dial-usage").knob({ldelim}'format':function (v) {ldelim} alert(v); {rdelim}{rdelim});
								{rdelim});
								</script>
							</div>
						{/if}
					</div>
				</div>
            {/if}
            <script src="{$BASE_PATH_JS}/bootstrap-tabdrop.js"></script>
            <script type="text/javascript">
                jQuery('.nav-tabs-overflow').tabdrop();
            </script>
		
		
		{else}
		
			<div class="alert-lg no-data">
				<div class="icon">
					<i class="fas fa-exclamation-triangle"></i>
				</div>
				<div class="text">
					{if $suspendreason}
						<strong>{$suspendreason}</strong><br />
					{/if}
					{$LANG.cPanel.packageNotActive} {$status}.<br />
					{if $systemStatus eq "Pending"}
						{$LANG.cPanel.statusPendingNotice}
					{elseif $systemStatus eq "Suspended"}
						{$LANG.cPanel.statusSuspendedNotice}
					{/if}
				</div>
			</div>
				
        {/if}
	
	
	{/if}
    </div>
    <div class="tab-pane fade in" id="tabDownloads">
		
		<div class="section">
			<div class="section-header">
				<h3>{$LANG.downloadstitle}</h3>
				<p class="desc">{lang key="clientAreaProductDownloadsAvailable"}</p>
			</div>
			<div class="section-body">
				
				<div class="kbarticles kbdownloads">
					{foreach from=$downloads item=download}
						<a href="{$download.link}">
							{$download.title}                            
							<p>{$download.description}</p>
						</a>
					{/foreach}
				</div>
			</div>
		</div>
		


    </div>
    <div class="tab-pane fade in" id="tabAddons">
		<div class="section">
			<div class="section-header">
			<h3>{$LANG.clientareahostingaddons}</h3>
				{if $addonsavailable}
					<p class="desc">{$LANG.clientAreaProductAddonsAvailable}</p>
				{/if}
			</div>
			<div class="section-body">
				<div class="row">
					{foreach from=$addons item=addon}
						<div class="col-sm-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">{$addon.name}</h3>
								</div>
								<div class="panel-body">
									<ul class="list-info list-info-50">
										<li>
											<span class="list-heading">{$LANG.clientareastatus}</span>
											<span class="list-text status-{$addon.rawstatus|strtolower}">{$addon.status}</span>
										</li>
										<li>
                                              <span class="list-heading">{$LANG.recurringamount}</span>
                                              <span class="list-text">{$addon.pricing}</span>
										</li>
										<li>
											<span class="list-heading">{$LANG.registered}</span>
											<span class="list-text">{$addon.regdate}</span>
										</li>
										<li>
											<span class="list-heading">{$LANG.clientareahostingnextduedate}</span>
											<span class="list-text">{$addon.nextduedate}</span>
										</li>
									</ul>
								</div>
								{if $addon.managementActions}
									<div class="panel-footer">
										{$addon.managementActions}
									</div>
								{/if}
							</div>
						</div>
					{/foreach}
				</div>
			</div>
		</div>
		
    </div>
    <div class="tab-pane fade in" id="tabChangepw">
		<div class="section">
			<div class="section-header">
				<h3>{$LANG.serverchangepassword}</h3>
				<p class="desc">{$LANG.serverchangepasswordintro}</p>
			</div>
		
			<div class="section-body">
				{if $modulechangepwresult}
					{if $modulechangepwresult == "success"}
						{include file="$template/includes/alert.tpl" type="success" msg=$modulechangepasswordmessage textcenter=true}
					{elseif $modulechangepwresult == "error"}
						{include file="$template/includes/alert.tpl" type="error" msg=$modulechangepasswordmessage|strip_tags textcenter=true}
					{/if}
				{/if}

				<div class="row">
					<div class="col-sm-7">
						<form class=" using-password-strength" method="post" action="{$smarty.server.PHP_SELF}?action=productdetails#tabChangepw" role="form">
							<input type="hidden" name="id" value="{$id}" />
							<input type="hidden" name="modulechangepassword" value="true" />
							<div class="TM-card">
								<div id="newPassword1" class="form-group has-feedback">
									<label for="inputNewPassword1" class="control-label">{$LANG.newpassword}</label>
									<input type="password" class="form-control" id="inputNewPassword1" name="newpw" autocomplete="off" />
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
									<input type="password" class="form-control" id="inputNewPassword2" name="confirmpw" autocomplete="off" />
									<span class="form-control-feedback glyphicon"></span>
									<div id="inputNewPassword2Msg">
									</div>
								</div>
							</div>
							<div class="form-actions">
								<input class="btn btn-primary" type="submit" value="{$LANG.clientareasavechanges}" />
								<input class="btn" type="reset" value="{$LANG.cancel}" />
							</div>
						</form>
					</div>
				</div>
				
			</div>
		</div>

    </div>
</div>