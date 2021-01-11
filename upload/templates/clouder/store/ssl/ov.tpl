<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.ov.title"}</h2>
            <h3>{lang key="store.ssl.ov.tagline"}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="ov"}

    <div class="content-block standout">
        <div class="container">
            <div class="row">
                <div class="content-body-block col-md-6">
                    <h2>{lang key="store.ssl.ov.descriptionTitle"}</h2>
                    {lang key="store.ssl.ov.descriptionContent"}
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
			<div class="row ideal-for ov">
				<div class="col-sm-4">
					<i class="fas fa-lock-alt"></i>
					<h4>{lang key="store.ssl.useCases.loginPages"}</h4>
				</div>
				<div class="col-sm-4">
					<i class="fas fa-project-diagram"></i>
					<h4>{lang key="store.ssl.useCases.intranetSites"}</h4>
				</div>
				<div class="col-sm-4">
					<i class="fas fa-inbox"></i>
					<h4>{lang key="store.ssl.useCases.webmail"}</h4>
				</div>
			</div>
		</div>
	</div>

    {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="ov"}

    <div class="content-block dashed-border standout">
        <div class="container">
            <div class="row d-flex align-items-center">
                <div class="content-image-block col-md-6">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/cert-details-ov.png">
                </div>
                <div class="content-body-block col-md-6">
                    <h2>{lang key="store.ssl.ov.orgInfo"}</h2>
                    <p>{lang key="store.ssl.ov.orgInfoDescription"}</p>
                </div>
            </div>
        </div>
    </div>

    {include file="$template/store/ssl/shared/features.tpl" type="ov"}

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>
