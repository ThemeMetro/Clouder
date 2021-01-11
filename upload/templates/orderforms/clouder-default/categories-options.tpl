<!-- Modal For Options -->
	<div class="modal fade" id="cat-opt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
					<h4 class="modal-title" id="myModalLabel">{$LANG.cartproductchooseoptions}</h4>
				</div>
				<div class="modal-body">
				
					<div class="TM-categories-options">
						<form>
							<select name="gid" id="gidForm" onchange="javascript:redirectToCartPage()" class="form-control">
								<optgroup label="Product Categories">
									{foreach key=num item=productgroup from=$productgroups}
										<option value="{$productgroup.routePath}"{if $gid eq $productgroup.gid} selected="selected"{/if}>{$productgroup.name}</option>
									{/foreach}
								</optgroup>
								<optgroup label="Actions">
									{if $loggedin}
										<option value="{$WEB_ROOT}/cart.php?gid=addons"{if $gid eq "addons"} selected{/if}>{$LANG.cartproductaddons}</option>
										{if $renewalsenabled}
											<option value="{$WEB_ROOT}/cart.php?gid=renewals"{if $gid eq "renewals"} selected{/if}>{$LANG.domainrenewals}</option>
										{/if}
									{/if}
									{if $registerdomainenabled}
										<option value="{$WEB_ROOT}/cart.php?gid=registerdomain"{if $domain eq "register"} selected{/if}>{$LANG.navregisterdomain}</option>
									{/if}
									{if $transferdomainenabled}
										<option value="{$WEB_ROOT}/cart.php?gid=transferdomain"{if $domain eq "transfer"} selected{/if}>{$LANG.transferinadomain}</option>
									{/if}
									<option value="{$WEB_ROOT}/cart.php?a=view"{if $action eq "view"} selected{/if}>{$LANG.viewcart}</option>
								</optgroup>
							</select>
						</form>
						
						{if !$loggedin && $currencies}
						  <form method="post" action="cart.php{if $action}?a={$action}{if $templatefile eq "domainregister"}&domain=register{elseif $templatefile eq "domaintransfer"}&domain=transfer{/if}{elseif $gid}?gid={$gid}{/if}">
							<div class="form-group">
							   <select name="currency" onchange="submit()" class="form-control">
								   <option value="">{$LANG.choosecurrency}</option>
								   {foreach from=$currencies item=listcurr}
									   <option value="{$listcurr.id}"{if $listcurr.id == $currency.id} selected{/if}>{$listcurr.code}</option>
								   {/foreach}
							   </select>
							</div>
						 </form>
						{/if}
						
						
					</div>
					
				</div>

			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
<!-- Modal For Options -->