<div class="mass-head">
	<div class="block-s5 no-padding-top hero-bg-wrap style-2 bg-opacity">
		<div class="container">		
			
			{if $templatefile == "products"}
				<div class="page-title" style="text-align: left; padding: 35px 15px;">
					<h1>
					{if $productGroup.headline}
						{$productGroup.headline}
					{else}
						{$productGroup.name}
					{/if}
					</h1>
					{if $productGroup.tagline}
						<h4 class="text-muted">{$productGroup.tagline}</h4>
					{/if}
				</div>
				{if $showSidebarToggle}					
					<div class="padding-all text-center">			
						<a data-toggle="modal" data-target="#cat-opt" class="btn btn-default">
							<i class="fas fa-plus"></i> {$LANG.showMenu}
						</a>
					</div>
				{/if}			
			
			{else}
			
			<div class="page-title" style="text-align: left; padding: 35px 15px;">
				{if $templatefile == "adddomain"}
					<h1>
						{if $domain eq "register"}
						   {$LANG.registerdomain}
						{elseif $domain eq "transfer"}
							{$LANG.transferdomain}
						{/if}
					</h1>
				{elseif $templatefile == "addons"}
					<h1>{$LANG.cartproductaddons}</h1>	
				{elseif $templatefile == "checkout"}
					<h1>{if !$checkout}{$LANG.cartreviewcheckout}{else}{$LANG.orderForm.checkout}{/if}</h1>	
				{elseif $templatefile == "complete"}
					<h1>{$LANG.orderconfirmation}</h1>		
				{elseif $templatefile == "configuredomains"}
					<h1>{$LANG.cartdomainsconfig}</h1>
					<p class="hidden-xs">{$LANG.orderForm.reviewDomainAndAddons}</p>
				{elseif $templatefile == "configureproduct"}
					<h1>{$LANG.orderconfigure}</h1>
				{elseif $templatefile == "configureproductdomain"}
					<h1>{$LANG.domaincheckerchoosedomain}</h1>
				{elseif $templatefile == "domainregister"}
					<h1>{$LANG.registerdomain}</h1>
					<p>{$LANG.orderForm.findNewDomain}</p>
				{elseif $templatefile == "domain-renewals"}
					<h1>
						{if $totalResults > 1}{lang key='domainrenewals'}{else}{lang key='domainrenewal'}{/if}
						{if $totalResults > 5}
							<div class="pull-right">
								<input id="domainRenewalFilter" type="search" class="domain-renewals-filter form-control input-inline-100" placeholder="{lang key='searchenterdomain'}">
							</div>
						{/if}
					</h1>
				{elseif $templatefile == "domaintransfer"}
					<h1>{lang key='orderForm.transferToUs'}</h1>
					<p>{lang key='orderForm.transferExtend'}*</p>
				{elseif $templatefile == "fraudcheck"}
					<h1>{$LANG.cartfraudcheck}</h1>
				{elseif $templatefile == "viewcart"}
				<h1>{if !$checkout}{$LANG.cartreviewcheckout}{else}{$LANG.orderForm.checkout}{/if}</h1>
				{elseif $templatefile == "error"}
					<h1>{$LANG.thereisaproblem}</h1>
				
				{/if}	
			</div>

			{/if}
			<div class="space-32 visible-xs"></div>			
		</div>
	</div>
</div>

<div class="block-s3 margin-up light">
	<div class="container">	
		<div class="TM-pricing-container">		
			<div class="pricing-box">
				<div class="slide-item">
					<div class="TMC-pricing-table">