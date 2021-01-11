<script type="text/javascript" charset="utf8" src="{$WEB_ROOT}/templates/{$template}/assets/js/plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="{$WEB_ROOT}/templates/{$template}/assets/js/plugins/datatables/datatables.js"></script>
<script type="text/javascript" charset="utf8" src="{$WEB_ROOT}/templates/{$template}/assets/js/plugins/datatables/dataTables.responsive.js"></script>


{if isset($filterColumn) && $filterColumn}
<script type="text/javascript">

if (typeof(buildFilterRegex) !== "function") {
    function buildFilterRegex(filterValue) {

        if (filterValue.indexOf('&') === -1) {
            return '[~>]\\s*' + jQuery.fn.dataTable.util.escapeRegex(filterValue) + '\\s*[<~]';
        } else {
            var tempDiv = document.createElement('div');
            tempDiv.innerHTML = filterValue;

            return '\\s*' + jQuery.fn.dataTable.util.escapeRegex(tempDiv.innerText) + '\\s*';
        }
    }
}

jQuery(document).ready(function () {ldelim}
   jQuery(".view-filter-btns .dropdown-menu a").click(function(e) {ldelim}
      var filterValue = jQuery(this).find("span").data('value');
      var filterText = jQuery(this).find("span").html().trim();
      var dataTable = jQuery('#table{$tableName}').DataTable();
      var filterValueRegex;
        $(this).closest('.dropdown-menu').find('.active').removeClass('active');
        $(this).parent().addClass('active');
        $(this).closest('.view-filter-btns').find('.dropdown-toggle span').text(filterText);
        if (filterValue == "all") {ldelim}
           dataTable.column({$filterColumn}).search('').draw();
           {rdelim} else {ldelim}
            filterValueRegex = buildFilterRegex(filterValue);
              dataTable.column({$filterColumn})
                .search(filterValueRegex, true, false, false)
               .draw();
            {rdelim}
         // Prevent jumping to the top of the page
         // when no matching tag is found.
         e.preventDefault();
		{rdelim});
	{rdelim});
</script>
{/if}

<script type="text/javascript">
var alreadyReady = false; // The ready function is being called twice on page load.
jQuery(document).ready( function () {ldelim}

	
	var responsiveHelper = undefined;
		{ldelim}var breakpointDefinition = {
			tablet: 1024,
			phone : 480
		};{rdelim}
	
	var tableElement = jQuery("#table{$tableName}");
	
    tableElement.dataTable ({ldelim}
        "dom": '<"listtable"fit>pl',{if isset($noPagination) && $noPagination}
        "paging": false,{/if}{if isset($noInfo) && $noInfo}
        "info": false,{/if}{if isset($noSearch) && $noSearch}
        "filter": false,{/if}{if isset($noOrdering) && $noOrdering}
        "ordering": false,{/if}
		"responsive": true,
		"autoWidth": false,
        "oLanguage": {ldelim}
            "sEmptyTable":     "{$LANG.norecordsfound}",
            "sInfo":           "{$LANG.tableshowing}",
            "sInfoEmpty":      "{$LANG.tableempty}",
            "sInfoFiltered":   "{$LANG.tablefiltered}",
            "sInfoPostFix":    "",
            "sInfoThousands":  ",",
            "sLengthMenu":     "{$LANG.tablelength}",
            "sLoadingRecords": "{$LANG.tableloading}",
            "sProcessing":     "{$LANG.tableprocessing}",
            "sSearch":         "",
            "sZeroRecords":    "{$LANG.norecordsfound}",
            "oPaginate": {ldelim}
                "sFirst":    "{$LANG.tablepagesfirst}",
                "sLast":     "{$LANG.tablepageslast}",
                "sNext":     "{$LANG.tablepagesnext}",
                "sPrevious": "{$LANG.tablepagesprevious}"
            {rdelim}
        {rdelim},
        "pageLength": 10,
        "order": [
            [ {if isset($startOrderCol) && $startOrderCol}{$startOrderCol}{else}0{/if}, "asc" ]
        ],
        "lengthMenu": [
            [10, 25, 50, -1],
            [10, 25, 50, "{$LANG.tableviewall}"]
        ],
        "aoColumnDefs": [
            {ldelim}
                "bSortable": false,
                "aTargets": [ {if isset($noSortColumns) && $noSortColumns !== ''}{$noSortColumns}{/if} ]
            {rdelim},
            {ldelim}
                "sType": "string",
                "aTargets": [ {if isset($filterColumn) && $filterColumn}{$filterColumn}{/if} ]
            {rdelim}
        ],
		
		preDrawCallback: function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper) {
                responsiveHelper = new ResponsiveDatatablesHelper(tableElement, breakpointDefinition);
            }
        },
        rowCallback    : function (nRow) {
            responsiveHelper.createExpandIcon(nRow);
        },
        drawCallback   : function (oSettings) {
            responsiveHelper.respond();
        },
		
		
        "stateSave": true
    {rdelim});

    {if isset($filterColumn) && $filterColumn}
    // highlight remembered filter on page re-load
	
	var table = jQuery('#table{$tableName}').DataTable();
    var rememberedFilterTerm = table.state().columns[{$filterColumn}].search.search;
    if (rememberedFilterTerm && !alreadyReady) {
	
        // This should only run on the first "ready" event.
        jQuery(".view-filter-btns a span").each(function(index) {
            if (buildFilterRegex(jQuery(this).text().trim()) == rememberedFilterTerm) {
                $(this).closest('li').addClass('active');
                $(this).closest('.view-filter-btns').find('.dropdown-toggle span').text(jQuery(this).text());
            }
        });
    }
    {/if}
alreadyReady = true;

if (jQuery('#table-search').length > 0 && $('.dataTables_filter').length > 0){
   var searchTableVal = $('.dataTables_filter input').val();
   jQuery('#table-search').val(searchTableVal);
       var searchVal = $('#table-search').val();
   table.search(searchVal, true).draw();
}

jQuery('#table-search').on('keyup', function () {
   table.search(this.value, true).draw();
});

{rdelim} );
</script>
