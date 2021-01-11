{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

<div class="TM-card search-card">
	<form role="form" method="post" action="{routePath('knowledgebase-search')}">
		<div class="input-group input-group-lg kb-search">
			<input type="text" id="inputKnowledgebaseSearch" name="search" class="form-control" placeholder="{$LANG.howcanwehelp}" />
			<span class="input-group-btn">
				<input type="submit" id="btnKnowledgebaseSearch" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
			</span>
		</div>
	</form>
</div>



<div class="section">
	{if $kbcats}
		<h4>{$LANG.knowledgebasecategories}</h4>
		<div class="kbcat">
			<div class="row">
				{foreach from=$kbcats name=kbcats item=kbcat}
					<div class="col-sm-6">
						<div class="kb-article" onclick="clickableSafeRedirect(event, '{routePath('knowledgebase-category-view', {$kbcat.id}, {$kbcat.urlfriendlyname})}')">
							<i class="fas fa-folder{if $kbcat.numarticles > 0 }-open{/if}"></i> {$kbcat.name} ({$kbcat.numarticles})
							{if $kbcat.editLink}
								<span class="admin-edit-link"><a href="{$kbcat.editLink}">
									<i class="fas fa-edit fa-fw"></i>{$LANG.edit}
								</a></span>
							{/if}
							<p>{$kbcat.description}</p>
						</div>
					</div>
					{if $smarty.foreach.kbcats.iteration mod 2 == 0}
						</div><div class="row">
					{/if}
				{/foreach}
			</div>
		</div>
	{else}
		{include file="$template/includes/alert.tpl" type="info" msg=$LANG.knowledgebasenoarticles textcenter=true}
	{/if}
</div>

{if $kbmostviews}
	<div class="section">
		<h4>{$LANG.knowledgebasepopular}</h4>

		<div class="kbarticles">
			{foreach from=$kbmostviews item=kbarticle}
				<div class="kb-article" onclick="clickableSafeRedirect(event, '{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}')">
					<span class="glyphicon glyphicon-file"></span>&nbsp;{$kbarticle.title} {if $kbarticle.editLink} <span class="admin-edit-link"><a href="{$kbarticle.editLink}"><i class="fas fa-edit fa-fw"></i>{$LANG.edit}</a></span>{/if}
					<p>{$kbarticle.article|truncate:100:"..."}</p>
				</div>
			{/foreach}
		</div>
	</div>
{/if}
