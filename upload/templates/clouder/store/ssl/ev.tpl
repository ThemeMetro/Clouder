<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.ev.title"}</h2>
            <h3>{lang key="store.ssl.ev.tagline"}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="ev"}

    <div class="content-block standout">
        <div class="container">
            <div class="row">
                <div class="content-body-block col-md-6">
                    <h2>{lang key="store.ssl.ev.descriptionTitle"}</h2>
                    {lang key="store.ssl.ev.descriptionContent"}
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
			<div class="row ideal-for ev">
				<div class="col-sm-4">
					<i class="fas fa-globe-americas"></i>
					<h4>{lang key="store.ssl.useCases.criticalDomains"}</h4>
				</div>
				<div class="col-sm-4">
					<i class="fas fa-shopping-cart"></i>
					<h4>{lang key="store.ssl.useCases.ecommerce"}</h4>
				</div>
				<div class="col-sm-4">
					<i class="fas fa-user-plus"></i>
					<h4>{lang key="store.ssl.useCases.signupPages"}</h4>
				</div>
			</div>
		</div>
	</div>

    {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="ev"}

    <div class="content-block dashed-border standout">
        <div class="container">
            <div class="row d-flex align-items-center">
                <div class="content-image-block col-md-6">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/cert-details-ev.png">
                </div>
                <div class="content-body-block col-md-6">
                    <h2>{lang key="store.ssl.ev.orgInfo"}</h2>
                    <p>{lang key="store.ssl.ev.orgInfoDescription"}</p>
                </div>
            </div>
        </div>
    </div>

    {include file="$template/store/ssl/shared/features.tpl" type="ev"}

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>
