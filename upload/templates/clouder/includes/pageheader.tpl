{if $templatefile != 'affiliatessignup'}

<div class="header-lined">
	<div>
		<h1>{if $templatefile eq 'clientareahome'}{$LANG.mydashboard}{else}{$title}{/if}{if $templatefile eq 'viewinvoice'}{$LANG.invoicesview}{/if}</h1>
		
		{if $templatefile eq "clientareaproducts" or $templatefile eq "clientareadomains" or $templatefile eq "clientareainvoices" or $templatefile eq "clientareaemails" or $templatefile eq "clientareaquotes" or $templatefile eq "supportticketslist"}
			<div class="search-group">
				<input type="text" id="table-search" class="form-control" placeholder="{$LANG.tableentersearchterm}">
			</div>
		{/if}
	</div>
	<div>
		{if $showbreadcrumb}{include file="$template/includes/breadcrumb.tpl"}{/if}
		{if $desc}
			<span>{$desc}</span>
		{/if}
	</div>
</div>

{/if}