{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


<li>
	<a href="{$WEB_ROOT}/cart.php?a=view" class="dropdown-toggle">
		<i class="fal fa-shopping-cart"></i> <span class="badge up badge-success" id="cartItemCount">{$cartitemcount}</span>
	</a>
</li>	


{if $loggedin}
	<li>
		<a href="#" data-toggle="dropdown" class="dropdown-toggle" id="accountNotifications">
			<i class="fal fa-bell"></i>  {if count($clientAlerts) > 0}<span class="badge up badge-warning">{$clientAlerts|count}</span>{/if}
		</a>		
		<ul class="dropdown-menu dropdown-scroll dropdown-tasks auto">
			<li class="dropdown-header">
				<i class="fal fa-info-circle"></i> ({$clientAlerts|count}) {$LANG.notifications}
			</li>
			<li id="taskScroll">
				<ul class="list-unstyled">
					{foreach $clientAlerts as $alert}
					<li>
						<a class="text-{$alert->getSeverity()}" href="{$alert->getLink()}">{$alert->getMessage()} {if $alert->getLinkText()}<button href="{$alert->getLink()}" class="btn btn-xs btn-{$alert->getSeverity()}">{$alert->getLinkText()}</button>{/if}</a>
					</li>
					{foreachelse}
					<li>
						<a href="javascript:;">{$LANG.notificationsnone}</a>
					</li>
					{/foreach}
				</ul>
			</li>
		</ul>
		
	</li>
{/if}

<!-- Language -->
{if $languagechangeenabled && count($locales) > 1}
	<li>
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			<i class="fal fa-language"></i>
		</a>
		<ul class="dropdown-menu dropdown-scroll dropdown-tasks auto auto-width">
			<li class="dropdown-header">
				<i class="fal fa-list"></i> {$activeLocale.localisedName}
			</li>
			<li id="langScroll">
				<ul class="list-unstyled">
					{foreach $locales as $locale}
						<li><a href="{$currentpagelinkback}language={$locale.language}">{$locale.localisedName}</a></li>
					{/foreach}
				</ul>
			</li>
		</ul>
	</li>
{/if}

{include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar}

{if $adminMasqueradingAsClient || $adminLoggedIn}
	<li>
		<a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="dropdown-toggle" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{$LANG.adminmasqueradingasclient} {$LANG.logoutandreturntoadminarea}{else}{$LANG.adminloggedin} {$LANG.returntoadminarea}{/if}">
			<i class="fal fa-sign-out-alt"></i>
		</a>
	</li>
{/if}


