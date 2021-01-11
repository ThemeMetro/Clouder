{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

{include file="$template/includes/flashmessage.tpl"}

<div class="tiles clearfix">
    <div class="row">
        <div class="col-sm-3 col-xs-6 tile" onclick="window.location='clientarea.php?action=services'">
            <a href="clientarea.php?action=services">
                <div class="icon"><i class="fas fa-cube"></i></div>
                <div class="stat">{$clientsstats.productsnumactive}</div>
                <div class="title">{$LANG.navservices}</div>
                <div class="highlight bg-color-blue"></div>
            </a>
        </div>
        {if $registerdomainenabled || $transferdomainenabled}
            <div class="col-sm-3 col-xs-6 tile" onclick="window.location='clientarea.php?action=domains'">
                <a href="clientarea.php?action=domains">
                    <div class="icon"><i class="fas fa-globe"></i></div>
                    <div class="stat">{$clientsstats.numactivedomains}</div>
                    <div class="title">{$LANG.navdomains}</div>
                    <div class="highlight bg-color-green"></div>
                </a>
            </div>
        {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
            <div class="col-sm-3 col-xs-6 tile" onclick="window.location='affiliates.php'">
                <a href="affiliates.php">
                    <div class="icon"><i class="fas fa-shopping-cart"></i></div>
                    <div class="stat">{$clientsstats.numaffiliatesignups}</div>
                    <div class="title">{$LANG.affiliatessignups}</div>
                    <div class="highlight bg-color-green"></div>
                </a>
            </div>
        {else}
            <div class="col-sm-3 col-xs-6 tile" onclick="window.location='clientarea.php?action=quotes'">
                <a href="clientarea.php?action=quotes">
                    <div class="icon"><i class="far fa-file-alt"></i></div>
                    <div class="stat">{$clientsstats.numquotes}</div>
                    <div class="title">{$LANG.quotes}</div>
                    <div class="highlight bg-color-green"></div>
                </a>
            </div>
        {/if}
        <div class="col-sm-3 col-xs-6 tile" onclick="window.location='supporttickets.php'">
            <a href="supporttickets.php">
                <div class="icon"><i class="fas fa-comments"></i></div>
                <div class="stat">{$clientsstats.numactivetickets}</div>
                <div class="title">{$LANG.navtickets}</div>
                <div class="highlight bg-color-red"></div>
            </a>
        </div>
        <div class="col-sm-3 col-xs-6 tile" onclick="window.location='clientarea.php?action=invoices'">
            <a href="clientarea.php?action=invoices">
                <div class="icon"><i class="fas fa-credit-card"></i></div>
                <div class="stat">{$clientsstats.numunpaidinvoices}</div>
                <div class="title">{$LANG.navinvoices}</div>
                <div class="highlight bg-color-gold"></div>
            </a>
        </div>
    </div>
</div>

<form role="form" method="post" action="clientarea.php?action=kbsearch">
    <div class="row">
        <div class="col-md-12 home-kb-search">
            <input type="text" name="search" class="form-control input-lg" placeholder="{$LANG.clientHomeSearchKb}" />
            <i class="fas fa-search"></i>
        </div>
    </div>
</form>

{foreach from=$addons_html item=addon_html}
    <div>
        {$addon_html}
    </div>
{/foreach}

<div class="client-home-panels">
    <div class="row">
        <div class="col-sm-6 col-xs-12">

            {function name=outputHomePanels}
                <div menuItemName="{$item->getName()}" class="panel {if $item->getName() == "Overdue Invoices" or $item->getName() == "Domains Expiring Soon"}panel-warning{else}panel-default{/if} {if $item->getName() == "Register a New Domain"}panel-domain-register{/if}" {if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
					{if $item->getName() == "Register a New Domain"}
						<span class="fal fa-globe"></span>
					{/if}
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                                <div class="pull-right">
                                    <a href="{$item->getExtra('btn-link')}" data-toggle="tooltip" data-title="{$item->getExtra('btn-text')}" data-container="body">
                                        {if $item->getExtra('btn-icon')}<i class="{$item->getExtra('btn-icon')}"></i>{/if}
                                        {*{$item->getExtra('btn-text')}*}
                                    </a>
                                </div>
                            {/if}
                            {if $item->getName() !== "Register a New Domain"}{if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}{/if}
                            {$item->getLabel()}
                            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                        </h3>
                    </div>
                    {if $item->hasBodyHtml()}
                        <div class="panel-body">
							{if $item->getName() == "Register a New Domain"}
								{$item->getBodyHtml()|replace:'name="domain"':'name="domain" placeholder="domain name"'|replace:'domain name':{$LANG.findyourdomain}}
								 <p>{$LANG.orderForm.transferExtend}*</p>
							{else}
								{$item->getBodyHtml()}
							{/if}
                        </div>
                    {/if}
                    {if $item->hasChildren()}
                        <div class="list-group{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getUri()}
                                    <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </a>
                                {else}
                                    <div menuItemName="{$childItem->getName()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    {/if}
                    
                    {if $item->hasFooterHtml()}
						<div class="panel-footer">
							{$item->getFooterHtml()}
						</div>
                    {/if}
                    
                </div>
            {/function}

            {foreach $panels as $item}
                {if $item@iteration is odd}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
        <div class="col-sm-6 col-xs-12">

            {foreach $panels as $item}
                {if $item@iteration is even}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
    </div>
</div>
