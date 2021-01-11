{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

<div class="article">
	<div>
		<a href="#" class="pull-right" onclick="window.print();return false"><i class="fal fa-print"></i></a>
		<div class="article-title">
			<h2>{$kbarticle.title}</h2>
		</div>
		<div class="clearfix"></div>
	</div>


	{if $kbarticle.voted}{include file="$template/includes/alert.tpl" type="success" msg="{lang key="knowledgebaseArticleRatingThanks"}" textcenter=true}{/if}

	<div class="article-content">
		{$kbarticle.text}
	</div>
	
	<div class="article-tools">
		<ul class="kb-article-details">
			{if $kbarticle.editLink}<li><a href="{$kbarticle.editLink}"><i class="fas fa-edit fa-fw"></i>{$LANG.edit}</li></a>{/if}
			{if $kbarticle.tags }<li><i class="fas fa-tag"></i> {$kbarticle.tags}</li>{/if}
			<li><i class="fas fa-star"></i> {$kbarticle.useful} {$LANG.knowledgebaseratingtext}</li>
		</ul>
		<div class="clearfix"></div>
	</div>


	<div class="rate-article hidden-print">

		<div class="TM-card">
			<form action="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" method="post">
				<input type="hidden" name="useful" value="vote">
				{if $kbarticle.voted}{$LANG.knowledgebaserating}{else}{$LANG.knowledgebasehelpful}{/if}
				{if $kbarticle.voted}
					{$kbarticle.useful} {$LANG.knowledgebaseratingtext} ({$kbarticle.votes} {$LANG.knowledgebasevotes})
				{else}
					<button type="submit" name="vote" value="yes" class="btn btn-primary btn-sm"><i class="far fa-thumbs-up"></i> {$LANG.knowledgebaseyes}</button>
					<button type="submit" name="vote" value="no" class="btn  btn-default btn-sm"><i class="far fa-thumbs-down"></i> {$LANG.knowledgebaseno}</button>
				{/if}
			</form>
		</div>

		
	</div>
</div>

{if $kbarticles}
    <div class="kb-also-read">
        <h4>{$LANG.knowledgebaserelated}</h4>
        <div class="kbarticles">
            {foreach key=num item=kbarticle from=$kbarticles}
				<div class="kb-article" onclick="clickableSafeRedirect(event, '{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}')">
					<span class="glyphicon glyphicon-file"></span>&nbsp;{$kbarticle.title} {if $kbarticle.editLink} <span class="admin-edit-link"><a href="{$kbarticle.editLink}"><i class="fas fa-edit fa-fw"></i>{$LANG.edit}</a></span>{/if}
					<p>{$kbarticle.article|truncate:100:"..."}</p>
				</div>
            {/foreach}
        </div>
    </div>
{/if}