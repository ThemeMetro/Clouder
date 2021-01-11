{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

<div class="section">
	<h3>{$LANG.domainregisterns}</h3>
	<p class="decs text-muted">{$LANG.domainregisternsexplanation}</p>

	{if $result}
		{include file="$template/includes/alert.tpl" type="warning" msg=$result textcenter=true}
	{/if}
</div>

<div class="section">
	<h4>{$LANG.domainregisternsreg}</h4>
	<form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
		<div class="TM-card">
			<input type="hidden" name="sub" value="register" />
			<input type="hidden" name="domainid" value="{$domainid}" />
			<div class="form-group">
				<label for="inputNs1" class="control-label">{$LANG.domainregisternsns}</label>
				<div class="row row-eq-height row-eq-height-sm">
					<div class="col-xs-6">
						<input type="text" class="form-control" id="inputNs1" name="ns" />
					</div>
					<div class="col-xs-6 align-items-center">
						. {$domain}
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="inputIp1" class="control-label">{$LANG.domainregisternsip}</label>
						<input type="text" class="form-control" id="inputIp1" name="ipaddress"/>
					</div>
				</div>
			</div>
		</div>
		<div class="form-actions">
			<input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary"/>
		</div>
	</form>
</div>


<div class="section">
	<h4>{$LANG.domainregisternsmod}</h4>
	<form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
		<div class="TM-card">
			<input type="hidden" name="sub" value="modify" />
			<input type="hidden" name="domainid" value="{$domainid}" />
			<div class="form-group">
				<label for="inputNs2" class="control-label">{$LANG.domainregisternsns}</label>
				<div class="row row-eq-height row-eq-height-sm">
					<div class="col-xs-6">
						<input type="text" class="form-control" id="inputNs2" name="ns" />
					</div>
					<div class="col-xs-6 align-items-center">
						. {$domain}
					</div>
				</div>    
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="inputIp2" class="control-label">{$LANG.domainregisternscurrentip}</label>
						<input type="text" class="form-control" id="inputIp2" name="currentipaddress" />
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="inputIp3" class="control-label">{$LANG.domainregisternsnewip}</label>
						<input type="text" class="form-control" id="inputIp3" name="newipaddress" />
					</div>
				</div>
			</div> 
		</div>
		<div class="form-actions">
			<input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
		</div>
	</form>
</div>


<div class="section">
	<h4>{$LANG.domainregisternsdel}</h4>
	<form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
		<div class="TM-card">
			<input type="hidden" name="sub" value="delete" />
			<input type="hidden" name="domainid" value="{$domainid}" />
			<div class="form-group">
				<label for="inputNs3" class="control-label">{$LANG.domainregisternsns}</label>
				<div class="row row-eq-height row-eq-height-sm">
					<div class="col-sm-6">           
						<input type="text" class="form-control" id="inputNs3" name="ns" />
					</div>
					<div class="col-sm-6 align-items-center">
						. {$domain}
					</div>
				</div>    
			</div>
		</div>
		<div class="form-actions">
			<input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
		</div>
	</form>
</div>