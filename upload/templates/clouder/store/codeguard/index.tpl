<!--[if lt IE 9]>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
<![endif]-->

<link type="text/css" rel="stylesheet" href="{$BASE_PATH_CSS}/ion.rangeSlider.css" property="stylesheet" />
<link type="text/css" rel="stylesheet" href="{$BASE_PATH_CSS}/ion.rangeSlider.skinHTML5.css" property="stylesheet" />
<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page codeguard">

    <div class="hero">
        <div class="container">
            <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/logo.png">
            <h2 class="strong-green">{lang key="store.codeGuard.headline"}</h2>
            <h3>{lang key="store.codeGuard.tagline"}</h3>
        </div>
    </div>

    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-landing-page" aria-expanded="false">
                    <span class="sr-only">{lang key="store.toggleNav"}</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="nav-landing-page">
                <ul class="nav navbar-nav">
                    <li><a href="#" onclick="smoothScroll('#overview');return false">{lang key="store.codeGuard.tab.overview"}</a></li>
                    <li><a href="#" onclick="smoothScroll('#pricing');return false">{lang key="store.codeGuard.tab.pricing"}</a></li>
                    <li><a href="#" onclick="smoothScroll('#features');return false">{lang key="store.codeGuard.tab.features"}</a></li>
                    <li><a href="#" onclick="smoothScroll('#faq');return false">{lang key="store.codeGuard.tab.faq"}</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="content-block image-standout border-bottom" id="overview">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 text-center">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/hero-image-a.png">
                </div>
                <div class="col-sm-8">
                    <h2 class="strong-green">{lang key="store.codeGuard.leadTitle"}</h2>
                    <p>{lang key="store.codeGuard.leadText1"}</p>
                    <p>{lang key="store.codeGuard.leadText2"}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block overview-features">
        <div class="container">
            <ul>
                <li>
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/icons/backup-icon.png">
                    <span>{lang key="store.codeGuard.dailyBackup"}</span>
                </li>
                <li>
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/icons/client-icon.png">
                    <span>{lang key="store.codeGuard.timeMachine"}</span>
                </li>
                <li>
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/icons/wp-icon.png">
                    <span>{lang key="store.codeGuard.wpPlugin"}</span>
                </li>
                <li>
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/icons/alert-icon.png">
                    <span>{lang key="store.codeGuard.changeAlerts"}</span>
                </li>
                <li>
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/icons/malware-icon.png">
                    <span>{lang key="store.codeGuard.malwareProtection"}</span>
                </li>
            </ul>
        </div>
    </div>
	
    <div class="content-block pricing get-started" id="pricing">
        <div class="container">
			<div class="mw-928 mx-auto">
				<div class="TM-card pricing-tables">						
					<div class="pricing-slider-container">
					{if count($products) > 0}
							<div class="pricing-slider-header d-flex align-items-center">
							<h4>{lang key='store.codeGuard.chooseBackupPlan'}</h4>
							{if !$loggedin && $currencies}
								<form method="post" action="{routePath('store-product-group', $routePathSlug)}">
									<select name="currency" class="form-control currency-selector" onchange="submit()">
										<option>{lang key="changeCurrency"} ({$activeCurrency.prefix} {$activeCurrency.code})</option>
										{foreach $currencies as $currency}
										<option value="{$currency['id']}">{$currency['prefix']} {$currency['code']}</option>
										{/foreach}
									</select>
								</form>
							{/if}
							</div>
							<div class="pricing-slider-body">
								<div class="pricing-slider-top">
									<div class="slider">
										<div class="slider-slide">
											<input type="hidden" id="codeGuardPlanSelector" name="codeguardplan" value="" />
										</div>
										<div class="pricing-slider-actions" id="codeGuardPlanActions">
											
										</div>
									</div>
								</div>  
								<div class="pricing-slider-bottom">
									<div class="pricing-slider-summary">
										<div class="pricing-slider-summary-item">
											<div class="pricing-slider-summary-label">
												Storage
											</div>  
											<div class="pricing-slider-summary-value">
												<span id="diskSpace"></span>
											</div>
										</div>
										<div class="pricing-slider-summary-item">
											<div class="pricing-slider-summary-label">
												Price
											</div>  
											<div class="pricing-slider-summary-value">
												<span id="pricingAmount" class="price"></span><span class="price-cycle" id="pricingCycle"></span>
											</div>
										</div>
									</div>
									<div class="pricing-slider-form-action form-actions">
										<form action="{routePath('cart-order')}" method="post">
											<input id="selectedProductId" type="hidden" name="pid" value="">
											<button type="submit" class="btn btn-primary btn-lg btn-block order-btn" id="product-order-button">
												{lang key='ordernowbutton'}
											</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					{elseif $inPreview}
						<div class="alert alert-info">
							<div class="alert-body">
								{lang key="store.codeGuard.adminPreview"}
							</div>
						</div>
					{/if}
				</div>
			</div>
        </div>
    </div>

    <div class="content-block features" id="features">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="feature">
                        <div class="icon">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/features/daily-backups-feature.png">
                        </div>
                        <h4>{lang key="store.codeGuard.features.dailyBackup"}</h4>
                        <p>{lang key="store.codeGuard.features.dailyBackupDescription"}</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature">
                        <div class="icon">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/features/unlimited-files-feature.png">
                        </div>
                        <h4>{lang key="store.codeGuard.features.unlimitedFiles"}</h4>
                        <p>{lang key="store.codeGuard.features.unlimitedFilesDescription"}</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature">
                        <div class="icon">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/features/click-restore-feature.png">
                        </div>
                        <h4>{lang key="store.codeGuard.features.oneClickRestore"}</h4>
                        <p>{lang key="store.codeGuard.features.oneClickRestoreDescription"}</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature">
                        <div class="icon">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/features/malware-feature.png">
                        </div>
                        <h4>{lang key="store.codeGuard.features.malwareMonitoring"}</h4>
                        <p>{lang key="store.codeGuard.features.malwareMonitoringDescription"}</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature">
                        <div class="icon">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/features/wp-feature.png">
                        </div>
                        <h4>{lang key="store.codeGuard.features.wp"}</h4>
                        <p>{lang key="store.codeGuard.features.wpDescription"}</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature">
                        <div class="icon">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/features/file-monitoring-feature.png">
                        </div>
                        <h4>{lang key="store.codeGuard.features.fileMonitoring"}</h4>
                        <p>{lang key="store.codeGuard.features.fileMonitoringDescription"}</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature">
                        <div class="icon">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/features/servers-feature.png">
                        </div>
                        <h4>{lang key="store.codeGuard.features.servers"}</h4>
                        <p>{lang key="store.codeGuard.features.serversDescription"}</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature">
                        <div class="icon">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/features/email-feature.png">
                        </div>
                        <h4>{lang key="store.codeGuard.features.email"}</h4>
                        <p>{lang key="store.codeGuard.features.emailDescription"}</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature">
                        <div class="icon">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/features/api-feature.png">
                        </div>
                        <h4>{lang key="store.codeGuard.features.api"}</h4>
                        <p>{lang key="store.codeGuard.features.apiDescription"}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block faq" id="faq">
        <div class="container">
			<div class="mw-928 mx-auto">
			   <h2 class="block-title text-center">{lang key="store.codeGuard.faq.title"}</h2>
               <div aria-multiselectable="true" class="panel-group" id="accordion" role="tablist">
                    {foreach from=$codeGuardFaqs item=$faq key=num name=foo}
                        <div class="panel panel-default">
                            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#codeguard_faq{$num}" aria-expanded="true">
                                <h4 class="panel-title">{$faq['question']}</h4>
                            </div>
                            <div id="codeguard_faq{$num}" class="panel-collapse collapse {if $smarty.foreach.foo.first}in{/if} " aria-expanded="true" style="">
                                <div class="panel-body">
                                    <p>{$faq['answer']}</p>
                                </div>
                            </div>        
                        </div>
                    {/foreach}
                </div>
			</div>
        </div>
    </div>

    <div class="content-block">
        <div class="container">
            <img class="img-responsive center-block" src="{$WEB_ROOT}/assets/img/marketconnect/codeguard/logo.png">
        </div>
    </div>

