{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{if $linkableProviders }
    <h3>
        {lang key='remoteAuthn.titleLinkedAccounts'}
    </h3>

    {include file="$template/includes/linkedaccounts.tpl" linkContext="clientsecurity" }

    <br>

    {include file="$template/includes/linkedaccounts.tpl" linkContext="linktable" }

    <br>
{/if}

{if $showSsoSetting}

	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">{$LANG.sso.title}</div>
		</div>
		<div class="panel-body">
		
			{include file="$template/includes/alert.tpl" type="success" msg=$LANG.sso.summary}

			<form id="frmSingleSignOn">
				<input type="hidden" name="token" value="{$token}" />
				<input type="hidden" name="action" value="security" />
				<input type="hidden" name="toggle_sso" value="1" />
				<div class="margin-10">
					<input type="checkbox" name="allow_sso" class="toggle-switch-success" id="inputAllowSso"{if $isSsoEnabled} checked{/if}>
					&nbsp;
					<span id="ssoStatusTextEnabled"{if !$isSsoEnabled} class="hidden"{/if}>
						{$LANG.sso.enabled}
					</span>
					<span id="ssoStatusTextDisabled"{if $isSsoEnabled} class="hidden"{/if}>
						{$LANG.sso.disabled}
					</span>
				</div>
			</form>

			<p>{$LANG.sso.disablenotice}</p>

		</div>
	</div>

{/if}

    