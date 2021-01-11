{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


<div class="section">
	<h3>{lang key="userManagement.managePermissions"}</h3>
	<p>{$user->email}</p>
</div>
<div class="section">
	<h4>{lang key="userManagement.permissions"}</h4>
	<form method="post" action="{routePath('account-users-permissions-save', $user->id)}">
		<div class="TM-card">
			{foreach $permissions as $permission}
				<label class="checkbox-inline">
					<input type="checkbox" name="perms[{$permission.key}]" value="1"{if $userPermissions->hasPermission($permission.key)} checked{/if}>
					{$permission.title}
					-
					{$permission.description}
				</label>
				<br>
			{/foreach}
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">
				{lang key="clientareasavechanges"}
			</button>
			<a href="{routePath('account-users')}" class="btn btn-default">
				{lang key="clientareacancel"}
			</a>
		</div>

	</form>
</div>
