{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


<div class="article">
<p>
	<i class="far fa-calendar"></i>&nbsp;{$carbon->createFromTimestamp($timestamp)->format('l, F j, Y')}
	{if $editLink}
		<a href="{$editLink}">
			<i class="fas fa-edit fa-fw"></i>{$LANG.edit}
		</a>
	{/if}
</p>

<div class="article-content">
	{$text}
</div>


<br />
<br />
</div>


{if $twittertweet or $facebookrecommend or $googleplus1}
	<div class="TM-card social">
		{if $twittertweet}
			<div>
				<div class="tweetbutton" style="display:inline-block;"><a href="https://twitter.com/share" class="twitter-share-button" data-via="{$twitterusername}">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script></div>
			</div>
		{/if}
		{if $facebookrecommend}
			<div>
				{literal}<script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = "//connect.facebook.net/en_US/all.js#xfbml=1"; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk'));</script>{/literal}
				<div class="fb-like" data-href="{fqdnRoutePath('announcement-view', $id, $urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
			</div>
		{/if}
	</div>

{/if}

{if $facebookcomments}
    <br />
    <br />
    {literal}
    <div id="fb-root">
    </div>
    <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
    {/literal}
    <fb:comments href="{fqdnRoutePath('announcement-view', $id, $urlfriendlytitle)}" num_posts="5" width="100%"></fb:comments>
{/if}

<p>
    <a href="{routePath('announcement-index')}" class="btn btn-default">{$LANG.clientareabacklink}</a>
</p>
