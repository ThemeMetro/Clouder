<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.wildcard.title"}</h2>
            <h3>{lang key="store.ssl.wildcard.tagline"}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="wildcard"}

    <div class="content-block standout">
        <div class="container">
            <div class="row">
                <div class="content-body-block col-md-6">
                    <h2>{lang key="store.ssl.wildcard.descriptionTitle"}</h2>
                    {lang key="store.ssl.wildcard.descriptionContent"}
                </div>
                <div class="content-image-block col-md-6">
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/images/img_vas_ssl_securepage.png">
                </div>
            </div>

        </div>
    </div>

    {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="wildcard"}

    {include file="$template/store/ssl/shared/features.tpl" type="wildcard"}

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>
