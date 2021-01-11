{include file="orderforms/{$carttpl}/common.tpl"}

{if file_exists("templates/orderforms/{$carttpl}/layouts/head.tpl")}
	{include file="templates/orderforms/{$carttpl}/layouts/head.tpl"}
{/if}

<div id="order-standard_cart">
	<div class="alert-lg no-data">
	
		<div class="text">
			<h4>{$LANG.orderreceived}</h4>
			
			<div class="alert alert-info order-confirmation">
				 {$LANG.ordernumberis} <span>{$ordernumber}</span>
			</div>
			<p>{$LANG.orderfinalinstructions}</p>

            {if $expressCheckoutInfo}
                <div class="alert alert-info text-center">
                    {$expressCheckoutInfo}
                </div>
            {elseif $expressCheckoutError}
                <div class="alert alert-danger text-center">
                    {$expressCheckoutError}
                </div>
            {elseif $invoiceid && !$ispaid}
                <div class="alert alert-warning text-center">
                    {$LANG.ordercompletebutnotpaid}
                    <br /><br />
                    <a href="viewinvoice.php?id={$invoiceid}" target="_blank" class="alert-link">
                        {$LANG.invoicenumber}{$invoiceid}
                    </a>
                </div>
            {/if}
		</div>
		
		{foreach $addons_html as $addon_html}
			<div class="order-confirmation-addon-output">
				{$addon_html}
			</div>
		{/foreach}

		{if $ispaid}
		<!-- Enter any HTML code which should be displayed when a user has completed checkout here -->
		<!-- Common uses of this include conversion and affiliate tracking scripts -->
		{/if}

            
		<a href="clientarea.php" class="btn btn-default">
			{$LANG.orderForm.continueToClientArea}
		</a>
            
	</div>
</div>

{if file_exists("templates/orderforms/{$carttpl}/layouts/foot.tpl")}
	{include file="templates/orderforms/{$carttpl}/layouts/foot.tpl"}
{/if}
