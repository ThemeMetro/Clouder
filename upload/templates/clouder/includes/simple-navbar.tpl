{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}



<li>
	<a href="{$WEB_ROOT}/{if $loggedin}clientarea{else}index{/if}.php">
		{$LANG.clientareanavhome}
	</a>
</li>
						
<li class="dropdown">
	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
		{$LANG.navservices} <b class="caret"></b>
	</a>
	<ul class="dropdown-menu">
		{if $loggedin}
		<li><a id="Menu-Services-My_Services" href="{$WEB_ROOT}/clientarea.php?action=products">{$LANG.clientareanavservices}</a></li>
		{if $condlinks.pmaddon}<li><a id="Menu-Services-My_Projects" href="{$WEB_ROOT}/index.php?m=project_management">{$LANG.clientareaprojects}</a></li>{/if}							
		{/if}
								
								
								
		<!--additional menu links-->
		<li><a href="{$WEB_ROOT}/web_hosting.php">Shared Hosting</a></li>
		<li><a href="{$WEB_ROOT}/reseller_hosting.php">Reseller Hosting</a></li>
		<li><a href="{$WEB_ROOT}/vps_hosting.php">VPS Hosting</a></li>
		<li><a href="{$WEB_ROOT}/dedicated_servers.php">Dedicated Servers</a></li>
		<!--additional menu links-->
								
								
								
								
	</ul>					
</li>


{if $condlinks.domainreg || $condlinks.domaintrans}
	<li class="dropdown"><a id="Menu-Domains" class="dropdown-toggle" data-toggle="dropdown" href="#">{$LANG.navdomains}&nbsp;<b class="caret"></b></a>
		<ul class="dropdown-menu">
			{if $loggedin}
				<li><a id="Menu-Domains-My_Domains" href="{$WEB_ROOT}/clientarea.php?action=domains">{$LANG.clientareanavdomains}</a></li>
				<li><a id="Menu-Domains-Renew_Domains" href="{$WEB_ROOT}/cart.php?gid=renewals">{$LANG.navrenewdomains}</a></li>
				{/if}
				{if $condlinks.domainreg}<li><a id="Menu-Domains-Register_a_New_Domain" href="{$WEB_ROOT}/cart.php?a=add&domain=register">{$LANG.navregisterdomain}</a></li>{/if}
				{if $condlinks.domaintrans}<li><a id="Menu-Domains-Transfer_Domains_to_Us" href="{$WEB_ROOT}/cart.php?a=add&domain=transfer">{$LANG.navtransferdomain}</a></li>{/if}
				{if $enomnewtldsenabled}<li><a id="Menu-Domains-Preregister_New_TLDs" href="{$WEB_ROOT}/{$enomnewtldslink}">Preregister New TLDs</a></li>{/if}
				<li><a id="Menu-Domains-Whois_Lookup" href="{$WEB_ROOT}/domainchecker.php">{$LANG.navdomainsearch}</a></li>
			</ul>
	</li>		
{/if}

<!--About us Page links-->
<li><a href="about_us.php">About Us</a></li>	
						
{if $loggedin}
<li class="dropdown">
	<a id="Menu-Billing" class="dropdown-toggle" data-toggle="dropdown" href="#">
		{$LANG.navbilling}&nbsp;<b class="caret"></b>
	</a>
	<ul class="dropdown-menu">
		<li><a id="Menu-Billing-My_Invoices" href="{$WEB_ROOT}/clientarea.php?action=invoices">{$LANG.invoices}</a></li>
		<li><a id="Menu-Billing-My_Quotes" href="{$WEB_ROOT}/clientarea.php?action=quotes">{$LANG.quotestitle}</a></li>
		{if $condlinks.addfunds}<li><a id="Menu-Billing-Add_Funds" href="{$WEB_ROOT}/clientarea.php?action=addfunds">{$LANG.addfunds}</a></li>{/if}
		{if $condlinks.masspay}<li><a id="Menu-Billing-Mass_Payment" href="{$WEB_ROOT}/clientarea.php?action=masspay&all=true">{$LANG.masspaytitle}</a></li>{/if}
		{if $condlinks.updatecc}<li><a id="Menu-Billing-Manage_Credit_Card" href="{$WEB_ROOT}/clientarea.php?action=creditcard">{$LANG.navmanagecc}</a></li>{/if}
		{if $condlinks.affiliates}<li><a href="{$WEB_ROOT}/affiliates.php">{$LANG.affiliatestitle}</a></li>{/if}
	</ul>
</li>							
{/if}
								
<li class="dropdown">
	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
		{$LANG.navsupport} <b class="caret"></b>
	</a>
	<ul class="dropdown-menu" role="menu">
		<li><a id="Menu-Support-Tickets" href="{$WEB_ROOT}/submitticket.php">{$LANG.navopenticket}</a></li>
		<li><a id="Menu-Support-Tickets" href="{$WEB_ROOT}/supporttickets.php">{$LANG.navtickets}</a></li>
		<li><a id="Menu-Support-Knowledgebase" href="{$WEB_ROOT}/knowledgebase.php">{$LANG.knowledgebasetitle}</a></li>
		<li><a id="Menu-Support-Network_Status" href="{$WEB_ROOT}/serverstatus.php">{$LANG.networkstatustitle}</a></li>
		<li><a id="Menu-Annoucements" href="{$WEB_ROOT}/announcements.php">{$LANG.announcementstitle}</a></li>
		<li><a id="Menu-Support-Downloads" href="{$WEB_ROOT}/downloads.php">{$LANG.downloadstitle}</a></li>
		{if $loggedin}<li><a id="Menu-Contact_Us" href="{$WEB_ROOT}/contact.php">{$LANG.contactus}</a></li>{/if}
	</ul>								
</li>

						
{if $loggedin}{else}<li><a id="Menu-Contact_Us" href="{$WEB_ROOT}/contact.php">{$LANG.contactus}</a></li>{/if}


