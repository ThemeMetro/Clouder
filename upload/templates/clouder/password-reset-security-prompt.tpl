{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}

<p>{$LANG.pwresetsecurityquestionrequired}</p>

<form method="post" action="{routePath('password-reset-security-verify')}"  class="form-stacked">
    <div class="form-group">
		<div class="input-icon right">
			<span class="far fa-question-circle text-gray"></span>
			{* <label for="inputAnswer">{$securityQuestion}</label> *}
			<input type="text" name="answer" class="form-control" placeholder="{$securityQuestion}" id="inputAnswer" autofocus>
		</div>
    </div>

    <div class="form-group text-center">
        <button type="submit" class="btn btn-block btn-lg btn-primary">{$LANG.pwresetsubmit}</button>
    </div>

</form>
