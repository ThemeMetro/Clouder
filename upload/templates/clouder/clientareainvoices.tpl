{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{include file="$template/includes/tablelist.tpl" tableName="InvoicesList" filterColumn="4" noSortColumns="5"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableInvoicesList').removeClass('hidden').DataTable();
        {if $orderby == 'default'}
            table.order([4, 'desc'], [2, 'asc']);
        {elseif $orderby == 'invoicenum'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'duedate'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'total'}
            table.order(3, '{$sort}');
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
				{foreach key=status item=count from=$invoices|@array_column:'status'|@array_count_values}
					<li><a href="#"><span data-value="{$status|strip_tags|substr:1:-1}">{$status|strip_tags|substr:1:-1}</span></a></li>
                {/foreach}
			</ul>
		</div>		
	</div>
    <table id="tableInvoicesList" class="datatable table table-hover hidden">
        <thead>
            <tr>
                <th data-class="expand">{$LANG.invoicestitle}</th>
                <th data-hide="phone,tablet">{$LANG.invoicesdatecreated}</th>
                <th data-hide="phone">{$LANG.invoicesdatedue}</th>
                <th>{$LANG.invoicestotal}</th>
                <th>{$LANG.invoicesstatus}</th>
                <th class="col-small center"></th>
            </tr>
        </thead>
        <tbody>
            {foreach key=num item=invoice from=$invoices}
                <tr onclick="clickableSafeRedirect(event, 'viewinvoice.php?id={$invoice.id}', false)">
                    <td><a href="viewinvoice.php?id={$invoice.id}">{$invoice.invoicenum}</a></td>
                    <td><span class="hidden">{$invoice.normalisedDateCreated}</span>{$invoice.datecreated}</td>
                    <td><span class="hidden">{$invoice.normalisedDateDue}</span>{$invoice.datedue}</td>
                    <td data-order="{$invoice.totalnum}">{$invoice.total}</td>
                    <td><span class="label status status-{$invoice.statusClass}">{$invoice.status|strip_tags|substr:1:-1}</span></td>
                    <td class="col-small center">
						<div class="action-buttons">
							<a href="viewinvoice.php?id={$invoice.id}" data-toggle="tooltip" title="{if $invoice.statusClass == 'unpaid'}{$LANG.invoicespaynow}{else}{$LANG.invoicesview}{/if}">
								<i class="far fa-search-plus {if $invoice.statusClass == 'unpaid'}text-danger{/if}"></i> 
							</a>
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
