{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{if $remoteupdatecode}

    <div align="center">
        {$remoteupdatecode}
    </div>

{else}

    <div class="credit-card" style="margin: 0 0 60px;">
        <div class="card-icon pull-right">
            <b class="fa-2x
            {if $cardtype eq "American Express"}
                fab fa-cc-amex logo-amex
            {elseif $cardtype eq "Visa"}
                fab fa-cc-visa logo-visa
            {elseif $cardtype eq "MasterCard"}
                fab fa-cc-mastercard logo-mastercard
            {elseif $cardtype eq "Discover"}
                fab fa-cc-discover logo-discover
            {elseif $cardtype eq "JCB"}
                fab fa-cc-jcb logo-jcb
            {elseif $cardtype eq "Diners Club" || $cardtype eq "EnRoute"}
                fab fa-cc-diners-club logo-diners-club
            {else}
                fas fa-credit-card
            {/if}">&nbsp;</b>
        </div>
        <div class="card-type">
            {if $cardtype neq "American Express" && $cardtype neq "Visa" && $cardtype neq "MasterCard" && $cardtype neq "Discover" && $cardtype neq "JCB" && $cardtype neq "Diners Club" && $cardtype neq "EnRoute"}
                {$cardtype}
            {/if}
        </div>
        <div class="card-number">
            {if $cardlastfour}xxxx xxxx xxxx {$cardlastfour}{else}{$LANG.creditcardnonestored}{/if}
        </div>
        <div class="card-start">
            {if $cardstart}{$LANG.creditcardcardstart}: {$cardstart}{/if}
        </div>
        <div class="card-expiry">
            {if $cardexp}{$LANG.creditcardcardexpires}: {$cardexp}{/if}
        </div>
        <div class="end"></div>
    </div>

    {if $allowcustomerdelete && $cardtype}
        <form method="post" action="clientarea.php?action=creditcard">
            <input type="hidden" name="remove" value="1" />
            <p class="text-center">
                <button type="submit" class="btn btn-danger" data-toggle="confirmation" data-btn-ok-label="{lang key='yes'}" data-btn-ok-icon="fas fa-check" data-btn-ok-class="btn-success" data-btn-cancel-label="{lang key='no'}" data-btn-cancel-icon="fas fa-ban" data-btn-cancel-class="btn-default" data-title="{lang key='creditcarddelete'}" data-content="{lang key='creditCard.removeDescription'}" data-popout="true">
                    {$LANG.creditcarddelete}
                </button>
            </p>
        </form>
    {/if}

    <h4>{$LANG.creditcardenternewcard}</h4>

    {if $successful}
        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
    {/if}

    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
	
	<div class="row">
		<div class="col-sm-8">
			 <form id="frmNewCc" role="form" method="post" action="{$smarty.server.PHP_SELF}?action=creditcard">
				<div class="alert alert-danger text-center gateway-errors hidden"></div>
				<div class="TM-card n-margin-bottom">
					<div class="row">
						<div class="col-sm-6 form-group">
							<label for="inputCardType" class="control-label">{$LANG.creditcardcardtype}</label>
							<select name="cctype" id="inputCardType" class="form-control">
								{foreach from=$acceptedcctypes item=fieldcardtype}
									<option {if $fieldcardtype eq $cardtype}selected{/if}>{$fieldcardtype}</option>
								{/foreach}
							</select>    
						</div>
						<div class="col-sm-6 form-group">
							<label for="inputCardNumber" class="control-label">{$LANG.creditcardcardnumber}</label>
							<input type="tel" class="form-control" id="inputCardNumber" name="ccnumber" autocomplete="off" />
						</div>
					</div>        
					<div class="row">
					{if $showccissuestart}
						<div class="col-sm-6">
							<div class="form-group">
								<label for="inputCardStart" class="control-label">{$LANG.creditcardcardstart}</label>
								<div class="row row-sm">
									<div class="col-xs-6">
										<select name="ccstartmonth" id="inputCardStart" class="form-control select-inline">
											{foreach from=$months item=month}
												<option{if $ccstartmonth eq $month} selected{/if}>{$month}</option>
											{/foreach}
										</select>
									</div>
									<div class="col-xs-6">    
										<select name="ccstartyear" class="form-control select-inline">
											{foreach from=$startyears item=year}
												<option{if $ccstartyear eq $year} selected{/if}>{$year}</option>
											{/foreach}
										</select>
									</div>
								</div>
							</div>
						</div>    
					{/if}

						<div class="col-sm-6">
							<div class="form-group">
								<label for="inputCardExpiry" class="control-label">{$LANG.creditcardcardexpires}</label>
								<div class="select-inline-container">
									<div class="row row-sm">
										<div class="col-xs-6">
											<select name="ccexpirymonth" id="inputCardExpiry" class="form-control">
												{foreach from=$months item=month}
													<option{if $ccstartmonth eq $month} selected{/if}>{$month}</option>
												{/foreach}
											</select>
										</div>
										<div class="col-xs-6">
											<select name="ccexpiryyear" class="form-control">
												{foreach from=$expiryyears item=year}
													<option{if $ccstartyear eq $year} selected{/if}>{$year}</option>
												{/foreach}
										</select>
									</div>  
								</div>      
							</div>
						</div>
					</div>
					{if $showccissuestart}
					</div>
					<div class="row">
					{/if}
					{if $showccissuestart}
						<div class="col-sm-6">
							<div class="form-group">
								<label for="inputCardIssue" class="control-label">{$LANG.creditcardcardissuenum}</label>
								<input type="tel" class="form-control" id="inputCardIssue" name="ccissuenum" autocomplete="off" />
							</div>
						</div>    
					{/if}
					<div class="col-sm-6">
						<div class="form-group">
							<label for="inputCardCVV" class="control-label">{$LANG.creditcardcvvnumber}</label>
							<div class="row">
								<div class="col-sm-9">
									<div class="form-group no-margin-bottom">
										<input type="tel" class="form-control" id="inputCardCVV" name="cardcvv" autocomplete="off" />
										<button type="button" class="btn btn-xs btn-link" data-toggle="popover" data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210' />">
											{$LANG.creditcardcvvwhere}
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>                
				</div>
				</div>
				<div class="form-actions">
				   <input class="btn btn-primary" id="btnSubmitNewCard" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
				   <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
				</div>
			</form>
		</div>
	</div>

{/if}
