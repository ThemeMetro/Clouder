{include file="orderforms/{$carttpl}/common.tpl"}

{if file_exists("templates/orderforms/$carttpl/layouts/head.tpl")}
	{include file="templates/orderforms/{$carttpl}/layouts/head.tpl"}
{/if}

<div id="order-standard_cart">

    <div class="row">

         <div class="col-md-12">
			{if file_exists("templates/orderforms/$carttpl/layouts/head.tpl")}
			{else}
            <div class="header-lined">
                <h1>{$LANG.transferdomain}</h1>
            </div>
			{/if}
			{include file="orderforms/{$carttpl}/sidebar-categories-collapsed.tpl"}

        </div>


        <div class="col-md-12">
			{if file_exists("templates/orderforms/$carttpl/layouts/head.tpl")}
			{else}
            <div class="text-center">
                <h2>{lang key='orderForm.transferToUs'}</h2>
                <p>{lang key='orderForm.transferExtend'}*</p>
            </div>
            <br />
			{/if}

            <form method="post" action="cart.php" id="frmDomainTransfer">
                <input type="hidden" name="a" value="addDomainTransfer">

                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">{lang key='orderForm.singleTransfer'}</h3>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="inputTransferDomain">{lang key='domainname'}</label>
                                    <input type="text" class="form-control" name="domain" id="inputTransferDomain" value="{$lookupTerm}" placeholder="{lang key='yourdomainplaceholder'}.{lang key='yourtldplaceholder'}" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                                </div>
                                <div class="form-group">
                                    <label for="inputAuthCode" style="width:100%;">
                                        {lang key='orderForm.authCode'}
                                         <a href="" data-toggle="tooltip" data-placement="left" title="{lang key='orderForm.authCodeTooltip'}" class="pull-right"><i class="fas fa-question-circle"></i> {lang key='orderForm.help'}</a>
                                    </label>
                                    <input type="text" class="form-control" name="epp" id="inputAuthCode" placeholder="{lang key='orderForm.authCodePlaceholder'}" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                </div>
                                <div id="transferUnavailable" class="alert alert-warning slim-alert text-center hidden"></div>
                                {if $captcha->isEnabled() && !$captcha->recaptcha->isEnabled()}
                                    <div class="captcha-container" id="captchaContainer">
                                        <div class="default-captcha">
                                            <p>{lang key="cartSimpleCaptcha"}</p>
                                            <div>
                                                <img id="inputCaptchaImage" src="{$systemurl}includes/verifyimage.php" />
                                                <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control input-sm" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                            </div>
                                        </div>
                                    </div>
                                {elseif $captcha->isEnabled() && $captcha->recaptcha->isEnabled() && !$captcha->recaptcha->isInvisible()}
                                    <div class="form-group recaptcha-container" id="captchaContainer"></div>
                                {/if}
                            </div>
                            <div class="panel-footer text-right">
                                <button type="submit" id="btnTransferDomain" class="btn btn-primary btn-transfer{$captcha->getButtonClass($captchaForm)}">
                                    <span class="loader hidden" id="addTransferLoader">
                                        <i class="fas fa-fw fa-spinner fa-spin"></i>
                                    </span>
                                    <span id="addToCart">{lang key="orderForm.addToCart"}</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </form>

            <p class="text-center small">* {lang key='orderForm.extendExclusions'}</p>

        </div>
    </div>
</div>


{if file_exists("templates/orderforms/$carttpl/layouts/foot.tpl")}
	{include file="templates/orderforms/{$carttpl}/layouts/foot.tpl"}
{/if}