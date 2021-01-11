<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page ox">
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-push-6 text-center">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/ox/display-email.png" class="header-img">
                </div>
                <div class="col-md-6 col-md-pull-6">
                    <div class="header-content">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/ox/logo-inv.png" class="logo-img">
                        <h1>{lang key="store.ox.promoHeading"}</h1>
                        <button type="button" class="btn btn-success" onclick="smoothScroll('#oxPricing')">
                            {lang key="store.ox.viewPricing"}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="stand-out">
        <div class="container">
            <div class="row row-eq-height">
                <div class="col-md-4 col-sm-6">
                    <div class="wrapper">
                        <h2>{lang key="store.ox.standout.feature1.title"}</h2>
                        <ul>
                            <li>{lang key="store.ox.standout.feature1.bullet1"}</li>
                            <li>{lang key="store.ox.standout.feature1.bullet2"}</li>
                            <li>{lang key="store.ox.standout.feature1.bullet3"}</li>
                            <li>{lang key="store.ox.standout.feature1.bullet4"}</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="wrapper">
                        <h2>{lang key="store.ox.standout.feature2.title"}</h2>
                        <p>{lang key="store.ox.standout.feature2.detail"}</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <div class="wrapper">
                        <h2>{lang key="store.ox.standout.feature3.title"}</h2>
                        <p>{lang key="store.ox.standout.feature3.detail"}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content-block features">
        <div class="container">
            {* <h3>{lang key="store.ox.featuresHeadline"}</h3> *}
            <div class="row">
                <div class="col-md-6">
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/ox/icon-dark-cloud.png">
                        <p class="title">{lang key="store.ox.feature1.title"}</p>
                        <p>{lang key="store.ox.feature1.detail"}</p>
                    </div>
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/ox/icon-dark-calendar.png">
                        <p class="title">{lang key="store.ox.feature2.title"}</p>
                        <p>{lang key="store.ox.feature2.detail"}</p>
                    </div>
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/ox/icon-dark-email.png">
                        <p class="title">{lang key="store.ox.feature3.title"}</p>
                        <p>{lang key="store.ox.feature3.detail"}</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/ox/icon-dark-productivity.png">
                        <p class="title">{lang key="store.ox.feature4.title"}</p>
                        <p>{lang key="store.ox.feature4.detail"}</p>
                    </div>
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/ox/icon-dark-apps.png">
                        <p class="title">{lang key="store.ox.feature5.title"}</p>
                        <p>{lang key="store.ox.feature5.detail"}</p>
                    </div>
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/ox/icon-dark-privacy.png">
                        <p class="title">{lang key="store.ox.feature6.title"}</p>
                        <p>{lang key="store.ox.feature6.detail"}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content-block pricing" id="oxPricing">
        <div class="container">
            {* <h3>{lang key="store.ox.pricingHeadline"}</h3> *}
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <table>
                        <tr>
                            <td class="no-border"></td>
                            {foreach $plans as $plan}
                                <th{if $plan.configoption1 == 'ox_productivity'} class="feature"{/if}>{$plan->name}</th>
                            {/foreach}
                        </tr>
                        {foreach $plans[0]['features'] as $feature => $value}
                            <tr>
                                <td>{$feature}</td>
                                {foreach $plans as $plan}
                                    <td>
                                        {if is_bool($plan['features'][$feature])}
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/ox/pricing-yes.png">
                                        {else}
                                            {$plan['features'][$feature]}
                                        {/if}
                                    </td>
                                {/foreach}
                            </tr>
                        {/foreach}
                        <tr>
                            <td class="no-border no-bg"></td>
                            {foreach $plans as $plan}
                                <td class="no-border buy">
                                    <div class="pricing-label">
                                        {if $inPreview}
                                            -
                                        {else}
                                            {$plan->pricing()->first()->toFullString()}<small>/user</small>
                                        {/if}
                                    </div>

                                    <form method="post" action="{routePath('cart-order')}">
                                        <input type="hidden" name="pid" value="{$plan->id}">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            {lang key="store.ssl.landingPage.buyNow"}
                                        </button>
                                    </form>
                                </td>
                            {/foreach}
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
	
    <div class="content-block faqs" id="faq">
        <div class="container">
			<div class="mw-928 mx-auto">
				<div id="accordion" class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#faq-1" aria-expanded="true">
							<h4 class="panel-title">{lang key="store.ox.faq1.question"}</h4>
						</div>
						<div id="faq-1" class="panel-collapse collapse in" aria-expanded="true" style="">
							<div class="panel-body">
								<p>{lang key="store.ox.faq1.answer"}</p>
							</div>
						</div>        
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#faq-2" aria-expanded="true">
							<h4 class="panel-title">{lang key="store.ox.faq2.question"}</h4>
						</div>
						<div id="faq-2" class="panel-collapse collapse" aria-expanded="true" style="">
							<div class="panel-body">
								<p>{lang key="store.ox.faq2.answer"}</p>
							</div>
						</div>        
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#faq-3" aria-expanded="true">
							<h4 class="panel-title">{lang key="store.ox.faq3.question"}</h4>
						</div>
						<div id="faq-3" class="panel-collapse collapse" aria-expanded="true" style="">
							<div class="panel-body">
								<p>{lang key="store.ox.faq3.answer"}</p>
							</div>
						</div>        
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#faq-4" aria-expanded="true">
							<h4 class="panel-title">{lang key="store.ox.faq4.question"}</h4>
						</div>
						<div id="faq-4" class="panel-collapse collapse" aria-expanded="true" style="">
							<div class="panel-body">
								<p>{lang key="store.ox.faq4.answer"}</p>
							</div>
						</div>        
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#faq-5" aria-expanded="true">
							<h4 class="panel-title">{lang key="store.ox.faq5.question"}</h4>
						</div>
						<div id="faq-5" class="panel-collapse collapse" aria-expanded="true" style="">
							<div class="panel-body">
								<p>{lang key="store.ox.faq5.answer"}</p>
							</div>
						</div>        
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#faq-6" aria-expanded="true">
							<h4 class="panel-title">{lang key="store.ox.faq6.question"}</h4>
						</div>
						<div id="faq-6" class="panel-collapse collapse" aria-expanded="true" style="">
							<div class="panel-body">
								<p>{lang key="store.ox.faq6.answer"}</p>
							</div>
						</div>        
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#faq-7" aria-expanded="true">
							<h4 class="panel-title">{lang key="store.ox.faq7.question"}</h4>
						</div>
						<div id="faq-7" class="panel-collapse collapse" aria-expanded="true" style="">
							<div class="panel-body">
								<p>{lang key="store.ox.faq7.answer"}</p>
							</div>
						</div>        
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#faq-8" aria-expanded="true">
							<h4 class="panel-title">{lang key="store.ox.faq8.question"}</h4>
						</div>
						<div id="faq-8" class="panel-collapse collapse" aria-expanded="true" style="">
							<div class="panel-body">
								<p>{lang key="store.ox.faq8.answer"}</p>
							</div>
						</div>        
					</div>
				</div>
			</div>
        </div>
    </div>
</div>

