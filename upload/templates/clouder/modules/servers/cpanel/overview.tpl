<link href="modules/servers/cpanel/css/client.css" rel="stylesheet">
<script src="modules/servers/cpanel/js/client.js"></script>

<div class="product-details">
	<div class="row row-eq-height row-eq-height-sm">
		<div class="col-sm-6">
			<div class="product-holder product-status-{$rawstatus|strtolower}">
				<div class="product-content">
					<div class="product-image">
						<span class="fa-stack">
							<i class="fas fa-circle fa-stack-2x"></i>
							<i class="fab fa-cpanel fa-stack-1x fa-inverse"></i>
						</span>
					</div>
					<h4 class="text-center">
						<small>{$groupname}</small> - {$product}
					</h4>
					
					<div class="status-sticker-wrapper">
						<div class="status-sticker product-status-{$rawstatus|strtolower}">
							{$status}
						</div>
					</div>
				</div>
				<div class="product-footer">
					<ul class="list-unstyled list-inline">
						<li><a href="http://{$domain}" target="_blank">www.{$domain}</a></li>
					</ul>
				</div>				
			</div>
		</div>
		
		<div class="col-sm-6">
			<div class="product-info cpanel-usage-stats">
                <div class="row">
                    <div class="col-sm-5 col-sm-offset-1 col-xs-6" id="diskUsage">
                        <strong>{$LANG.cPanel.diskUsage}</strong>
                        <br /><br />
                        <input type="text" value="{$diskpercent|substr:0:-1}" class="usage-dial" data-fgColor="#444" data-angleOffset="-125" data-angleArc="250" data-min="0" data-max="{if substr($diskpercent, 0, -1) > 100}{$diskpercent|substr:0:-1}{else}100{/if}" data-readOnly="true" data-width="100" data-height="80" />
                        <br /><br />
                        {$diskusage} M / {$disklimit} M
                    </div>
                    <div class="col-sm-5 col-xs-6" id="bandwidthUsage">
                        <strong>{$LANG.cPanel.bandwidthUsage}</strong>
                        <br /><br />
                        <input type="text" value="{$bwpercent|substr:0:-1}" class="usage-dial" data-fgColor="#d9534f" data-angleOffset="-125" data-angleArc="250" data-min="0" data-max="{if substr($bwpercent, 0, -1) > 100}{$bwpercent|substr:0:-1}{else}100{/if}" data-readOnly="true" data-width="100" data-height="80" />
                        <br /><br />
                        {$bwusage} M / {$bwlimit} M
                    </div>
                </div>

                {if $bwpercent|substr:0:-1 > 75}
                    <div class="text-danger text-center limit-near">
                        {if $bwpercent|substr:0:-1 > 100}
                            {$LANG.cPanel.usageStatsBwOverLimit}
                        {else}
                            {$LANG.cPanel.usageStatsBwLimitNear}
                        {/if}
                        {if $packagesupgrade}
                            <a href="upgrade.php?type=package&id={$serviceid}" class="btn btn-xs btn-danger">
                                <i class="fas fa-arrow-circle-up"></i>
                                {$LANG.cPanel.usageUpgradeNow}
                            </a>
                        {/if}
                    </div>
                {elseif $diskpercent|substr:0:-1 > 75}
                    <div class="text-danger text-center limit-near">
                        {if $diskpercent|substr:0:-1 > 100}
                            {$LANG.cPanel.usageStatsDiskOverLimit}
                        {else}
                            {$LANG.cPanel.usageStatsDiskLimitNear}
                        {/if}
                        {if $packagesupgrade}
                            <a href="upgrade.php?type=package&id={$serviceid}" class="btn btn-xs btn-danger">
                                <i class="fas fa-arrow-circle-up"></i>
                                {$LANG.cPanel.usageUpgradeNow}
                            </a>
                        {/if}
                    </div>
                {else}
                    <div class="text-info text-center limit-near">
                        {$LANG.cPanel.usageLastUpdated} {$lastupdate}
                    </div>
                {/if}

                <script src="{$BASE_PATH_JS}/jquery.knob.js"></script>
                <script type="text/javascript">
                jQuery(function() {
                    jQuery(".usage-dial").knob({
                        'format': function (value) {
                            return value + '%';
                        }
                    });
                });
                </script>
				
				{if $availableAddonProducts}
					<div class="cPanelExtrasPurchasePanel" id="cPanelExtrasPurchasePanel">
						<h5>{$LANG.cPanel.addonsExtras}</h5>
						<form method="post" action="cart.php?a=add">
							<input type="hidden" name="serviceid" value="{$serviceid}" />
							<div class="form-group">
								<select name="aid" class="form-control">
								{foreach $availableAddonProducts as $addonId => $addonName}
									<option value="{$addonId}">{$addonName}</option>
								{/foreach}
								</select>
							</div>
							<button type="submit" class="btn btn-primary">
								<i class="fas fa-shopping-cart"></i>
								{$LANG.cPanel.purchaseActivate}
							</button>
						</form>
					</div>
				{/if}
			</div>
		</div>
	</div>
