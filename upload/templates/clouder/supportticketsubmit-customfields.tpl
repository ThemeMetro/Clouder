{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

{foreach from=$customfields item=customfield}
	<div class="TM-card">
		<div class="form-group">
			<label for="customfield{$customfield.id}">{$customfield.name}</label>
			{$customfield.input}
			{if $customfield.description}
				<span class="help-block">{$customfield.description}</span>
			{/if}
		</div>
	</div>
{/foreach}
