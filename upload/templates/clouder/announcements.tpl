{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

{if $announcementsFbRecommend}
    <script>
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/{$LANG.locale}/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
{/if}

{if count($announcements) > 3 }
<script>
	$(document).ready(function(){
		$('.annuncement-item:nth-child(1), .annuncement-item:nth-child(2)').addClass('latest col-sm-6');
		$('.annuncement-item:nth-child(1)').addClass('last');
	});
</script>
{/if}

{if $announcements}
	<div class="TM-card annoucements">
		<div class="row">
			{foreach from=$announcements item=announcement}

				<div class="annuncement-item col-xs-12" onclick="clickableSafeRedirect(event, '{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}')">
					<p class="announcement-date">{$carbon->createFromTimestamp($announcement.timestamp)->format('jS M Y')}</p>
					<h3>{$announcement.title}</h3>
					<div class="annuncement-body">
						{if $announcement.text|strip_tags|strlen < 350}
							<p>{$announcement.text}</p>
						{else}
							<p>{$announcement.summary}</p>
						{/if}
					</div>
				  
					<div class="annuncement-footer">
						<div class="btn-group">
							<span class="btn btn-xs btn-link">{$LANG.readmore} &raquo;</span>
							{if $announcement.editLink}
								<a href="{$announcement.editLink}" class="btn btn-xs btn-primary">
									<i class="fas fa-edit fa-fw"></i>{$LANG.edit}
								</a>
							{/if}
						</div>
						
						 <div class="announcement-details">
							{*{if $announcementsFbRecommend}
								<div class="fb-like hidden-sm hidden-xs" data-layout="standard" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
								<div class="fb-like hidden-lg hidden-md" data-layout="button_count" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
							{/if}*}
						 </div>
					</div>
				</div>
			{/foreach}
		</div>

		{if $prevpage || $nextpage}
			<ul class="pagination">
				{if $prevpage}
					<li>
						<a href="{routePath('announcement-index-paged', $prevpage, $view)}">{$LANG.previouspage}</a>
					</li>
				{else}
					<li class="disabled">
						<span>{$LANG.previouspage}</span>
					</li>
				{/if}
				{if $nextpage}
					<li >
						<a href="{routePath('announcement-index-paged', $nextpage, $view)}">{$LANG.nextpage}</a>
					</li>
				{else}
					<li class="disabled">
					<span>{$LANG.nextpage}</span>
					</li>
				{/if}
			</ul>
		{/if}
	</div>

{else}

	{include file="$template/includes/alert.tpl" type="info" msg="{$LANG.noannouncements}" textcenter=true}

{/if}

