{foreach $sidebar as $item}

{if $item->getName() == "My Services Status Filter" or $item->getName() == "My Domains Status Filter" or $item->getName() == "My Invoices Status Filter" or $item->getName() == "Ticket List Status Filter" or $item->getName() == "Support Knowledgebase Categories" or $item->getName() == "Popular Downloads" or $item->getName() == "My Quotes Status Filter" or $item->getName() == "Add Funds"}

{elseif $item->getName() == "Sitelock Sidebar Promo" or $item->getName() == "Codeguard Sidebar Promo" or $item->getName() == "Spamexperts Sidebar Promo" or $item->getName() == "Ssl Sidebar Promo" or $item->getName() == "Weebly Sidebar Promo" or $item->getName() == "Sitelockvpn Sidebar Promo" or $item->getName() == "Marketgoo Sidebar Promo" or $item->getName() == "Network Status" or $item->getName() == "Ox Sidebar Promo"}

	

{else}
    <div menuItemName="{$item->getName()}" class="panel panel-sidebar {if $item->getName() == "Ticket Information" or $item->getName() == "Recent Tickets"}panel-ticket-info{/if}{if $item->getName() == "My Invoices Summary"}panel-invoice-info{/if}{if $item->getName() == "Client Details"}panel-client-details{/if}{if $item->getName() == "Upgrade Downgrade"}panel-primary{/if}{if $item->getName() == "Client Contacts"}panel-client-contacts{/if} {if $item->getClass()}{$item->getClass()}{else}panel-sidebar{/if}{if $item->getExtra('mobileSelect') and $item->hasChildren()} hidden-sm hidden-xs{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
        <div class="panel-heading">
            <h3 class="panel-title">
                {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                {$item->getLabel()}
                {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                <i class="fas fa-chevron-up panel-minimise pull-right"></i>
            </h3>
        </div>
        {if $item->hasBodyHtml()}
            <div class="panel-body">
                {$item->getBodyHtml()}
            </div>
        {/if}
        {if $item->hasChildren()}
            <div class="list-group{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
                {foreach $item->getChildren() as $childItem}
                    {if $childItem->getUri()}
                        <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item{if $childItem->isDisabled()} disabled{/if}{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                            {if $childItem->hasBadge()}<span class="badge">{$childItem->getBadge()}</span>{/if}
							{if $item->getName() == "Announcements Months"}
                                    {if $childItem->getName() != "Older" && $childItem->getName() != "RSS Feed"}
                                        <i class="far fa-calendar fa-fw"></i>&nbsp;

									{elseif $childItem->getName() == "Older"}
                                       <i class="far fa-history fa-fw"></i>&nbsp;									
									
                                    {else}
                                        {if $childItem->hasIcon()}
                                            <i class="{$childItem->getIcon()}"></i>&nbsp;
										{else}
											<i class="fas fa-puzzle-piece"></i>&nbsp;
                                        {/if}
                                    {/if}
									
							  {elseif $item->getName() == "Billing"}
							  
								{if $childItem->getName() == "Invoices"}
									<i class="fas fa-file-invoice fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Quotes"}
									<i class="fas fa-file-contract fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Mass Payment"}
									<i class="fas fa-money-check-alt fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Manage Credit Card"}
									<i class="fas fa-credit-card fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Add Funds"}
									<i class="fas fa-piggy-bank fa-fw"></i>&nbsp;
								{else}
									{if $childItem->hasIcon()}
                                        <i class="{$childItem->getIcon()}"></i>&nbsp;
									{else}
										<i class="fas fa-puzzle-piece"></i>&nbsp;
                                    {/if}
								{/if}
								
							  {elseif $item->getName() == "Client Contacts" or $item->getName() == "Recent Tickets"}
							  
								{if $childItem->hasIcon()}
                                     <i class="{$childItem->getIcon()}"></i>&nbsp;
                                 {/if}
								
							  {elseif $item->getName() == "Domain Details Management"}
							  
								{if $childItem->getName() == "Overview"}
									<i class="fas fa-tachometer-alt fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Auto Renew Settings"}
									<i class="fas fa-sync fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Modify Nameservers"}
									<i class="fas fa-file-edit fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Registrar Lock Status"}
									<i class="fas fa-lock-alt fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Domain Addons"}
									<i class="fas fa-layer-plus fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Domain Contacts"}
									<i class="fas fa-clipboard-list fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Manage Private Nameservers"}
									<i class="fas fa-file-edit fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Manage DNS Host Records"}
									<i class="fas fa-file-edit fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Manage Email Forwarding"}
									<i class="fas fa-share fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Get EPP Code"}
									<i class="fas fa-shield-alt fa-fw"></i>&nbsp;
								{else}
									{if $childItem->hasIcon()}
                                        <i class="{$childItem->getIcon()}"></i>&nbsp;
									{else}
										<i class="fas fa-puzzle-piece"></i>&nbsp;
                                    {/if}
								{/if}
								
							  {elseif $item->getName() == "Service Details Overview"}
									{if $childItem->getName() == "Information"}
										<i class="fas fa-tachometer-alt fa-fw"></i>&nbsp;
									{elseif $childItem->getName() == "Addons"}
										<i class="fas fa-layer-plus fa-fw"></i>&nbsp;
									{elseif $childItem->getName() == "Downloads"}
										<i class="fas fa-download fa-fw"></i>&nbsp;
									{else}
										{if $childItem->hasIcon()}
											<i class="{$childItem->getIcon()}"></i>&nbsp;
										{else}
											<i class="fas fa-puzzle-piece"></i>&nbsp;
										{/if}									
									{/if}
									
							  {elseif $item->getName() == "Service Details Actions"}
								{if $childItem->getName() == "Upgrade/Downgrade"}
									<i class="fas fa-share fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Upgrade/Downgrade Options"}
									<i class="fas fas fa-sliders-v fa-fw"></i>&nbsp;
								{elseif  $childItem->getName() == "Login to cPanel"}
									<i class="fas fa-sign-in-alt fa-fw"></i>&nbsp;
								{elseif  $childItem->getName() == "Login to Webmail"}
									<i class="fas fa-sign-in-alt fa-fw"></i>&nbsp;
								{elseif  $childItem->getName() == "Change Password"}
									<i class="fas fa-unlock fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Cancel"}
									<i class="fas fa-ban fa-fw"></i>&nbsp;
								{else}
									{if $childItem->hasIcon()}
                                        <i class="{$childItem->getIcon()}"></i>&nbsp;
										
									{else}
										<i class="fas fa-puzzle-piece"></i>&nbsp;
                                    {/if}								
								
								{/if}
								
							  {elseif $item->getName() == "Attachments"}
								<i class="fas fa-paperclip fa-fw"></i>&nbsp;
								
							  {elseif $item->getName() == "My Account"}
								{if $childItem->getName() == "My Details"}
									<i class="fas fa-user fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Billing Information"}
									<i class="fas fa-file-alt fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Contacts/Sub-Accounts"}
									<i class="fas fa-users fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Change Password"}
									<i class="fas fa-unlock fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Security Settings"}
									<i class="fas fa-shield-check fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Email History"}
									<i class="fas fa-envelope-open fa-fw"></i>&nbsp;									
								{else}
									{if $childItem->hasIcon()}
                                        <i class="{$childItem->getIcon()}"></i>&nbsp;
									{else}
										<i class="fas fa-puzzle-piece"></i>&nbsp;
                                    {/if}								
								
								{/if}
								
							  {elseif $item->getName() == "Account"}
								{if $childItem->getName() == "My Details"}
									<i class="fas fa-user fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "User Management"}
									<i class="fas fa-users fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Payment Methods"}
									<i class="fas fa-credit-card fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Contacts/Sub-Accounts"}
									<i class="fas fa-users fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Account Security"}
									<i class="fas fa-shield-alt fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Email History"}
									<i class="fas fa-envelope fa-fw"></i>&nbsp;
								{else}
									{if $childItem->hasIcon()}
                                        <i class="{$childItem->getIcon()}"></i>&nbsp;
									{else}
										<i class="fas fa-puzzle-piece"></i>&nbsp;
                                    {/if}	
								{/if}
								
							  {elseif $item->getName() == "Profile"}
								{if $childItem->getName() == "Your Profile"}
									<i class="fas fa-user fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Change Password"}
									<i class="fas fa-lock fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "User Security"}
									<i class="fas fa-shield-alt fa-fw"></i>&nbsp;
								{elseif $childItem->getName() == "Logout"}
									<i class="fas fa-power-off fa-fw text-danger"></i>&nbsp;
								{else}
									{if $childItem->hasIcon()}
                                        <i class="{$childItem->getIcon()}"></i>&nbsp;
									{else}
										<i class="fas fa-puzzle-piece"></i>&nbsp;
                                    {/if}	
								{/if}							  
                              {else}
                                    {if $childItem->hasIcon()}
                                        <i class="{$childItem->getIcon()}"></i>&nbsp;
									{else}
										<i class="fas fa-puzzle-piece"></i>&nbsp;
                                    {/if}
                             {/if}
                            {$childItem->getLabel()}
                        </a>
                    {else}
                        <div menuItemName="{$childItem->getName()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                            {if $childItem->hasBadge()}<span class="badge">{$childItem->getBadge()}</span>{/if}
                            {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                            {$childItem->getLabel()}
                        </div>
                    {/if}
                {/foreach}
            </div>
        {/if}
        {if $item->hasFooterHtml()}
            <div class="panel-footer clearfix">
                {$item->getFooterHtml()}
            </div>
        {/if}
    </div>
   {*  {if $item->getExtra('mobileSelect') and $item->hasChildren()}
        <div class="panel hidden-lg hidden-md {if $item->getClass()}{$item->getClass()}{else}panel-default{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
            <div class="panel-heading">
                <h3 class="panel-title">
                    {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                    {$item->getLabel()}
                    {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                </h3>
            </div>
            <div class="panel-body">
                <form role="form">
                    <select class="form-control" onchange="selectChangeNavigate(this)">
                        {foreach $item->getChildren() as $childItem}
                            <option menuItemName="{$childItem->getName()}" value="{$childItem->getUri()}" class="list-group-item" {if $childItem->isCurrent()}selected="selected"{/if}>
                                {$childItem->getLabel()}
                                {if $childItem->hasBadge()}({$childItem->getBadge()}){/if}
                            </option>
                        {/foreach}
                    </select>
                </form>
            </div>
            {if $item->hasFooterHtml()}
                <div class="panel-footer">
                    {$item->getFooterHtml()}
                </div>
            {/if}
        </div>
    {/if} *}
{/if}
{/foreach}

{if $templatefile eq "clientareaproducts"}
	<div id="promotions-slider-sidebar" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner" role="listbox">
			{foreach $sidebar as $item}
				{if $item->hasBodyHtml() or $setting == "product-list" }
					<div class="item">
						<div menuItemName="{$item->getName()}" class="panel panel-sidebar {if $item->getClass()}{$item->getClass()}{else}panel-sidebar{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
							<div class="panel-body">
								{$item->getBodyHtml()}
							</div>
						</div>
					</div>
				{/if}
			{/foreach}
		</div>
	</div>

	<script>
		jQuery('#promotions-slider-sidebar .item:first-child').addClass('active');
	</script>
{/if}
