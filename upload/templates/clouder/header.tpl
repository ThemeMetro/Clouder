{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


<!DOCTYPE html>
<html lang="en">
	
	<head>
		<meta charset="{$charset}" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		{if $templatefile == 'homepage'}
		
		<title>{$LANG.title_homepage}</title>
		<meta name="keywords" content="{$LANG.meta_keywords_homepage}" />
		<meta name="description" content="{$LANG.meta_description_homepage}" />
		
		{else}
		
		<title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
		{/if}
		
		{include file="$template/includes/head.tpl"}
		

		{$headoutput}
	</head>
	
	<body class="TMC {if $showingLoginPage}login{/if}" data-phone-cc-input="{$phoneNumberInputStyle}">
	{if !$showingLoginPage}
	{$headeroutput}

    <nav class="navbar top-navbar navbar-fixed-top" role="navigation">		
		<div class="pre-header">
			<div class="container">
				<div class="row">
					<!-- BEGIN TOP BAR LEFT PART -->
					<div class="col-xs-5 col-sm-6">
						<ul class="list-unstyled list-inline hidden-xs">
							<li><i class="fas fa-phone-volume"></i><span>+91 124 2250121</span></li>
							<li><i class="far fa-envelope"></i><span>info@example.com</span></li>
						</ul>
						<ul class="list-unstyled list-inline visible-xs">
							<li>
								<span  class="tooltip-primary" data-placement="right" data-rel="tooltip" title="+ 91 124 2250121">
									<i class="fas fa-phone-volume"></i>
								</span>
							</li>
							<li>
								<span  class="tooltip-primary" data-placement="right" data-rel="tooltip" title="info@example.com">
									<i class="far fa-envelope"></i>	
								</span>
							</li>
						</ul>
					</div>
					<!-- END TOP BAR LEFT PART -->
					<!-- BEGIN TOP BAR MENU -->
					<div class="col-xs-7 col-sm-6 additional-nav">
						<ul class="list-unstyled list-inline pull-right">
						
							<!-- Shopping Cart -->
							<li class="dropdown">
								<a href="{$WEB_ROOT}/cart.php?a=view" class="quick-nav">
									<i class="fas fa-shopping-cart"></i> <span class="badge up badge-success" id="cartItemCount">{$cartitemcount}</span>
								</a>
							</li>						
							
							<!-- Login/Account Notifications -->
							{if $loggedin}
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="far fa-bell"></i>  <span class="badge up badge-primary">{$clientAlerts|count}</span>
								</a>
								<ul class="dropdown-menu dropdown-scroll dropdown-tasks auto">
									<li class="dropdown-header">
										<i class="fas fa-info-circle"></i> ({$clientAlerts|count}) {$LANG.notifications}
									</li>
									<li id="taskScroll">
										<ul class="list-unstyled">
											{foreach $clientAlerts as $alert}
											<li>
												<a class="text-{$alert->getSeverity()}" href="{$alert->getLink()}">{$alert->getMessage()} {if $alert->getLinkText()} <button href="{$alert->getLink()}" class="btn btn-xs btn-{$alert->getSeverity()}">{$alert->getLinkText()}</button>{/if}</a>
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
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="fa fa-language"></i></span>
								</a>
								<ul class="dropdown-menu dropdown-scroll dropdown-tasks auto auto-width">
									<li class="dropdown-header">
										<i class="fas fa-list"></i> {$LANG.chooselanguage}
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
							
							{if $adminMasqueradingAsClient || $adminLoggedIn}
								<li>
									<a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="dropdown-toggle" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{$LANG.adminmasqueradingasclient} {$LANG.logoutandreturntoadminarea}{else}{$LANG.adminloggedin} {$LANG.returntoadminarea}{/if}">
										<i class="fas fa-sign-out-alt text-warning"></i>
									</a>
								</li>
							{/if}

						</ul>
					</div>
					<!-- END TOP BAR MENU -->
				</div>
			</div>        
		</div>

        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
               <a class="navbar-brand" href="{$WEB_ROOT}/index.php">
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/images/logo-dark.png" alt="{$companyname}" class="img-responsive" />
                </a>
				
				 <!-- Top Menu Right-->
				<ul class="nav navbar-right">					
					<!--Search Box-->
					<li>
						<div class="nav-search">
							<form method="post" action="{$WEB_ROOT}/knowledgebase.php?action=search">
								<div class="form-group">
									<input type="text" name="search" class="form-control" placeholder="Search ..." />
									<span class="glyphicon glyphicon-search text-primary"></span>
								</div>							
							</form>
						</div>
					</li>
					<!--Search Box-->
					
					{include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar}
					


				</ul>
				
            </div>		
            <!-- Top Menu Right-->
			<div class="nav-top">
			
				<!-- Top Menu Left-->
				<div class="top-menu collapse navbar-collapse  navbar-main-collapse">
					<ul class="nav navbar-nav navbar-left">
					
						{include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
						
					</ul>
				</div>
				<!-- Top Menu Left-->
				
			</div>
            <!-- /.Top Menu -->
		</div>
        <!-- /.container -->
		
		{include file="$template/includes/verifyemail.tpl"}
		
    </nav>



	<div class="page-container"><!-- /page container -->
		
		{if $templatefile eq 'homepage' or $pagetype eq 'clouder' or $carttpl eq 'clouder-default'}{else}
		<div class="mass-head">
			<div class="hero-bg-wrap style-2 bg-opacity">
				{if $skipMainBodyContainer}{else}
				<div class="container">
					<div class="page-title">
						<h1>
							{$pagetitle}
						</h1>
					</div>
				</div>
				{/if}
			</div>
		</div>
		{/if}
		{if $skipMainBodyContainer}{else}
			{if $templatefile eq 'homepage' or $pagetype eq 'clouder' or $carttpl eq 'clouder-default'}{else}
			<div class="container">
				<div class="block-s3 {if ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren() || $skipMainBodyContainer)}{else}main-container-nosidebar{/if} {if $templatefile == 'clientregister'}main-container-nosidebar{/if}">
				<div class="row">
				{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
					{if $primarySidebar->hasChildren() && !$skipMainBodyContainer}
						<div class="{if $templatefile !== 'clientregister'}col-md-9 pull-md-right{else}col-md-12{/if}">
							{include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
						</div>
					{/if}
					{if $templatefile !== 'clientregister'}
					<div class="col-md-3 pull-md-left sidebar sidebar-primary">
						{include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
					</div>
					{/if}
				{/if}
				<!-- Container for main page display content -->
				{if $templatefile !== 'clientregister'}
				<div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-md-9 pull-md-right{else}col-xs-12{/if} main-content">
					{if !$primarySidebar->hasChildren() && !$showingLoginPage && !$inShoppingCart && $templatefile != 'homepage' && !$skipMainBodyContainer}
						{include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
					{/if}
					
				{else}
				<div class="col-xs-12 main-content">
				{/if}
			{/if}
		{/if}
		
{/if}