{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="3" noSortColumns="4"}

<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableServicesList').removeClass('hidden').DataTable();
        {if $orderby == 'product'}
            table.order([0, '{$sort}'], [3, 'asc']);
        {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'nextduedate'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'domainstatus'}
            table.order(3, '{$sort}');
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
				{foreach key=statustext item=count from=$services|@array_column:'statustext'|@array_count_values}
					<li><a href="#"><span data-value="{$statustext}">{$statustext}</span></a></li>
                {/foreach}
			</ul>
		</div>		
	</div>
	
    <table id="tableServicesList" class="datatable table table-hover hidden">
        <thead>
            <tr>
                <th data-class="expand">{$LANG.orderproduct}</th>
                <th data-hide="phone,tablet">{$LANG.clientareaaddonpricing}</th>
                <th data-hide="phone,tablet">{$LANG.clientareahostingnextduedate}</th>
                <th data-hide="phone">{$LANG.clientareastatus}</th>
                <th class="col-small center"></th>
            </tr>
        </thead>
        <tbody>
            {foreach key=num item=service from=$services}
                <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=productdetails&amp;id={$service.id}', false)">
                    <td>
						{$service.product}
						{if $service.domain}<br />
							<div class="d-flex align-items-center">
								<span class="ssl-info" data-element-id="{$service.id}" data-type="service"{if $service.domain} data-domain="{$service.domain}"{/if}>
									{if $service.sslStatus}
										<img src="{$service.sslStatus->getImagePath()}" data-toggle="tooltip" title="{$service.sslStatus->getTooltipContent()}" class="{$service.sslStatus->getClass()}"/>
									{elseif !$service.isActive}
										<img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" data-toggle="tooltip" title="{lang key='sslState.sslInactiveService'}">
									{/if}
								</span>
								<span class="text-small">
									<a href="http://{$service.domain}" target="_blank">{$service.domain}</a>
								</span>
							</div>
						{/if}						
					
					</td>
                    <td data-order="{$service.amountnum}">{$service.amount} <small>{$service.billingcycle}</small></td>
                    <td><span class="hidden">{$service.normalisedNextDueDate}</span>{$service.nextduedate}</td>
                    <td><span class="label status status-{$service.status|strtolower}">{$service.statustext}</span></td>
                    <td class="col-small center">
                        <div class="action-buttons">
							<a href="clientarea.php?action=productdetails&amp;id={$service.id}" data-toggle="tooltip" title="{$LANG.manageproduct}"><i class="far fa-search-plus"></i></a>	
						</div>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fas fa-spinner fa-spin"></i> {$LANG.loading}</p>
    </div>
</div>
