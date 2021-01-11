<?php

	$ca = new WHMCS_ClientArea();
	use WHMCS\View\Menu\Item as MenuItem;
	use Illuminate\Database\Capsule\Manager as Capsule;

	

	add_hook('ClientAreaPrimaryNavbar', 1, function (MenuItem $primaryNavbar) {
			
			global $CONFIG;			
			$friendlyurl = $CONFIG['RouteUriPathMode'];
    
			if ($friendlyurl == 'acceptpathinfo') {
				$urlpath = 'index.php/';
				$urlpathstore = 'index.php/store/';
			}
			elseif ($friendlyurl == 'rewrite') {
				$urlpath = '/';
				$urlpathstore = 'store/';
			}
			elseif ($friendlyurl == 'basic') {
				$urlpath = 'index.php?rp=/';
				$urlpathstore = 'index.php?rp=/store/';
			}
				
			$marketconnect = Capsule::table('tblmarketconnect_services')->where('status', '1')->get();
			
			
			$client = Menu::context('client');
								
				// Navbar Items for Clients
				
				
				if (!is_null($primaryNavbar->removeChild('Affiliates'))) {}
				if (!is_null($primaryNavbar->removeChild('Open Ticket'))) {}
				if (!is_null($primaryNavbar->removeChild('Store'))) {}
				if (!is_null($primaryNavbar->removeChild('Website Security'))) {}

				
				// Moved custom pages in services child menu 
				if (!is_null($primaryNavbar->getChild('Services'))) {
					
					$primaryNavbar->getChild('Services')
						->removeChild('Order New Services');

						
					if (count($marketconnect)) {
						foreach ($marketconnect as $service) {
							if ($service->name == 'symantec') {
								
								$primaryNavbar->getChild('Services')
									->addChild('Manage SSL Certificates', array(
									'label' => Lang::trans('navManageSsl'),
									'uri' => $urlpathstore.'ssl-certificates/manage',
									'order' => '20',
								));
							}
						}
					}

							
					$primaryNavbar->getChild('Services')
						->addChild('Shared Hosting', array(
						'uri' => 'web_hosting.php',
						'order' => '60',
					));
					
					$primaryNavbar->getChild('Services')
						->addChild('Reseller Hosting', array(
						'uri' => 'reseller_hosting.php',
						'order' => '70',
					));
					
					$primaryNavbar->getChild('Services')
						->addChild('VPS Hosting', array(
						'uri' => 'vps_hosting.php',
						'order' => '80',
					));
					
					$primaryNavbar->getChild('Services')
						->addChild('Dedicated Servers', array(
						'uri' => 'dedicated_servers.php',
						'order' => '90',
					));
					
					if (count($marketconnect)) {
						foreach ($marketconnect as $service) {
							if ($service->name == 'symantec') {
								
								$primaryNavbar->getChild('Services')
									->addChild('SSL Certificates', array(
									'label' => Lang::trans('navMarketConnectService.symantec'),
									'uri' => $urlpathstore.'ssl-certificates',
									'order' => '100',
								));
								
							} if ($service->name == 'weebly') {
						
								$primaryNavbar->getChild('Services')
									->addChild('Website Builder', array(
									'label' => Lang::trans('navMarketConnectService.weebly'),
									'uri' => $urlpathstore.'website-builder',
									'order' => '110',
								));
								
							} if ($service->name == 'spamexperts') {

								$primaryNavbar->getChild('Services')
									->addChild('E-mail Services', array(
									'label' => Lang::trans('navMarketConnectService.spamexperts'),
									'uri' => $urlpathstore.'email-services',
									'order' => '120',
								));
							
							} if ($service->name == 'sitelock') {

								$primaryNavbar->getChild('Services')
									->addChild('Website Security', array(
									'label' => Lang::trans('navMarketConnectService.sitelock'),
									'uri' => $urlpathstore.'sitelock',
									'order' => '130',
								));
								
							} if ($service->name == 'codeguard') {

								$primaryNavbar->getChild('Services')
									->addChild('Website Backup', array(
									'label' => Lang::trans('navMarketConnectService.codeguard'),
									'uri' => $urlpathstore.'codeguard',
									'order' => '140',
								));
							
							} if ($service->name == 'sitelockvpn') {

								$primaryNavbar->getChild('Services')
									->addChild('VPN', array(
									'label' => Lang::trans('navMarketConnectService.sitelockvpn'),
									'uri' => $urlpathstore.'vpn',
									'order' => '150',
								));
							} if ($service->name == 'marketgoo') {

								$primaryNavbar->getChild('Services')
									->addChild('Seo Tools', array(
									'label' => Lang::trans('navMarketConnectService.marketgoo'),
									'uri' => $urlpathstore.'marketgoo',
									'order' => '160',
								));
							} if ($service->name == 'ox') {

								$primaryNavbar->getChild('Services')
									->addChild('Professional Email', array(
									'label' => Lang::trans('navMarketConnectService.ox'),
									'uri' => $urlpathstore.'professional-email',
									'order' => '170',
								));
							}
					
					
						}
					}
					
					
				}
				//Moved Affiliate links to under Billing child menu 
				if (!is_null($primaryNavbar->getChild('Billing'))) {
					
					$primaryNavbar->getChild('Billing')
						->addChild('Affiliates', array(
						'label' => Lang::trans('affiliatestitle'),
						'uri' => 'affiliates.php',
						'order' => '70',
					));
				}
				
				//Moved Open Ticket links to under Support child menu 
				if (!is_null($primaryNavbar->getChild('Support'))) {
					
					$primaryNavbar->getChild('Support')
						->addChild('Open Ticket', array(
						'label' => Lang::trans('navopenticket'),
						'uri' => 'submitticket.php',
						'order' => '10',
					));				
					
					$primaryNavbar->getChild('Support')
						->addChild('Contact Us', array(
						'label' => Lang::trans('contactus'),
						'uri' => 'contact.php',
						'order' => '70',
					));
					
				}
					
				// Custom About Us menu rearrange order for clients
				if (!is_null($primaryNavbar->addChild('About Us'))) {
					$navItem = $primaryNavbar->getChild('About Us');
					if (is_null($navItem)) {
						return;
					} 
					
					$navItem->setOrder(40);
					$navItem->setUri('about_us.php');
				}
			
				
				
			if (is_null($client)) {
				
				
				// Navbar Items for visitors
				
				
				if (!is_null($primaryNavbar->removeChild('Announcements'))) {}
				if (!is_null($primaryNavbar->removeChild('Network Status'))) {}
				if (!is_null($primaryNavbar->removeChild('Knowledgebase'))) {}
				
				
					
				// Custom Servers menu for logout clients				
				if (!is_null($primaryNavbar->addChild('Services'))) {
					$navItem = $primaryNavbar->getChild('Services');
					if (is_null($navItem)) {
						return;
					} 	$navItem->setOrder(20);
						$navItem->setLabel(Lang::trans('navservices'));
				
					$primaryNavbar->getChild('Services')
						->addChild('Shared Hosting', array(
						'uri' => 'web_hosting.php',
						'order' => '10',
					));
					
					$primaryNavbar->getChild('Services')
						->addChild('Reseller Hosting', array(
						'uri' => 'reseller_hosting.php',
						'order' => '20',
					));
					
					$primaryNavbar->getChild('Services')
						->addChild('VPS Hosting', array(
						'uri' => 'vps_hosting.php',
						'order' => '30',
					));
					
					$primaryNavbar->getChild('Services')
						->addChild('Dedicated Servers', array(
						'uri' => 'dedicated_servers.php',
						'order' => '40',
					));
					
					if (count($marketconnect)) {
						foreach ($marketconnect as $service) {
							if ($service->name == 'symantec') {
								
								$primaryNavbar->getChild('Services')
									->addChild('SSL Certificates', array(
									'label' => Lang::trans('navMarketConnectService.symantec'),
									'uri' => $urlpathstore.'ssl-certificates',
									'order' => '50',
								));
								
							} if ($service->name == 'weebly') {
						
								$primaryNavbar->getChild('Services')
									->addChild('Website Builder', array(
									'label' => Lang::trans('navMarketConnectService.weebly'),
									'uri' => $urlpathstore.'website-builder',
									'order' => '60',
								));
								
							} if ($service->name == 'spamexperts') {

								$primaryNavbar->getChild('Services')
									->addChild('E-mail Services', array(
									'label' => Lang::trans('navMarketConnectService.spamexperts'),
									'uri' => $urlpathstore.'email-services',
									'order' => '70',
								));
								
							} if ($service->name == 'sitelock') {

								$primaryNavbar->getChild('Services')
									->addChild('Website Security', array(
									'label' => Lang::trans('navMarketConnectService.sitelock'),
									'uri' => $urlpathstore.'sitelock',
									'order' => '80',
								));
								
							} if ($service->name == 'codeguard') {

								$primaryNavbar->getChild('Services')
									->addChild('Website Backup', array(
									'label' => Lang::trans('navMarketConnectService.codeguard'),
									'uri' => $urlpathstore.'codeguard',
									'order' => '90',
								));
							
							} if ($service->name == 'sitelockvpn') {

								$primaryNavbar->getChild('Services')
									->addChild('VPN', array(
									'label' => Lang::trans('navMarketConnectService.sitelockvpn'),
									'uri' => $urlpathstore.'vpn',
									'order' => '100',
								));
							} if ($service->name == 'marketgoo') {

								$primaryNavbar->getChild('Services')
									->addChild('SEO Tools', array(
									'label' => Lang::trans('navMarketConnectService.marketgoo'),
									'uri' => $urlpathstore.'marketgoo',
									'order' => '110',
								));
							} if ($service->name == 'ox') {

								$primaryNavbar->getChild('Services')
									->addChild('Professional Email', array(
									'label' => Lang::trans('navMarketConnectService.ox'),
									'uri' => $urlpathstore.'professional-email',
									'order' => '120',
								));
							}
					
					
						}
					}
				}
				
				
				//Custom support menu
				if (!is_null($primaryNavbar->addChild('Support'))) {
					$navItem = $primaryNavbar->getChild('Support');
					if (is_null($navItem)) {
					return;
					} 	
					
					$navItem->setOrder(20);
					$navItem->setLabel(Lang::trans('navsupport'));

					$primaryNavbar->getChild('Support')
						->addChild('Tickets', array(
						'label' => Lang::trans('navtickets'),
						'uri' => 'supporttickets.php',
						'order' => '10',
					));

					$primaryNavbar->getChild('Support')
						->addChild('Knowledgebase', array(
						'label' => Lang::trans('knowledgebasetitle'),
						'uri' => $urlpath.'knowledgebase',
						'order' => '20',
					));

					$primaryNavbar->getChild('Support')
						->addChild('Announcements', array(
						'label' => Lang::trans('announcementstitle'),
						'uri' => $urlpath.'announcements',
						'order' => '30',
					));
					
					$primaryNavbar->getChild('Support')
						->addChild('Network Status', array(
						'label' => Lang::trans('networkstatustitle'),
						'uri' => 'serverstatus.php',
						'order' => '40',
					));
					

					
				}
				
				// Custom About Us menu rearrange order for visitors		
				$navItem = $primaryNavbar->getChild('About Us');
					if (is_null($navItem)) {
						return;
					}
				$navItem->setOrder(30);
				
			}

				
	});
?>