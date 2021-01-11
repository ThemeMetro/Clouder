{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

	
<form method="post" action="clientarea.php?action=masspay">
    <input type="hidden" name="geninvoice" value="true" />

	<h4>{$LANG.masspaymentselectgateway}</h4>
	
	<div class="row">
        <div class="col-sm-6">
			<div class="TM-card">
				 <fieldset>
					<div class="form-group">
						<label for="paymentmethod" class="control-label">{$LANG.orderpaymentmethod}:</label><br/>
						<select name="paymentmethod" id="paymentmethod" class="form-control">
							{foreach from=$gateways item=gateway}
								<option value="{$gateway.sysname}">{$gateway.name}</option>
							{/foreach}
						</select>
					</div>
					<div class="form-group">
						<input type="submit" value="{$LANG.masspaymakepayment}" class="btn btn-primary btn-block" />
					</div>
				</fieldset>
			</div>
		</div>
	</div>
	
	<h4>{$clientsstats.numunpaidinvoices} {$LANG.clientHomePanels.unpaidInvoices}</h4>
	<div class="TM-card">
		<table class="table table-condensed table-hover table-masspay">

			<thead>
				<tr>
					<th>{$LANG.invoicesdescription}</th>
					<th>{$LANG.invoicesamount}</th>
				</tr>
			</thead>
			<tbody>
				{foreach from=$invoiceitems key=invid item=invoiceitem}
					<tr>
						<td colspan="2">
							<a href="viewinvoice.php?id={$invid}">
								<h5><i class="fal fa-external-link"></i>{$LANG.invoicenumber} {if $invoiceitem.0.invoicenum}{$invoiceitem.0.invoicenum}{else}{$invid}{/if}</h5>
							</a>
							<input type="hidden" name="invoiceids[]" value="{$invid}" />
						</td>
					</tr>
					{foreach from=$invoiceitem item=item}
						<tr class="item-description">
							<td>{$item.description}</td>
							<td>{$item.amount}</td>
						</tr>
					{/foreach}
				{foreachelse}
					<tr>
						<td colspan="6" align="center">{$LANG.norecordsfound}</td>
					</tr>
				{/foreach}
				<tr class="masspay-total">
					<td class="text-right">{$LANG.invoicessubtotal}:</td>
					<td>{$subtotal}</td>
				</tr>
				{if $tax}
					<tr class="masspay-total">
						<td class="text-right">{$taxrate1}% {$taxname1}:</td>
						<td>{$tax}</td>
					</tr>
				{/if}
				{if $tax2}
					<tr class="masspay-total">
						<td class="text-right">{$taxrate2}% {$taxname2}:</td>
						<td>{$tax2}</td>
					</tr>
				{/if}
				{if $credit}
					<tr class="masspay-total">
						<td class="text-right">{$LANG.invoicescredit}:</td>
						<td>{$credit}</td>
					</tr>
				{/if}
				{if $partialpayments}
					<tr class="masspay-total">
						<td class="text-right">{$LANG.invoicespartialpayments}:</td>
						<td>{$partialpayments}</td>
					</tr>
				{/if}
				<tr class="masspay-total">
					<td class="text-right">{$LANG.invoicestotaldue}:</td>
					<td>{$total}</td>
				</tr>
			</tbody>
		</table>
	</div>

</form>