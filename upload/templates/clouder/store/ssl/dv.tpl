<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.dv.title"}</h2>
            <h3>{lang key="store.ssl.dv.tagline"}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="dv"}

    <div class="content-block standout">
        <div class="container">
            <div class="row">
                <div class="content-body-block col-md-6">
                    <h2>{lang key="store.ssl.dv.descriptionTitle"}</h2>
                    {lang key="store.ssl.dv.descriptionContent"}
                </div>
                <div class="content-image-block col-md-6">
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/images/img_vas_ssl_securepage.png">
                </div>
            </div>
        </div>
    </div>
	
	<div class="content-block features">
		<div class="container">
			<h2 class="block-title">{lang key="store.ssl.useCases.title"}</h2>
			<div class="row ideal-for dv">
				<div class="col-sm-4">
					<i class="fas fa-comment-alt-lines"></i>
					<h4>{lang key="store.ssl.useCases.blogs"}</h4>
				</div>
				<div class="col-sm-4">
					<i class="fas fa-file-alt"></i>
					<h4>{lang key="store.ssl.useCases.infoPages"}</h4>
				</div>
				<div class="col-sm-4">
					<i class="fas fa-server"></i>
					<h4>{lang key="store.ssl.useCases.serverComms"}</h4>
				</div>
			</div>
		</div>
	</div>

    {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="dv"}

    {include file="$template/store/ssl/shared/features.tpl" type="dv"}

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>