</div>

<!-- RangeSlider JS -->
<script type="text/javascript" src="{$BASE_PATH_JS}/ion.rangeSlider.js"></script>
<script type="text/javascript">

    var sliderActivated = false;

    var sliderProductNames = [
    {foreach $products as $product}
        "{$product->diskSpace}",
    {/foreach}
    ];

    var allProducts = {
        {foreach $products as $num => $product}
        "{$num}": {
            "pid": "{$product->id}",
            "name": "{$product->name}",
            "desc": "{$product->formattedProductFeatures.featuresDescription|nl2br|trim}",
            "price": "{if $WHMCSCurrency.prefix}<span class='price-prefix'>{$WHMCSCurrency.prefix}</span>{/if}{$product->pricing()->first()->price()|replace:$WHMCSCurrency.prefix:""}",
            "cycle": {if $product->pricing()->first()->cycle() eq "monthly"}"/mo"{elseif $product->pricing()->first()->cycle() eq "quarterly"}"/3mo"{elseif $product->pricing()->first()->cycle() eq "semiannually"}"/6mo"{elseif $product->pricing()->first()->cycle() eq "annually"}"/yr"{elseif $product->pricing()->first()->cycle() eq "biennially"}"/2yr"{elseif $product->pricing()->first()->cycle() eq "triennially"}"/3yr"{/if},
            "diskspace": "{$product->diskSpace}"
        },
        {/foreach}
    };

    var definedProducts = {
        {foreach $products as $product}
            "{$product->id}": "{$product@index}"{if !($product@last)},{/if}
        {/foreach}
    };

    {foreach $products as $product}
        {if $product->isFeatured}
            var firstFeatured = definedProducts["{$product->id}"];
            {break}
        {/if}
    {/foreach}

    var rangeSliderValues = {
        type: "single",
        grid: false,
        grid_snap: true,
        hide_min_max: true,
        step: 1,
        from: 1,
        onStart: refreshSelectedProduct,
        {if $products|@count eq 1}
            disable: true,
        {/if}
        onChange: refreshSelectedProduct,
        onFinish: stopSliding,
        values: sliderProductNames
    };

    if (typeof firstFeatured !== 'undefined') {
        rangeSliderValues['from'] = firstFeatured;
    }

    var container = $('<div class="slider-actions-list"/>');

    $.each(sliderProductNames, function(i,val) {
        
        container.append('<div class="slider-actions-btn" data-sliderValue="'+i+'"><span>'+val+'</span></div>');
        
    });

    function refreshSelectedProduct(data)
    {
        var featureName = "";
        var featureMarkup = "";
        var i = parseInt(data.from);
        if (isNaN(i)) {
            i = 0;
            jQuery(".irs-single").text(sliderProductNames[0]);
            jQuery(".irs-grid-text").text('');
        }
        jQuery('.irs-slider').addClass('active');
        jQuery("#selectedProductId").val(allProducts[i].pid);
        jQuery("#productDescription").html(allProducts[i].desc);
        jQuery("#pricingAmount").html(allProducts[i].price);
        jQuery("#pricingCycle").html(allProducts[i].cycle);   
        jQuery("#diskSpace").html(allProducts[i].diskspace);     
        jQuery('#codeGuardPlanActions').html(container);
        jQuery('.slider-actions-btn').removeClass('active');
        jQuery('.slider-actions-btn[data-sliderValue="'+i+'"]').addClass('active');     
    }
    function stopSliding(){
        jQuery('.irs-slider').removeClass('active');
    }
    jQuery("#codeGuardPlanSelector").ionRangeSlider(rangeSliderValues);
    {if $products|@count eq 1}
    jQuery(".irs-single").text(sliderProductNames[0]);
    jQuery(".irs-grid-text").text('');
    {/if}

    sliderActivated = true;

    let my_range = $("#codeGuardPlanSelector").data("ionRangeSlider");
    
    jQuery(document).on('click','.slider-actions-btn', function(){
        i = jQuery(this).data('slidervalue');
        my_range.update({literal}{from: i, to: i}{/literal});
        
        jQuery("#selectedProductId").val(allProducts[i].pid);
        jQuery("#productDescription").html(allProducts[i].desc);
        jQuery("#pricingAmount").html(allProducts[i].price);
        jQuery("#pricingCycle").html(allProducts[i].cycle);    
        jQuery("#diskSpace").html(allProducts[i].diskspace);     
        jQuery('#codeGuardPlanActions').html(container);
        jQuery('.slider-actions-btn').removeClass('active');
        jQuery('.slider-actions-btn[data-sliderValue="'+i+'"]').addClass('active');
    });
</script>