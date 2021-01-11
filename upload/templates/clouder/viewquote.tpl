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
    <title>{$companyname} - {$LANG.quotenumber}{$id}</title>
	
	
	{include file="templates/$template/includes/head.tpl"}

</head>
<body style="margin: 0;">
	
	<div class="container {if $stage neq "Delivered" && $stage neq "On Hold"}main-container-nosidebar{/if}" style="margin: 15px auto;">
		{if $invalidQuoteIdRequested}
			{include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.invoiceserror bodyTextCenter=true}
		{else}
			<div class="row">
				{if $stage eq "Delivered" || $stage eq "On Hold"}
				<div class="col-md-3 sidebar hidden-print">
					<div menuitemname="Client Details" class="panel panel-sidebar panel-invoice-info">
						<div class="panel-body">
							<div class="total">
								<span class="total-text">{$LANG.quotelinetotal}</span> 
								<span class="total-price">{$total}</span>
							</div>                 
							<button type="button" class="btn btn-primary btn-block"  {if $stage neq "Delivered" && $stage neq "On Hold"}disabled{/if}  data-toggle="modal" data-target="#acceptQuoteModal">
								{$LANG.quoteacceptbtn}
							</button>
						</div>
					</div>
				</div>
				{/if}
				
				<div class="{if $stage eq "Delivered" || $stage eq "On Hold"}col-md-9{else}col-md-12{/if}">
					<div class="TM-card quote" style="padding: 45px 30px;">
						{if $agreetosrequired}
							{include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.ordererroraccepttos bodyTextCenter=true}
						{/if}
						
						<div class="company-logo">
							{if $logo}
								<img src="{$logo}" title="{$companyname}" />
							{else}
								<h2>{$companyname}</h2>
							{/if}
						</div>
						
						<div class="section">
							<div class="quote-info">
								<div class="quote-title">
									<span class="title"> {$LANG.quotenumber}{$id}
										{if $stage eq "Delivered"}
											<span class="invoice-status label label-lg label-success">{$LANG.quotestagedelivered}</span>
										{elseif $stage eq "Accepted"}
											<span class="invoice-status label label-lg label-success">{$LANG.quotestageaccepted}</span>
										{elseif $stage eq "On Hold"}
											<span class="invoice-status label label-lg label-warning">{$LANG.quotestageonhold}</span>                           
										{elseif $stage eq "Lost"}
											<span class="invoice-status label label-lg label-danger">{$LANG.quotestagelost}</span>
										{elseif $stage eq "Dead"}
											<span class="invoice-status label label-lg label-danger">{$LANG.quotestagedead}</span>
										{/if}
									</span>
								</div>
								<div class="quote-date">
									<div class="pull-right">
										<div class="text-right">
											<strong>{$LANG.quotedatecreated}</strong><br />
											<span class="text-muted">{$datecreated}</span>
										</div>
										<div class="text-right">
											<strong>{$LANG.quotevaliduntil}</strong><br />
											<span class="text-muted">{$validuntil}</span>
										</div>
									</div>
								</div>
							</div>    
						</div>
						<div class="section">
							<div class="row">
								<div class="col-sm-7">
									<h4>{$LANG.quoterecipient}</h4>
									<address>
										{if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
										{$clientsdetails.firstname} {$clientsdetails.lastname}<br />
										{$clientsdetails.address1}, {$clientsdetails.address2}<br />
										{$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
										{$clientsdetails.country}
										{if $customfields}
										<br /><br />
										{foreach from=$customfields item=customfield}
										{$customfield.fieldname}: {$customfield.value}<br />
										{/foreach}
										{/if}
									</address>
								</div>
								<div class="col-sm-5">
									<h4>{$LANG.invoicespayto}</h4>
									<address> 
										{$payto}
									</address>
								</div>
							</div>
						</div>
						{if $proposal}
							<div class="section">
								<h4>{$LANG.quoteproposal}</h4>
								<div class="well">
									{$proposal}
								</div>
							</div> 
						{/if}
						<div class="section">
							<h4>{$LANG.quotelineitems}</h4>   
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>{$LANG.invoicesdescription}</th>
											<th class="text-right">{$LANG.quotediscountheading}</th>
											<th width="20%" class="text-center">{$LANG.invoicesamount}</th>
										</tr>
									</thead>
									<tbody>
										{foreach from=$quoteitems item=item}
											<tr>
												<td>{$item.description}{if $item.taxed} *{/if}</td>
												<td class="total-row text-right"><strong>{if $item.discountpc > 0}{$item.discount} ({$item.discountpc}%){else} - {/if}</strong></td>
												<td class="text-center">{$item.amount}</td>
											</tr>
										{/foreach}
										<tr class="sub-total-row first">
											<td></td>
											<td class="total-row text-right"><strong>{$LANG.invoicessubtotal}</strong></td>
											<td class="text-center">{$subtotal}</td>
										</tr>
										{if $taxrate}
											<tr class="sub-total-row">
												<td></td>
												<td class="total-row text-right"><strong>{$taxrate}% {$taxname}</strong></td>
												<td class="text-center">{$tax}</td>
											</tr>
										{/if}
										{if $taxrate2}
											<tr class="sub-total-row">
												<td></td>
												<td class="total-row text-right"><strong>{$taxrate2}% {$taxname2}</strong></td>
												<td class="text-center">{$tax2}</td>
											</tr>
										{/if}
										<tr class="sub-total-row active">
											<td></td>
											<td class="total-row text-right"><strong>{$LANG.quotelinetotal}</strong></td>
											<td class="text-center">{$total}</td>
										</tr>
									</tbody>
								</table>
							</div>
							{if $taxrate}
								<p class="text-muted">* {$LANG.invoicestaxindicator}</p>
							{/if}   
						</div>
						{if $notes}
							<div class="section">
								<h4>{$LANG.invoicesnotes}</h4>
								<div class="well">
									{$notes}
								</div>
							</div>
						{/if}     
					</div>
					
					<div class="text-center margin-bottom">
						<div class="btn-group btn-group-sm hidden-print">
							<a href="clientarea.php?action=quotes" class="btn btn-default">{$LANG.clientareabacklink}</a></a>
							{*<a href="javascript:window.print()" class="btn btn-default"><i class="fas fa-print"></i> {$LANG.print}</a>*}
							<a href="dl.php?type=q&amp;id={$quoteid}" class="btn btn-default"><i class="fas fa-download"></i> {$LANG.invoicesdownload}</a>
						</div>
					</div>
					
				</div>
    
			</div>    
		{/if}
	</div>

    <form method="post" action="viewquote.php?id={$quoteid}&amp;action=accept">
        <div class="modal fade" id="acceptQuoteModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>
                        <h4 class="modal-title">{$LANG.quoteacceptbtn}</h4>
                    </div>
                    <div class="modal-body">
                        <p>{$LANG.quoteacceptagreetos}</p>
                        <p class="text-center">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="agreetos" />
                                {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
                            </label>
                        </p>
                        <p>{$LANG.quoteacceptcontractwarning}</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.cancel}</button>
                        <button type="submit" class="btn btn-primary">{$LANG.quoteacceptbtn}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>


</body>
</html>
