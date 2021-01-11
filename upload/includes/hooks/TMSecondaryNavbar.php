<?php
	$ca = new WHMCS_ClientArea(); 
	use WHMCS\View\Menu\Item as MenuItem;
	use WHMCS\Authentication\CurrentUser as CurrentUser;
 
	add_hook('ClientAreaSecondaryNavbar', 1, function (MenuItem $secondaryNavbar) {
		
        if (!is_null($secondaryNavbar->getChild('Account'))) {
            $secondaryNavbar->getChild('Account')->setIcon('fa-user');
        }
        $client = Menu::context('client');
        $TMgreeting = is_null($client) ? "<span class='user-info'>" . Lang::trans('account') . "</span>" : "<span class='user-info'>" . Lang::trans('hello') . ", {$client->firstName}!</span>";

        $user = CurrentUser::user();
        if(!is_null($user))
        {
            $TMgreeting = "<span class='user-info'>" . Lang::trans('hello') . ", {$user->firstName}!</span>";
        }
			
		$TMnavItem = $secondaryNavbar->getChild('Account');
		$TMnavItem->setLabel($TMgreeting);
	});

?>