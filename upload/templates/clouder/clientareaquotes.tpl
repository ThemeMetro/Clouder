{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{include file="$template/includes/tablelist.tpl" tableName="QuotesList" noSortColumns="5, 6" filterColumn="4"}

<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableQuotesList').removeClass('hidden').DataTable();
        {if $orderby == 'id'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'validuntil'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'stage'}
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
				{foreach key=stage item=count from=$quotes|@array_column:'stage'|@array_count_values}
					<li><a href="#"><span data-value="{$stage}">{$stage}</span></a></li>
                {/foreach}
			</ul>
		</div>		
	</div>
    <table id="tableQuotesList" class="datatable table table-hover hidden">
        <thead>
            <tr>
				<th data-class="expand">{$LANG.quotesubject}</th>
                <th>{$LANG.quotenumber}</th>
                <th data-hide="phone,tablet">{$LANG.quotedatecreated}</th>
                <th data-hide="phone,tablet">{$LANG.quotevaliduntil}</th>
                <th data-hide="phone">{$LANG.quotestage}</th>
                <th>&nbsp;</th>
				<th class="col-small center"></th>
                
            </tr>
        </thead>
        <tbody>
            {foreach from=$quotes item=quote}
                <tr onclick="clickableSafeRedirect(event, 'viewquote.php?id={$quote.id}', false)">
                    <td>{$quote.subject}</td>
                    <td>{$quote.id}</td>
                    <td><span class="hidden">{$quote.normalisedDateCreated}</span>{$quote.datecreated}</td>
                    <td><span class="hidden">{$quote.normalisedValidUntil}</span>{$quote.validuntil}</td>
                    <td><span class="label status status-{$quote.stageClass}">{$quote.stage}</span></td>
                    <td class="text-center">
                        <form method="submit" action="dl.php">
                            <input type="hidden" name="type" value="q" />
                            <input type="hidden" name="id" value="{$quote.id}" />
                            <button type="submit" class="btn btn-primary btn-xs">
								<span class="hidden-xs"><i class="fas fa-download"></i> {$LANG.quotedownload}</span>
								<span class="visible-xs"><i class="fas fa-download icon-only"></i></span>
							</button>
                        </form>
                    </td>
                    <td class="col-small center">
						<div class="action-buttons">
							<a href="viewquote.php?id={$quote.id}" data-toggle="tooltip" title="{$LANG.quoteview}">
								<i class="far fa-search-plus"></i> 
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
