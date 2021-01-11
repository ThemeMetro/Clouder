{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

{if $inactive}

    {include file="$template/includes/alert.tpl" type="danger" msg=$LANG.affiliatesdisabled textcenter=true}

{else}
	<div class="tiles clearfix">
		<div class="row">
			<div class="col-sm-4 tile">
				<div class="no-link">
					<div class="icon"><i class="fas fa-users"></i></div>
					<div class="stat">{$visitors}</div>
					<div class="title">{$LANG.affiliatesclicks}</div>
					<div class="highlight bg-color-green"></div>
				</div>
			</div>

			<div class="col-sm-4 tile">
				<div class="no-link">
					<div class="icon"><i class="fas fa-shopping-cart"></i></div>
					<div class="stat">{$signups}</div>
					<div class="title">{$LANG.affiliatessignups}</div>
					<div class="highlight bg-color-gold"></div>
				</div>
			</div>

			<div class="col-sm-4 tile">
				<div class="no-link">
					<div class="icon"><i class="far fa-chart-bar"></i></div>
					<div class="stat">{if $conversionrate|string_format:"%d" < 100}{$conversionrate}{else}{$conversionrate|string_format:"%.1f"}{/if}%</div>
					<div class="title">{$LANG.affiliatesconversionrate}</div>
					<div class="highlight bg-color-blue"></div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="tiles clearfix">
		<div class="row">
			<div class="col-sm-4 tile">
				<div class="no-link">
					<div class="stat">{$balance}</div>
					<div class="title">{$LANG.affiliatescommissionsavailable}</div>
				</div>
			</div>
			<div class="col-sm-4 tile">
				<div class="no-link">
					<div class="stat">{$withdrawn}</div>
					<div class="title">{$LANG.affiliateswithdrawn}</div>
				</div>
			</div>
			<div class="col-sm-4 tile">
				<div class="no-link">
					<div class="stat">{$pendingcommissions}</div>
					<div class="title">{$LANG.affiliatescommissionspending}</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="section">
	{if $withdrawrequestsent}
		<div class="alert alert-success">
			<p>{$LANG.affiliateswithdrawalrequestsuccessful}</p>
		</div>
	{else}
		{if $withdrawlevel}
			<p class="text-center">
				<a href="{$smarty.server.PHP_SELF}?action=withdrawrequest" class="btn btn-primary">
					<i class="fas fa-university"></i> {$LANG.affiliatesrequestwithdrawal}
				</a>
			</p>
		{/if}
		{if !$withdrawlevel}
			<p class="text-muted text-center">{lang key="affiliateWithdrawalSummary" amountForWithdrawal=$affiliatePayoutMinimum}</p>
		{/if}
	{/if}
	</div>
	
	<div class="section">
        <div class="panel panel-default panel-affiliate-referral-link">
             <div class="panel-body">
                 <div class="input-group input-group-lg">
                      <div class="input-group-addon">{$LANG.affiliatesreferallink}</div>
                      <input class="form-control" type="text" readonly value="{$referrallink}"> 
                  </div>
              </div>
          </div>
	</div>
	
	<div class="section">
		<div class="d-flex space-between align-items-center">
			<h4>{$LANG.affiliatesreferals}</h4>
			{if $referrals}
				<div class="search-group">
					<input type="text" class="form-control" id="table-search" placeholder="{$LANG.tableentersearchterm}"> 
				</div>
			{/if}
		</div>
		{if $referrals}
		{include file="$template/includes/tablelist.tpl" tableName="AffiliatesList" filterColumn="4"}
		
		<script type="text/javascript">
			jQuery(document).ready( function ()
			{
				var table = jQuery('#tableAffiliatesList').removeClass('hidden').DataTable();
				{if $orderby == 'regdate'}
					table.order(0, '{$sort}');
				{elseif $orderby == 'product'}
					table.order(1, '{$sort}');
				{elseif $orderby == 'amount'}
					table.order(2, '{$sort}');
				{elseif $orderby == 'status'}
					table.order(4, '{$sort}');
				{/if}
				table.draw();
				jQuery('#tableLoading').addClass('hidden');
			});
		</script>
		

		<div class="table-container clearfix">
		
			<div class="table-header">
				<label>View</label>
				<div class="dropdown view-filter-btns">
					<button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<span>All Entries</span> <i class="fas fa-caret-down"></i>
					</button>
					 <ul class="dropdown-menu" role="menu">
						<li><a href="#"><span data-value="all">All Entries</span></a></li>
						{foreach key=status item=count from=$referrals|@array_column:'status'|@array_count_values}
							<li><a href="#"><span data-value="{$status|strip_tags}">{$status|strip_tags}</span></a></li>
						{/foreach}
					</ul>
				</div>		
			</div>
			
			<table id="tableAffiliatesList" class="datatable table table-hover hidden">
				<thead>
					<tr>
						<th data-class="expand">{$LANG.orderproduct}</th>
						<th data-hide="phone">{$LANG.affiliatessignupdate}</th>
						<th data-hide="phone,tablet">{$LANG.affiliatesamount}</th>
						<th data-hide="phone,tablet">{$LANG.affiliatescommission}</th>
						<th>{$LANG.affiliatesstatus}</th>
					</tr>
				</thead>
				<tbody>
				{foreach from=$referrals item=referral}
					<tr>
						<td>{$referral.service}</td>
						<td><span class="hidden">{$referral.datets}</span>{$referral.date}</td>
						<td data-order="{$referral.amountnum}">{$referral.amountdesc}</td>
						<td data-order="{$referral.commissionnum}">{$referral.commission}</td>
						<td><span class='label status status-{$referral.rawstatus|strtolower}'>{$referral.status}</span></td>
					</tr>
				{/foreach}
				</tbody>
			</table>
			<div class="text-center" id="tableLoading">
				<p><i class="fas fa-spinner fa-spin"></i> {$LANG.loading}</p>
			</div>
		</div>
		
        {else}
		
		<div class="alert-lg no-data">
			<div class="icon">
				<i class="fas fa-exclamation-triangle"></i>
			</div>
			<div class="text">
				{$LANG.norecordsfound}
			</div>
		</div>
		
        {/if} 		
		
	</div>	
	
	
	
    {if $affiliatelinkscode}
		<div class="section">
			<h4>{$LANG.affiliateslinktous}</h4>
			<div class="margin-bottom">
				{$affiliatelinkscode}
			</div>
		</div>
    {/if}

{/if}