</div>
		

{foreach $hookOutput as $output}
	<div class="section">
		<div>
			{$output}
		</div>
	</div>
{/foreach}

{if $systemStatus == 'Active'}
	<div class="section">
		<h4>{$LANG.cPanel.quickShortcuts}</h4>
		<div class="panel panel-default" id="cPanelQuickShortcutsPanel">
			<div class="panel-body text-center">

				<div class="row cpanel-feature-row">
					<div class="col-sm-3 col-xs-6" id="cPanelEmailAccounts">
						<a href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Email_Accounts" target="_blank">
							<img src="modules/servers/cpanel/img/email_accounts.png" />
							{$LANG.cPanel.emailAccounts}
						</a>
					</div>
					<div class="col-sm-3 col-xs-6" id="cPanelForwarders">
						<a href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Email_Forwarders" target="_blank">
							<img src="modules/servers/cpanel/img/forwarders.png" />
							{$LANG.cPanel.forwarders}
						</a>
					</div>
					<div class="col-sm-3 col-xs-6" id="cPanelAutoResponders">
						<a href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Email_AutoResponders" target="_blank">
							<img src="modules/servers/cpanel/img/autoresponders.png" />
							{$LANG.cPanel.autoresponders}
						</a>
					</div>
					<div class="col-sm-3 col-xs-6" id="cPanelFileManager">
						<a href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=FileManager_Home" target="_blank">
							<img src="modules/servers/cpanel/img/file_manager.png" />
							{$LANG.cPanel.fileManager}
						</a>
					</div>
				</div>
				<div class="row cpanel-feature-row">
					<div class="col-sm-3 col-xs-6" id="cPanelBackup">
						<a href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Backups_Home" target="_blank">
							<img src="modules/servers/cpanel/img/backup.png" />
							{$LANG.cPanel.backup}
						</a>
					</div>
					<div class="col-sm-3 col-xs-6" id="cPanelSubdomains">
						<a href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Domains_SubDomains" target="_blank">
							<img src="modules/servers/cpanel/img/subdomains.png" />
							{$LANG.cPanel.subdomains}
						</a>
					</div>
					<div class="col-sm-3 col-xs-6" id="cPanelAddonDomains">
						<a href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Domains_AddonDomains" target="_blank">
							<img src="modules/servers/cpanel/img/addon_domains.png" />
							{$LANG.cPanel.addonDomains}
						</a>
					</div>
					<div class="col-sm-3 col-xs-6" id="cPanelCronJobs">
						<a href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Cron_Home" target="_blank">
							<img src="modules/servers/cpanel/img/cron_jobs.png" />
							{$LANG.cPanel.cronJobs}
						</a>
					</div>
				</div>
				<div class="row cpanel-feature-row">
					<div class="col-sm-3 col-xs-6" id="cPanelMySQLDatabases">
						<a href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Database_MySQL" target="_blank">
							<img src="modules/servers/cpanel/img/mysql_databases.png" />
							{$LANG.cPanel.mysqlDatabases}
						</a>
					</div>
					<div class="col-sm-3 col-xs-6" id="cPanelPhpMyAdmin">
						<a href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Database_phpMyAdmin" target="_blank">
							<img src="modules/servers/cpanel/img/php_my_admin.png" />
							{$LANG.cPanel.phpMyAdmin}
						</a>
					</div>
					<div class="col-sm-3 col-xs-6" id="cPanelAwstats">
						<a href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Stats_AWStats" target="_blank">
							<img src="modules/servers/cpanel/img/awstats.png" />
							{$LANG.cPanel.awstats}
						</a>
					</div>
				</div>

			</div>
		</div>
	</div>

	
	<div class="section">
		<h4>{$LANG.cPanel.createEmailAccount}</h4>
		<div class="panel panel-default" id="cPanelQuickEmailPanel">
			<div class="panel-body">

				{include file="$template/includes/alert.tpl" type="success" msg=$LANG.cPanel.emailAccountCreateSuccess textcenter=true hide=true idname="emailCreateSuccess" additionalClasses="email-create-feedback"}

				{include file="$template/includes/alert.tpl" type="danger" msg=$LANG.cPanel.emailAccountCreateFailed|cat:' <span id="emailCreateFailedErrorMsg"></span>' textcenter=true hide=true idname="emailCreateFailed" additionalClasses="email-create-feedback"}

				<form id="frmCreateEmailAccount" onsubmit="doEmailCreate();return false">
					<input type="hidden" name="id" value="{$serviceid}" />
					<input type="hidden" name="email_quota" value="250" />
					<div class="row">
						<div class="col-sm-6">
							<label>{$LANG.contactemail}</label>
							<div class="input-group">
								<input type="text" name="email_prefix" class="form-control" placeholder="{$LANG.cPanel.usernamePlaceholder}">
								<span class="input-group-addon">@{$domain}</span>
							</div>
						</div>
						<div class="col-sm-3">
							<label>{$LANG.loginpassword}</label>
							<input type="password" name="email_pw" class="form-control" placeholder="{$LANG.cPanel.passwordPlaceholder}">
						</div>
						<div class="col-sm-3">
							<label>&nbsp;</label>
							<button type="submit" class="btn btn-primary btn-block" />
								<i class="fas fa-plus" id="btnCreateLoader"></i>
								{$LANG.cPanel.create}
							</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>

