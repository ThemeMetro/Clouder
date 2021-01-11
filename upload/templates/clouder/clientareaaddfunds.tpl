{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{if $addfundsdisabled}
    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.clientareaaddfundsdisabled textcenter=true}
{elseif $notallowed}
    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.clientareaaddfundsnotallowed textcenter=true}
{elseif $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage textcenter=true}
{/if}

{if !$addfundsdisabled}

<div class="row">
	<div class="col-sm-4">
		<div class="row">
			<div class="col-sm-12">
				<div class="TM-card text-center">
					<strong>{$LANG.addfundsminimum}</strong> <br />{$minimumamount}
				</div>
			</div>
			<div class="col-sm-12">
				<div class="TM-card text-center">
					<strong>{$LANG.addfundsmaximum}</strong> <br />{$maximumamount}
				</div>
			</div>
			<div class="col-sm-12">
				<div class="TM-card text-center">
					<strong>{$LANG.addfundsmaximumbalance}</strong> <br />{$maximumbalance}
				</div>
			</div>
		</div>
	</div>
    <div class="col-sm-8">
      <div class="panel panel-default">
        <div class="panel-body">
          <form method="post" action="{$smarty.server.PHP_SELF}?action=addfunds">
              <fieldset>
                  <div class="form-group">
                      <label for="amount" class="control-label">{$LANG.addfundsamount}:</label>
                       <input type="text" name="amount" id="amount"
                        value="{$amount}" class="form-control" required />
                   </div>
                    <div class="form-group">
                       <label for="paymentmethod" class="control-label">{$LANG.orderpaymentmethod}:</label><br/>
                        <select name="paymentmethod" id="paymentmethod" class="form-control">
                         {foreach from=$gateways item=gateway}
                           <option value="{$gateway.sysname}">{$gateway.name}</option>
                              {/foreach}
                         </select>
                     </div>
                      <div class="form-group">
                          <input type="submit" value="{$LANG.addfunds}" class="btn btn-primary btn-block" />
                       </div>
                  </fieldset>
              </form>
           </div>
           <div class="panel-footer">
               {$LANG.addfundsnonrefundable}
           </div>
       </div>
    </div>
 </div>

{/if}
