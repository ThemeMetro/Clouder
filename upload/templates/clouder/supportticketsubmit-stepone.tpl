{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


<p class="desc">{$LANG.supportticketsheader}</p>
<h4>{$LANG.supportticketschoosedepartment}</h4>

{if $departments}
<div class="ticket-departments">
{foreach from=$departments key=num item=department}
    <a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}">
		<span>{$department.name}</span>
		{if $department.description}
		<p>{$department.description}</p>
		{/if}
	</a>			 
{/foreach}   
</div>

{else}

	{include file="$template/includes/alert.tpl" type="info" msg=$LANG.nosupportdepartments textcenter=true}
{/if}
           


