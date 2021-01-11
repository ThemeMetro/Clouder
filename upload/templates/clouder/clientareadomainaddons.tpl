{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

<form method="post" action="{$smarty.server.PHP_SELF}?action=domainaddons" class="form-horizontal">
    <input type="hidden" name="{$action}" value="{$addon}">
    <input type="hidden" name="id" value="{$domainid}">
    <input type="hidden" name="confirm" value="1">
    <input type="hidden" name="token" value="{$token}">

    {if $action eq "buy"}
        <input type="hidden" name="buy" value="{$addon}">
        {if $addon eq "dnsmanagement"}
            <h3>{$LANG.domainaddonsdnsmanagement}</h3>
			<p class="desc">{$LANG.domainaddonsdnsmanagementinfo}</p>
            {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}

            <div class="form-actions text-center">
                <input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.dnsmanagement}{$LANG.domainaddonsperyear}" class="btn btn-primary" />
            </div>
        {elseif $addon eq "emailfwd"}
			<h3>{$LANG.domainemailforwarding}</h3>
			<p class="desc">{$LANG.domainaddonsemailforwardinginfo}</p>
            {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}

            <div class="form-actions text-center">
                <input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.emailforwarding}{$LANG.domainaddonsperyear}" class="btn btn-primary" />
            </div>
        {elseif $addon eq "idprotect"}
			<h3>{$LANG.domainidprotection}</h3>
			<p class="desc">{$LANG.domainaddonsidprotectioninfo}</p>
            {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}

            <div class="form-actions text-center">
                <input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.idprotection}{$LANG.domainaddonsperyear}" class="btn btn-primary" />
            </div>
        {/if}
    {elseif $action eq "disable"}
        <input type="hidden" name="disable" value="{$addon}">
        {if $addon eq "dnsmanagement"}
            <h3>{$LANG.domainaddonsdnsmanagement}</h3>
        {elseif $addon eq "emailfwd"}
            <h3>{$LANG.domainemailforwarding}</h3>
        {elseif $addon eq "idprotect"}
            <h3>{$LANG.domainidprotection}</h3>
        {/if}

        {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}

        {if $success}
            {include file="$template/includes/alert.tpl" type="success" msg=$LANG.domainaddonscancelsuccess textcenter=true}
        {elseif $error}
            {include file="$template/includes/alert.tpl" type="error" msg=$LANG.domainaddonscancelfailed textcenter=true}
        {else}
		
            <p class="desc text-center">
                {$LANG.domainaddonscancelareyousure}
            </p>

            <div class="form-actions text-center">
                <input type="submit" name="enable" value="{$LANG.domainaddonsconfirm}" class="btn btn-danger" />
            </div>
        {/if}
    {/if}

    <p><a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default">{$LANG.clientareabacklink}</a></p>

</form>
