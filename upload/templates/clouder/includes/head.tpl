{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

<link href="{$WEB_ROOT}/templates/{$template}/assets/css/bootstrap.min.css" rel="stylesheet" />
		
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/assets/css/fontawsome.min.css">
		
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/assets/css/plugins/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/assets/css/plugins/footable/footable.min.css">
		
		
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/assets/css/themes/style.css">
{if $templatefile eq 'homepage' or $pagetype eq 'clouder'}{else}
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/assets/css/whmcs.min.css" />
{/if}

<!-- Custom Styling -->
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/assets/css/custom.css" />

		
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<link rel="shortcut icon" href="{$WEB_ROOT}/templates/{$template}/favicon.ico">

<script type="text/javascript">
    var csrfToken = '{$token}',
        markdownGuide = '{lang key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang key="markdown.saved"}',
        saving = '{lang key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}",
        requiredText = '{lang key="orderForm.required"}',
        recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
</script>

<script src="{$WEB_ROOT}/templates/{$template}/assets/js/scripts.min.js?v={$versionHash}"></script>

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
