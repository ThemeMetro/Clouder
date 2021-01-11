{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

{if $warnings}
    {include file="$template/includes/alert.tpl" type="warning" msg=$warnings textcenter=true}
{/if}

<div class="tab-content">
    <div class="tab-pane fade in active" id="tabOverview">
        {include file="$template/includes/tablelist.tpl" tableName="DomainsList" noSortColumns="0, 5" startOrderCol="1" filterColumn="4"}

        <script type="text/javascript">
            jQuery(document).ready( function ()
            {
                var table = jQuery('#tableDomainsList').removeClass('hidden').DataTable();
                {if $orderby == 'domain'}
                    table.order(1, '{$sort}');
                {elseif $orderby == 'nextduedate'}
                    table.order(2, '{$sort}');
                {elseif $orderby == 'autorenew'}
                    table.order(3, '{$sort}');
                {elseif $orderby == 'status'}
                    table.order(4, '{$sort}');
                {/if}
                table.draw();
                jQuery('#tableLoading').addClass('hidden');
            });
        </script>
		
        <form id="domainForm" method="post" action="clientarea.php?action=bulkdomain">
            <input id="bulkaction" name="update" type="hidden" />

            <div class="table-container clearfix">	
				<div class="table-header">
					<label>View</label>
					<div class="dropdown view-filter-btns">
						<button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							<span>All Entries</span> <i class="fas fa-caret-down"></i>							
						</button>
						 <ul class="dropdown-menu" role="menu">
							<li><a href="#"><span data-value="all">All Entries</span></a></li>
							{foreach key=statustext item=count from=$domains|@array_column:'statustext'|@array_count_values}
								<li><a href="#"><span data-value="{$statustext}">{$statustext}</span></a></li>
                            {/foreach}
						</ul>
					</div>		
				</div>
                <table id="tableDomainsList" class="datatable table table-hover hidden">
                    <thead>
                        <tr>
                            <th class="col-small center" data-class="expand"></th>
                            <th>{$LANG.orderdomain}</th>
                            {* <th data-hide="phone,tablet">{$LANG.regdate}</th> *}
                            <th data-hide="phone,tablet">{$LANG.nextdue}</th>
                            <th data-hide="phone,tablet">{$LANG.domainsautorenew}</th>
                            <th data-hide="phone">{$LANG.domainstatus}</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach key=num item=domain from=$domains}
                        <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=domaindetails&amp;id={$domain.id}', false)">
                            <td class="col-small center">
                                <input type="checkbox" name="domids[]" class="domids stopEventBubble" value="{$domain.id}" />
                            </td>
                            <td>
								<div class="d-flex align-items-center">
									<span class="ssl-info" data-element-id="{$domain.id}" data-type="domain" data-domain="{$domain.domain}">
										{if $domain.sslStatus}
											<img src="{$domain.sslStatus->getImagePath()}" data-toggle="tooltip" title="{$domain.sslStatus->getTooltipContent()}" class="{$domain.sslStatus->getClass()}"/>
										{elseif !$domain.isActive}
											<img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" data-toggle="tooltip" title="{lang key='sslState.sslInactiveDomain'}">
										{/if}
									</span>
									<span class="text-small">
										<a href="http://{$domain.domain}" target="_blank">{$domain.domain}</a>
									</span>
								</div>
							</td>
                            {* <td><span class="hidden">{$domain.normalisedRegistrationDate}</span>{$domain.registrationdate}</td> *}
                            <td><span class="hidden">{$domain.normalisedNextDueDate}</span>{$domain.nextduedate}</td>
                            <td>
                                {if $domain.autorenew}
                                    <i class="fas fa-fw fa-check text-success"></i> {$LANG.domainsautorenewenabled}
                                {else}
                                    <i class="fas fa-fw fa-times text-danger"></i> {$LANG.domainsautorenewdisabled}
                                {/if}
                            </td>
                            <td>
                                <span class="label status status-{$domain.statusClass}">{$domain.statustext}</span>
                                <span class="hidden">
									{if $domain.expiringSoon}<span>{lang key="domainsExpiringSoon"}</span>{/if}
                                </span>
                            </td>
                            <td class="col-small center">
                                <div class="btn-group btn-group-sm">
                                    <a href="#" class="btn btn-link" dropdown-toggle" data-toggle="dropdown" ><i class="fas fa-ellipsis-h"></i></a>
                                    <ul class="dropdown-menu text-left dropdown-menu-right" role="menu">
                                        {if $domain.status eq 'Active'}
                                            <li><a href="clientarea.php?action=domaindetails&id={$domain.id}#tabNameservers">{$LANG.domainmanagens}</a></li>
                                            <li><a href="clientarea.php?action=domaincontacts&domainid={$domain.id}">{$LANG.domaincontactinfoedit}</a></li>
                                            <li><a href="clientarea.php?action=domaindetails&id={$domain.id}#tabAutorenew">{$LANG.domainautorenewstatus}</a></li>
                                            <li class="divider"></li>
                                        {/if}
                                        <li><a href="clientarea.php?action=domaindetails&id={$domain.id}">{$LANG.managedomain}</a></li>
                                        {if $allowrenew}
                                            {if $domain.canDomainBeManaged}
                                                <li><a href="{routePath('domain-renewal', $domain.domain)}">{lang key='domainsrenew'}</a></li>
                                            {else}
                                                <li class="disabled"><a href="#" onclick="return false;" class="disabled" disabled="disabled">{lang key='domainsrenew'}</a></li>
                                            {/if}

                                        {/if}
                                    </ul>
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
        </form>

        <div class="btn-group margin-bottom">
            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
                {$LANG.withselected} <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#" id="nameservers" class="setBulkAction">{$LANG.domainmanagens}</a></li>
                <li><a href="#" id="autorenew" class="setBulkAction">{$LANG.domainautorenewstatus}</a></li>
                <li><a href="#" id="reglock" class="setBulkAction">{$LANG.domainreglockstatus}</a></li>
                <li><a href="#" id="contactinfo" class="setBulkAction">{$LANG.domaincontactinfoedit}</a></li>
               {if $allowrenew}
                    <li><a href="#" id="renewDomains" class="setBulkAction">{lang key='domainmassrenew'}</a></li>
                {/if}
            </ul>
        </div>
    </div>
</div>
