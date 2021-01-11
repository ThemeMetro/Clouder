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
    <title>{$companyname} - {$pagetitle}</title>
	
	
	{include file="templates/$template/includes/head.tpl"}

</head>
<body style="margin: 0;">

	<div class="container {if $status !== "Unpaid"}main-container-nosidebar{/if}" style="margin: 15px auto;">
		{if $invalidInvoiceIdRequested}
			{include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.invoiceserror bodyTextCenter=true}
		{else}
			<div class="row">
			
				{if $status eq "Unpaid"}
				<div class="col-md-3 sidebar hidden-print">
					<div menuitemname="Client Details" class="panel panel-sidebar panel-invoice-info">
						<div class="panel-body">
							<div class="total">
								<span class="text-muted">{$LANG.invoicestotaldue}</span> 
								<span class="total-price">{$balance}</span>
							</div>
							{if $status eq "Unpaid" && $allowchangegateway}
								<label>{$LANG.orderpaymentmethod}:</label>
								<form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
									<div class="form-group">
										{$gatewaydropdown}
									</div>
								</form>
							{else}
								{$paymentmethod}{if $paymethoddisplayname} ({$paymethoddisplayname}){/if}
							{/if}
							{if $status eq "Unpaid" || $status eq "Draft"}
								<div class="payment-form">
									{$paymentbutton}
								</div>
							{/if}
						</div>
					</div>

					{if $manualapplycredit}
						<div menuitemname="Add Funds" class="panel panel-sidebar panel-invoice-info panel-apply-credit">
							<div class="panel-body">
								<form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
									<input type="hidden" name="applycredit" value="true">                              
									<div class="total">
										<span class="text-muted">{$LANG.invoiceaddcreditdesc1}:</span>
										<span class="total-price">{$totalcredit}</span>
									</div>
									<div class="form-group">
										<label class="control-label">{$LANG.invoiceaddcreditamount}</label>
										<div class="input-group">
											<input type="text" name="creditamount" value="{$creditamount}" class="form-control" />
											<span class="input-group-btn">
												<input type="submit" value="{$LANG.invoiceaddcreditapply}" class="btn btn-success" />
											</span>
										</div>
									</div>
								</form>    
							</div>
						</div>
					{/if}
				</div>
				{/if}
				
				<div class="{if $status eq "Unpaid"}col-md-9{else}col-md-12{/if}">				
					<div class="TM-card invoice" style="padding: 45px 30px;">
						
						<div class="company-logo">
							{if $logo}
								<img src="{$logo}" title="{$companyname}" />
							{else}
								<h2>{$companyname}</h2>
							{/if}
						</div>
						
						
						
						{if $paymentSuccessAwaitingNotification}
							{include file="$template/includes/alert.tpl" type="success" msg=$LANG.invoicePaymentSuccessAwaitingNotify}
						{elseif $paymentSuccess}
							{include file="$template/includes/alert.tpl" type="success" msg=$LANG.invoicepaymentsuccessconfirmation}
						{elseif $pendingReview}
							{include file="$template/includes/alert.tpl" type="info" msg=$LANG.invoicepaymentpendingreview}
						{elseif $paymentFailed}
							{include file="$template/includes/alert.tpl" type="danger" msg=$LANG.invoicepaymentfailedconfirmation}
						{elseif $offlineReview}
							{include file="$template/includes/alert.tpl" type="info" msg=$LANG.invoiceofflinepaid}
						{/if}
						<div class="section">
							<div class="invoice-info">
								<div class="invoice-title">
									<span class="title"> {$pagetitle}
										{if $status eq "Draft"}
											<span class="invoice-status label label-info">{$LANG.invoicesdraft}</span>                                    
										{elseif $status eq "Unpaid"}
											<span class="invoice-status label label-danger">{$LANG.invoicesunpaid}</span>
										{elseif $status eq "Paid"}
											<span class="invoice-status label label-success">{$LANG.invoicespaid}</span>                                   
										{elseif $status eq "Refunded"}
											<span class="invoice-status label label-info">{$LANG.invoicesrefunded}</span>                                          
										{elseif $status eq "Cancelled"}
											<span class="invoice-status label label-info">{$LANG.invoicescancelled}</span>         
										{elseif $status eq "Collections"}
											<span class="invoice-status label label-info">{$LANG.invoicescollections}</span>         
										{elseif $status eq "Payment Pending"}
											<span class="invoice-status label label-warning">{$LANG.invoicesPaymentPending}</span>          
										{/if}
									</span>
								</div>
								<div class="invoice-date">
									<div class="pull-right">
										<div class="text-right">
											<strong>{$LANG.invoicesdatecreated}</strong><br />
											<span class="text-muted">{$date}</span>
										</div>
										{if $status eq "Unpaid" || $status eq "Draft"}
											<div class="text-right">
												<strong>{$LANG.invoicesdatedue}</strong><br />
												<span class="text-muted">{$datedue}</span>
											</div>
										{/if}
										{if $status neq "Unpaid"}
											<div class="text-right">
												<strong>{$LANG.orderpaymentmethod}</strong><br />
												<span class="text-muted">{$paymentmethod}{if $paymethoddisplayname} ({$paymethoddisplayname}){/if}</span>
											</div>
										{/if}
									</div>
								</div>
							</div>
						</div>
						
						
						
						<div class="section">
							<div class="row">
								<div class="col-sm-7">
									<h4>{$LANG.invoicespayto}:</h4>
									<address>
										{$payto}
										{if $taxCode}<br />{$taxIdLabel}: {$taxCode}{/if}
									</address>
								</div>
								<div class="col-sm-5">
									<h4>{$LANG.invoicesinvoicedto}:</h4>
									<address> {if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
											{$clientsdetails.firstname} {$clientsdetails.lastname}<br />
											{$clientsdetails.address1}, {$clientsdetails.address2}<br />
											{$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
											{$clientsdetails.country}
											{if $clientsdetails.tax_id}<br />{$taxIdLabel}: {$clientsdetails.tax_id}{/if}
											{if $customfields}
											<br /><br />
											{foreach from=$customfields item=customfield}
											{$customfield.fieldname}: {$customfield.value}<br />
											{/foreach}
											{/if}
									</address>
								</div>
							</div>
						</div>
						
						
						{if $notes}
						   <div class="section">
								{include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.invoicesnotes bodyContent=$notes}
							</div>
						{/if}
						
						<div class="section">
							<h4>{$LANG.invoicelineitems}</h4>
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>{$LANG.invoicesdescription}</th>
											<th width="20%" class="text-center">{$LANG.invoicesamount}</th>
										</tr>
									</thead>
									<tbody>
										{foreach from=$invoiceitems item=item}
											<tr>
												<td>{$item.description}{if $item.taxed eq "true"} *{/if}</td>
												<td class="text-center">{$item.amount}</td>
											</tr>
										{/foreach}
										<tr>
											<td class="total-row text-right"><strong>{$LANG.invoicessubtotal}</strong></td>
											<td class="total-row text-center">{$subtotal}</td>
										</tr>
										{if $taxname}
											<tr>
												<td class="total-row text-right"><strong>{$taxrate}% {$taxname}</strong></td>
												<td class="total-row text-center">{$tax}</td>
											</tr>
										{/if}
										{if $taxname2}
											<tr>
												<td class="total-row text-right"><strong>{$taxrate2}% {$taxname2}</strong></td>
												<td class="total-row text-center">{$tax2}</td>
											</tr>
										{/if}
										<tr>
											<td class="total-row text-right"><strong>{$LANG.invoicescredit}</strong></td>
											<td class="total-row text-center">{$credit}</td>
										</tr>
										<tr class="active">
											<td class="total-row text-right"><strong>{$LANG.invoicestotal}</strong></td>
											<td class="total-row text-center">{$total}</td>
										</tr>
									</tbody>
								</table>
							</div>
							{if $taxrate}
								<p class="text-muted">* {$LANG.invoicestaxindicator}</p>
							{/if}
						</div>

						<div class="section">
							<h4>{$LANG.invoicestransactions}</h4>
							<div class="table-responsive">    
								<table class="table table-hover">
									<thead>
										<tr>
											<th><strong>{$LANG.invoicestransdate}</strong></th>
											<th><strong>{$LANG.invoicestransgateway}</strong></th>
											<th><strong>{$LANG.invoicestransid}</strong></th>
											<th><strong>{$LANG.invoicestransamount}</strong></th>
										</tr>
									</thead>
									<tbody>
										{foreach from=$transactions item=transaction}
											<tr>
												<td>{$transaction.date}</td>
												<td>{$transaction.gateway}</td>
												<td>{$transaction.transid}</td>
												<td>{$transaction.amount}</td>
											</tr>
										{foreachelse}
											<tr>
												<td colspan="4">{$LANG.invoicestransnonefound}</td>
											</tr>
										{/foreach}
										<tr class="total-row active">
											<td></td>
											<td></td>
											<td><strong>{$LANG.invoicesbalance}</strong></td>
											<td>{$balance}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<div class="text-center margin-bottom">
						<div class="btn-group btn-group-sm hidden-print">
							<a href="clientarea.php?action=invoices" class="btn btn-default">{$LANG.clientareabacklink}</a></a>
							{*<a href="javascript:window.print()" class="btn btn-default"><i class="fas fa-print"></i> {$LANG.print}</a>*}
							<a href="dl.php?type=i&amp;id={$invoiceid}" class="btn btn-default"><i class="fas fa-download"></i> {$LANG.invoicesdownload}</a>
						</div>
					</div>
				
				</div>
				
			</div>
		{/if}
	</div>

</body>
</html>
