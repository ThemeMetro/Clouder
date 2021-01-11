{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

{if $affiliatesystemenabled}

	<h2>{$LANG.affiliatesignuptitle}</h2>
	<p>{$LANG.affiliatesignupintro|cat:''}</p>

    <ul>
        <li>{$LANG.affiliatesignupinfo1}</li>
        <li>{$LANG.affiliatesignupinfo2}</li>
        <li>{$LANG.affiliatesignupinfo3}</li>
    </ul>

    <br />

    <form method="post" action="affiliates.php">
        <input type="hidden" name="activate" value="true" />
        <div class="form-actions">
			<input type="submit" value="{$LANG.affiliatesactivate}" class="btn btn-lg btn-primary" />
		</div>
    </form>

{else}
    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.affiliatesdisabled textcenter=true}
{/if}
