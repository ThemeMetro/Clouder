{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{if empty($dlcats) }
    {include file="$template/includes/alert.tpl" type="info" msg=$LANG.downloadsnone textcenter=true}
{else}

	<p>{$LANG.downloadsintrotext}</p>
	<div class="TM-card search-card">
		<form role="form" method="post" action="{routePath('download-search')}">
			<div class="input-group input-group-lg kb-search">
				<input type="text" name="search" id="inputDownloadsSearch" class="form-control" placeholder="{$LANG.downloadssearch}" />
				<span class="input-group-btn">
					<input type="submit" id="btnDownloadsSearch" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
				</span>
			</div>
		</form>
	</div>
	
	<div class="section">
    <h4>{$LANG.downloadscategories}</h4>
		<div class="kbcat">
			<div class="row">
				{foreach $dlcats as $dlcat}
					<div class="col-sm-6">
						<a class="kb-article" href="{routePath('download-by-cat', $dlcat.id, $dlcat.urlfriendlyname)}">
							<i class="far fa-folder-open"></i> {$dlcat.name}({$dlcat.numarticles})
						<p>{$dlcat.description}</p>
						</a>

					</div>
				{foreachelse}
					<div class="col-sm-12">
						<p class="text-center fontsize3">{$LANG.downloadsnone}</p>
					</div>
				{/foreach}
			</div>
		</div>
	</div>

	<div class="section">		
		<h4>{$LANG.downloadspopular}</h4>
		<div class="list-group">
			{foreach $mostdownloads as $download}
				<a href="{$download.link}" class="list-group-item">
					<strong>
						<i class="fas fa-download"></i>
						{$download.title}
						{if $download.clientsonly}
							<i class="fas fa-lock text-muted"></i>
						{/if}
					</strong>
					<br>
					{$download.description}
					<br>
					<small>{$LANG.downloadsfilesize}: {$download.filesize}</small>
				</a>
			{foreachelse}
				<span class="list-group-item text-center">
					{$LANG.downloadsnone}
				</span>
			{/foreach}
		</div>
	</div>
{/if}
