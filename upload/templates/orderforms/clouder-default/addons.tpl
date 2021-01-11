{include file="orderforms/{$carttpl}/common.tpl"}

{if file_exists("templates/orderforms/{$carttpl}/layouts/head.tpl")}
	{include file="templates/orderforms/{$carttpl}/layouts/head.tpl"}
{/if}
		<div id="order-standard_cart">

			<div class="row">
				
				<div class="col-md-12">	
					{if file_exists("templates/orderforms/{$carttpl}/layouts/head.tpl")}
					{else}
					<div class="header-lined">
						<h1>{$LANG.cartproductaddons}</h1>
					</div>
					{/if}
					
					{include file="orderforms/{$carttpl}/sidebar-categories-collapsed.tpl"}
				</div>

				<div class="col-md-12">

					{if count($addons) == 0}
						<div id="noAddons" class="alert alert-warning text-center" role="alert">
							{$LANG.cartproductaddonsnone}
						</div>
						<p class="text-center">
							<a href="clientarea.php" class="btn btn-default">
								<i class="fas fa-arrow-circle-left"></i>
								{$LANG.orderForm.returnToClientArea}
							</a>
						</p>
					{/if}

					<div class="products">
						<div class="row">
							{foreach $addons as $num => $addon}
								<div class="col-md-6">
									<form method="post" action="{$smarty.server.PHP_SELF}?a=add" class="product">
										<input type="hidden" name="aid" value="{$addon.id}" />
										<div class="product-addon-header">
											<h4>{$addon.name}</h4>
										</div>
											
										<div class="product-body">
											<p class="text-muted">{$addon.description}</p>
										</div>
											
										<div class="product-options">
											<div class="form-group">
												<select name="productid" id="inputProductId{$num}" class="field">
													{foreach $addon.productids as $product}
														<option value="{$product.id}">
															{$product.product}{if $product.domain} - {$product.domain}{/if}
														</option>
													{/foreach}
												</select>
											</div>
										</div>
										<div class="product-addon-footer">
											<div class="product-pricing">
												{if $addon.free}
													{$LANG.orderfree}
												{else}
													<span class="price">{$addon.recurringamount} {$addon.billingcycle}</span>
													{if $addon.setupfee}<br />+ {$addon.setupfee} {$LANG.ordersetupfee}{/if}
												{/if}
											</div>
											<div class="product-actions">
												<button type="submit" class="btn btn-primary">
													<i class="fa fa-shopping-cart"></i>
													{$LANG.ordernowbutton}
												</button>
											</div>
										</div>
									</form>
								</div>
								{if $num % 2 != 0}
									</div>
									<div class="row row-eq-height">
								{/if}
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		</div>
		
{if file_exists("templates/orderforms/{$carttpl}/layouts/foot.tpl")}
	{include file="templates/orderforms/{$carttpl}/layouts/foot.tpl"}
{/if}