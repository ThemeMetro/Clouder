{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

<div class="space-6"></div>
<div class="pull-right">
    <form method="post" action="{$smarty.server.PHP_SELF}?action={$clientareaaction}" />{$LANG.resultsperpage}: 
    <select name="itemlimit" onchange="submit()" style="width: 59px;">
        <option value="10"{if $itemlimit==10} selected{/if}>10</option>
        <option value="25"{if $itemlimit==25} selected{/if}>25</option>
        <option value="50"{if $itemlimit==50} selected{/if}>50</option>
        <option value="100"{if $itemlimit==100} selected{/if}>100</option>
    </select>
    </form>
</div>