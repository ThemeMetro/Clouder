{include file="orderforms/{$carttpl}/common.tpl"}


{if file_exists("templates/orderforms/{$carttpl}/layouts/head.tpl")}
	{include file="templates/orderforms/{$carttpl}/layouts/head.tpl"}
{/if}

<div id="order-standard_cart">
    <div class="row">

        <div class="col-md-12">
			{if file_exists("templates/orderforms/{$carttpl}/layouts/head.tpl")}
			{else}
            <div class="header-lined">
                <h1>
                    {if $totalResults > 1}{lang key='domainrenewals'}{else}{lang key='domainrenewal'}{/if}
                    {if $totalResults > 5}
                        <div class="pull-right">
                            <input id="domainRenewalFilter" type="search" class="domain-renewals-filter form-control input-inline-100" placeholder="{lang key='searchenterdomain'}">
                        </div>
                    {/if}
                </h1>
            </div>
			{/if}

        </div>

        <div class="col-md-12">

            {include file="orderforms/{$carttpl}/sidebar-categories-collapsed.tpl"}

            {if $totalDomainCount == 0}
                <div id="no-domains" class="alert alert-warning text-center" role="alert">
                    {$LANG.domainRenewal.noDomains}
                </div>
                <p class="text-center">
                    <a href="clientarea.php" class="btn btn-default">
                        <i class="fas fa-arrow-circle-left"></i>
                        {$LANG.orderForm.returnToClientArea}
                    </a>
                </p>
            {else}
                <div class="row">
                    <div class="col-md-9">
                        {if $totalResults < $totalDomainCount}
                            <div class="text-center">
                                {lang key='domainRenewal.showingDomains' showing=$totalResults totalCount=$totalDomainCount}
                                <a id="linkShowAll" href="{routePath('cart-domain-renewals')}">{lang key='domainRenewal.showAll'}</a>
                            </div>
                        {/if}

                        <div id="domainRenewals" class="domain-renewals">
                            {foreach $renewalsData as $renewalData}
                                <div class="domain-renewal" data-domain="{$renewalData.domain}">
                                    <div class="pull-right">
                                        {if !$renewalData.eligibleForRenewal}
                                            <span class="label label-info">
                                                {lang key='domainRenewal.unavailable'}
                                            </span>
                                        {elseif ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod)}
                                            <span class="label label-info">
                                                {lang key='domainrenewalspastgraceperiod'}
                                            </span>
                                        {elseif !$renewalData.beforeRenewLimit && $renewalData.daysUntilExpiry > 0}
                                            <span class="label label-{if $renewalData.daysUntilExpiry > 30}success{else}warning{/if}">
                                                {lang key='domainRenewal.expiringIn' days=$renewalData.daysUntilExpiry}
                                            </span>
                                        {elseif $renewalData.daysUntilExpiry === 0}
                                            <span class="label label-grey">
                                                {lang key='expiresToday'}
                                            </span>
                                        {elseif $renewalData.beforeRenewLimit}
                                            <span class="label label-info">
                                                {lang key='domainRenewal.maximumAdvanceRenewal' days=$renewalData.beforeRenewLimitDays}
                                            </span>
                                        {else}
                                            <span class="label label-danger">
                                                {lang key='domainRenewal.expiredDaysAgo' days=$renewalData.daysUntilExpiry*-1}
                                            </span>
                                        {/if}
                                    </div>

                                    <h4 class="no-margin-bottom">{$renewalData.domain}</h4>
                                    <p class="small text-muted">{lang key='clientareadomainexpirydate'}: {$renewalData.expiryDate->format('j M Y')} ({$renewalData.expiryDate->diffForHumans()})</p>

                                    {if ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod) || !count($renewalData.renewalOptions)}
                                    {else}
                                    <form>
                                        <div class="form-group row">
                                            <label for="renewalPricing{$renewalData.id}" class="control-label col-md-5">
                                                {lang key='domainRenewal.availablePeriods'}
                                                {if $renewalData.inGracePeriod || $renewalData.inRedemptionGracePeriod}
                                                    *
                                                {/if}
                                            </label>
                                            <div class="col-sm-12">
                                                <select class="form-control select-renewal-pricing" id="renewalPricing{$renewalData.id}" data-domain-id="{$renewalData.id}">
                                                    {foreach $renewalData.renewalOptions as $renewalOption}
                                                        <option value="{$renewalOption.period}">
                                                            {$renewalOption.period} {lang key='orderyears'} @ {$renewalOption.rawRenewalPrice}
                                                            {if $renewalOption.gracePeriodFee && $renewalOption.gracePeriodFee->toNumeric() != 0.00}
                                                                + {$renewalOption.gracePeriodFee} {lang key='domainRenewal.graceFee'}
                                                            {/if}
                                                            {if $renewalOption.redemptionGracePeriodFee && $renewalOption.redemptionGracePeriodFee->toNumeric() != 0.00}
                                                                + {$renewalOption.redemptionGracePeriodFee} {lang key='domainRenewal.redemptionFee'}
                                                            {/if}
                                                        </option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                    {/if}

                                    <div class="text-right">
                                        {if !$renewalData.eligibleForRenewal || $renewalData.beforeRenewLimit || ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod)}
                                        {else}
                                            <button id="renewDomain{$renewalData.id}" class="btn btn-primary btn-sm btn-add-renewal-to-cart" data-domain-id="{$renewalData.id}">
                                                <span class="to-add">
                                                    <i class="fas fa-fw fa-spinner fa-spin"></i>
                                                    {lang key='addtocart'}
                                                </span>
                                                <span class="added">{lang key='domaincheckeradded'}</span>
                                            </button>
                                        {/if}
                                    </div>
                                </div>
                            {/foreach}
                        </div>

						{if $hasDomainsInGracePeriod}
							<div class="text-center">
								 * {lang key='domainRenewal.graceRenewalPeriodDescription'}
							</div>
						{/if}
                    </div>

                    <div class="col-md-3" id="scrollingPanelContainer">

                        <div id="orderSummary">
                            <div class="order-summary">
                                <div class="loader" id="orderSummaryLoader">
                                    <i class="fas fa-fw fa-sync fa-spin"></i>
                                </div>
                                <h2>{lang key='ordersummary'}</h2>
                                <div class="summary-container" id="producttotal"></div>
                            </div>
                            <div class="text-center">
                                <a id="btnGoToCart" class="btn btn-primary btn-lg" href="{$WEB_ROOT}/cart.php?a=view">
                                    {lang key='viewcart'}
                                    <i class="glyphicon glyphicon-shopping-cart"></i>
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            {/if}
        </div>
    </div>
    <form id="removeRenewalForm" method="post" action="{$WEB_ROOT}/cart.php">
        <input type="hidden" name="a" value="remove" />
        <input type="hidden" name="r" value="" id="inputRemoveItemType" />
        <input type="hidden" name="i" value="" id="inputRemoveItemRef" />
        <div class="modal fade modal-remove-item" id="modalRemoveItem" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='orderForm.close'}">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title">
                            <span>{lang key='orderForm.removeItem'}</span>
                        </h4>
                    </div>
                    <div class="modal-body">
                        {lang key='cartremoveitemconfirm'}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">{lang key='no'}</button>
                        <button type="submit" class="btn btn-primary">{lang key='yes'}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

{if file_exists("templates/orderforms/{$carttpl}/layouts/foot.tpl")}
	{include file="templates/orderforms/{$carttpl}/layouts/foot.tpl"}
{/if}

<script>recalculateRenewalTotals();</script>
