{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

<div class="TM-card search-card">
	<form role="form" method="post" action="{routePath('knowledgebase-search')}">
		<div class="input-group input-group-lg kb-search">
			<input type="text" name="search" class="form-control input-lg" placeholder="{$LANG.howcanwehelp}" value="{$searchterm}" />
			<span class="input-group-btn">
				<input type="submit" id="btnKnowledgebaseSearch" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
			</span>
		</div>
	</form>
</div>

{if $kbcats}
	<div class="section">
    <h4>{$LANG.knowledgebasecategories}</h4>
		<div class="kbcat">
			<div class="row">
			{foreach name=kbasecats from=$kbcats item=kbcat}
				<div class="col-sm-6">
					<div class="kb-article" onclick="clickableSafeRedirect(event, '{routePath('knowledgebase-category-view',{$kbcat.id},{$kbcat.urlfriendlyname})}')">
						<i class="fas fa-folder{if $kbcat.numarticles > 0 }-open{/if}"></i> {$kbcat.name} ({$kbcat.numarticles})
						{if $kbcat.editLink}
							<span class="admin-edit-link"><a href="{$kbcat.editLink}">
								<i class="fas fa-edit fa-fw"></i>{$LANG.edit}
							</a></span>
						{/if}
						<p>{$kbcat.description}</p>
					</div>
				</div>
			{/foreach}
			</div>
		</div>
	</div>
{/if}

{if $kbarticles || !$kbcats}
	<div class="section">
		{if $tag}
			<h4>{$LANG.kbviewingarticlestagged} '{$tag}'</h4>
		{else}
			<h4>{$LANG.knowledgebasearticles}</h4>
		{/if}
		{if $kbarticles}
		<div class="kbarticles">
			{foreach from=$kbarticles item=kbarticle}
				<div class="kb-article" onclick="clickableSafeRedirect(event, '{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}')">
					<span class="glyphicon glyphicon-file"></span>&nbsp;{$kbarticle.title} {if $kbarticle.editLink} <span class="admin-edit-link"><a href="{$kbarticle.editLink}">{$LANG.edit}</a></span>{/if}
					<p>{$kbarticle.article|truncate:100:"..."}</p>
				</div>
			{/foreach}
		</div>
		
		{else}
			{include file="$template/includes/alert.tpl" type="info" msg=$LANG.knowledgebasenoarticles textcenter=true}
		{/if}
	</div>
{/if}