{else}

	<div class="alert-lg no-data" id="cPanelSuspendReasonPanel">
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

<div class="section">
	<div class="panel panel-default panel-tabs">
		<div class="row clearfix">
			<div class="col-xs-12">
				<div class="panel-nav">
					<ul class="nav nav-tabs nav-pills nav-tabs-overflow">
						<li class="active">
							<a href="#billingInfo" data-toggle="tab" aria-expanded="true">{$LANG.cPanel.billingOverview}</a>
						</li>
						{if $configurableoptions}
							<li><a href="#configInfo" data-toggle="tab" aria-expanded="false">{$LANG.orderconfigpackage}</a></li>				
						{/if}
						{if $metricStats}
							<li><a href="#cPanelMetricStatsPanel" data-toggle="tab" aria-expanded="false">{$LANG.metrics.title}</a></li>
						{/if}
						{if $customfields}
							<li><a href="#customInfo" data-toggle="tab" aria-expanded="false">{$LANG.additionalInfo}</a></li>				
						{/if}
						{if $domainId}
							<li><a href="#domainInfo" data-toggle="tab" aria-expanded="false">{$LANG.clientareahostingdomain}</a></li>
						{/if}
					</ul>
				</div>
			</div>
		</div>
	
		<div class="tab-content">
			<div class="tab-pane fade in active billingInfo" id="billingInfo">
				<div id="cPanelBillingOverviewPanel">
					<div class="row row-eq-height row-eq-height-sm">
						<div class="col-sm-6 col-md-3">
							<div class="row" id="registrationDate">
								<div class="col-xs-12">
									<span class="text-heading">{$LANG.clientareahostingregdate}</span>
								</div>
								<div class="col-xs-12">
									{$regdate}
								</div>
							</div>
						</div>
						{if $firstpaymentamount neq $recurringamount}
							<div class="col-sm-6 col-md-3">
								<div class="row" id="firstPaymentAmount">
									<div class="col-xs-12" >
										<span class="text-heading">{$LANG.firstpaymentamount}</span>
									</div>
									<div class="col-xs-12">
										{$firstpaymentamount}
									</div>
								</div>
							</div>
						{/if}
						<div class="col-sm-6 col-md-3">
							<div class="row" id="nextDueDate">
								<div class="col-xs-12">
									<span class="text-heading">{$LANG.clientareahostingnextduedate}</span>
								</div>
								<div class="col-xs-12">
									{$nextduedate}
								</div>
							</div>
						</div>
						{if $billingcycle != $LANG.orderpaymenttermonetime && $billingcycle != $LANG.orderfree}
						<div class="col-sm-6 col-md-3">
							<div class="row" id="recurringAmount">
								<div class="col-xs-12">
									<span class="text-heading">{$LANG.recurringamount}</span>
								</div>
								<div class="col-xs-12">
									{$recurringamount}
								</div>
							</div>
						</div>
						{/if}
						<div class="col-sm-6 col-md-3">
							<div class="row" id="paymentMethod">
								<div class="col-xs-12">
									<span class="text-heading">{$LANG.orderpaymentmethod}</span>
								</div>
								<div class="col-xs-12">
									{$paymentmethod}
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="row" id="billingCycle">
								<div class="col-xs-12">
									<span class="text-heading">{$LANG.orderbillingcycle}</span>
								</div>
								<div class="col-xs-12">
									{$billingcycle}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
			{if $configurableoptions}
				<div class="tab-pane fade in" id="configInfo">
					<div class="panel panel-default" id="cPanelConfigurableOptionsPanel">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.orderconfigpackage}</h3>
						</div>
						<div class="panel-body">
							{foreach from=$configurableoptions item=configoption}
								<div class="row">
									<div class="col-md-5 col-xs-6 text-right">
										<strong>{$configoption.optionname}</strong>
									</div>
									<div class="col-md-7 col-xs-6 text-left">
										{if $configoption.optiontype eq 3}{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.optiontype eq 4}{$configoption.selectedqty} x {$configoption.selectedoption}{else}{$configoption.selectedoption}{/if}
									</div>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			{/if}
			
			{if $metricStats}
				<div class="tab-pane fade in" id="cPanelMetricStatsPanel">
					{include file="$template/clientareaproductusagebilling.tpl"}
				</div>
			{/if}
			
			{if $customfields}
				<div class="tab-pane fade in" id="customInfo">
				<div class="panel panel-default" id="cPanelAdditionalInfoPanel">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.additionalInfo}</h3>
					</div>
					<div class="panel-body">
						{foreach from=$customfields item=field}
							<div class="row">
								<div class="col-md-5 col-xs-6 text-right">
									<strong>{$field.name}</strong>
								</div>
								<div class="col-md-7 col-xs-6 text-left">
									{if empty($field.value)}
										{$LANG.blankCustomField}
									{else}
										{$field.value}
									{/if}
								</div>
							</div>
						{/foreach}
					</div>
				</div>
				</div>
			{/if}
			
			{if $domainId}
				<div class="tab-pane fade in" id="domainInfo">
					<div class="cpanel-domain-overview">
						<a href="http://{$domain}" class="btn btn-default" target="_blank">www.{$domain}</a>
						<a href="clientarea.php?action=domaindetails&id={$domainId}" class="btn btn-default" target="_blank">{$LANG.managedomain}</a>
						<input type="button" onclick="popupWindow('whois.php?domain={$domain}','whois',650,420);return false;" value="{$LANG.whoisinfo}" class="btn btn-default" />
					</div>
				</div>
			{/if}
			
			
		</div>
		
		<script src="{$BASE_PATH_JS}/bootstrap-tabdrop.js"></script>
         <script type="text/javascript">
             jQuery('.nav-tabs-overflow').tabdrop();
         </script>
		
	</div>
</div>