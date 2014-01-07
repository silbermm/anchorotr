angular.module('templates-main', ['about/about.tpl.html', 'home/home.tpl.html', 'location/location.tpl.html', 'menus/menus.tpl.html', 'reservation/reservation.tpl.html']);

angular.module("about/about.tpl.html", []).run(["$templateCache", function($templateCache) {
  $templateCache.put("about/about.tpl.html",
    "<div class=\"row-fluid ui-view-row\" id=about-page><div class=container><div class=about-photos><ul class=\"inline text-center\"><li><a class=thumbnail><img src=/resources/img/about1.jpg></a></li><li><a class=thumbnail><img src=/resources/img/about2.jpg></a></li><li><a class=thumbnail><img src=/resources/img/about3.jpg></a></li></ul><br><p class=callout>The Anchor-otr brings a classic seafood experience to land locked Cincinnatians. From Maine sea scallops to grilled whole fish to fresh oysters flown in from the west and east coast, chef/owner Derek dos Anjos's team serves high quality and sustainable seafood from the countries best suppliers. Beach food classics such as hush puppies and lobster rolls will transport you to your favorite spot along the coast. With a wine list chosen to compliment seafood, craft cocktails and a warm sense of hospitality, The Anchor-otr brings laid back extravagance to Washington Park in Over the Rhine. The dining rooms custom charred wood walls, communal table seating and nautical lighting encourage a playful experience.</p><br><div class=food-menu-container><div class=food-menu-title>THE TEAM</div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody><tr><td class=team-name>Derek dos Anjos</td><td class=team-name>Jocelyn dos Anjos</td><td class=team-name>Steven Campbell</td><td class=team-name>Aaron Drahmann</td></tr><tr><td class=team-title>Chef/ Owner</td><td class=team-title>Owner/ Operations</td><td class=team-title>General Manager</td><td class=team-title>Sous Chef</td></tr></tbody></table></div></div></div></div>");
}]);

angular.module("home/home.tpl.html", []).run(["$templateCache", function($templateCache) {
  $templateCache.put("home/home.tpl.html",
    "<div preserve-order=\"\" masonry=\"\" class=\"ui-view-row container\" ng-if=imagesLoaded id=landing-imgs masonry-options=\"{ columnWidth: container.querySelector('.grid-sizer'), transitionDuration: '0'}\"><div class=grid-sizer></div><div masonry-brick=\"\" class=\"masonry-brick {{img.className}}\" ng-repeat=\"img in images\"><img ng-src={{img.url}}></div></div>");
}]);

angular.module("location/location.tpl.html", []).run(["$templateCache", function($templateCache) {
  $templateCache.put("location/location.tpl.html",
    "<div class=\"row-fluid ui-view-row\" id=location-page><div class=container><ul class=\"inline text-center\"><li><a class=thumbnail><img src=/resources/img/location1.jpg></a></li><li><a class=thumbnail><img src=/resources/img/location2.jpg></a></li></ul></div></div><p class=\"text-center parking\">Looking for parking? <a href=http://washingtonpark.org/parking/ target=_blank style=\"text-transform: lowercase;color: #0088cc\">http://washingtonpark.org/parking/</a></p><div style=\"width:425px;margin:0 auto\" class=\"visible-phone visible-tablet hidden-desktop\"><iframe width=425 height=350 frameborder=0 scrolling=no marginheight=0 marginwidth=0 src=\"https://www.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Anchor+OTR,+1401+Race+Street,+Cincinnati,+OH+45202,+USA&amp;aq=0&amp;oq=Anchor+o&amp;sll=39.13634,-84.540401&amp;sspn=0.36802,0.724411&amp;ie=UTF8&amp;hq=Anchor&amp;hnear=1401+Race+St,+Cincinnati,+Hamilton,+Ohio+45202&amp;t=m&amp;fll=39.110566,-84.517211&amp;fspn=0.001438,0.00283&amp;st=110616160731137639226&amp;rq=1&amp;ev=zi&amp;split=1&amp;ll=39.110358,-84.51705&amp;spn=0.002914,0.00456&amp;z=17&amp;iwloc=A&amp;output=embed\"></iframe><br><small><a href=\"https://www.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Anchor+OTR,+1401+Race+Street,+Cincinnati,+OH+45202,+USA&amp;aq=0&amp;oq=Anchor+o&amp;sll=39.13634,-84.540401&amp;sspn=0.36802,0.724411&amp;ie=UTF8&amp;hq=Anchor&amp;hnear=1401+Race+St,+Cincinnati,+Hamilton,+Ohio+45202&amp;t=m&amp;fll=39.110566,-84.517211&amp;fspn=0.001438,0.00283&amp;st=110616160731137639226&amp;rq=1&amp;ev=zi&amp;split=1&amp;ll=39.110358,-84.51705&amp;spn=0.002914,0.00456&amp;z=17&amp;iwloc=A\" style=color:#0000FF;text-align:left>View Larger Map</a></small></div><div style=\"width:640px;margin:0 auto\" class=\"hidden-phone hidden-tablet visible-desktop\"><iframe width=640 height=480 frameborder=0 scrolling=no marginheight=0 marginwidth=0 src=\"https://www.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Anchor+OTR,+1401+Race+Street,+Cincinnati,+OH+45202,+USA&amp;aq=0&amp;oq=Anchor+o&amp;sll=39.13634,-84.540401&amp;sspn=0.36802,0.724411&amp;ie=UTF8&amp;hq=Anchor&amp;hnear=1401+Race+St,+Cincinnati,+Hamilton,+Ohio+45202&amp;t=m&amp;fll=39.110566,-84.517211&amp;fspn=0.001438,0.00283&amp;st=110616160731137639226&amp;rq=1&amp;ev=zi&amp;split=1&amp;ll=39.111282,-84.517232&amp;spn=0.003996,0.006866&amp;z=17&amp;iwloc=A&amp;output=embed\"></iframe><br><small><a href=\"https://www.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Anchor+OTR,+1401+Race+Street,+Cincinnati,+OH+45202,+USA&amp;aq=0&amp;oq=Anchor+o&amp;sll=39.13634,-84.540401&amp;sspn=0.36802,0.724411&amp;ie=UTF8&amp;hq=Anchor&amp;hnear=1401+Race+St,+Cincinnati,+Hamilton,+Ohio+45202&amp;t=m&amp;fll=39.110566,-84.517211&amp;fspn=0.001438,0.00283&amp;st=110616160731137639226&amp;rq=1&amp;ev=zi&amp;split=1&amp;ll=39.111282,-84.517232&amp;spn=0.003996,0.006866&amp;z=17&amp;iwloc=A\" style=color:#0000FF;text-align:left>View Larger Map</a></small></div>");
}]);

angular.module("menus/menus.tpl.html", []).run(["$templateCache", function($templateCache) {
  $templateCache.put("menus/menus.tpl.html",
    "<div class=\"row-fluid ui-view-row\" id=lunch-page><div class=container><div class=row-fluid ng-if=happyHour><div class=container><div class=about-photos><h2 class=text-center>Join us for Happy Hour weeknights from 5 - 7 pm.</h2><ul class=\"inline text-center\"><li>$1.50 oysters - shucker's choice</li><li>$1 off all beer and select glasses of wine</li></ul><ul class=\"inline text-center\"><li><a class=thumbnail><img src=/resources/img/happy1.jpg></a></li><li><a class=thumbnail><img src=/resources/img/happy2.jpg></a></li><li><a class=thumbnail><img src=/resources/img/happy3.jpg></a></li></ul><br></div></div></div><div class=row-fluid ng-if=sparklingWine><div class=\"span6 food-menu-container\"><div class=food-menu-title>Champagne <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('SPARKLING AND CHAMPAGNE')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody class=food-item-tbl><tr ng-repeat=\"item in sparklingWine | orderBy :['weight','itemName']\"><td>{{item.itemDesc}}</td><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=3 style=border-top:none></td></tr></tbody></table></div><div class=span6 ng-if=roseWine><div class=food-menu-title>ROSÉ <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('ROSE')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody class=food-item-tbl><tr ng-repeat=\"item in roseWine | orderBy :['weight','itemName']\"><td>{{item.itemDesc}}</td><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=3 style=border-top:none></td></tr></tbody></table></div></div><div class=row-fluid ng-if=redWine><div class=\"span6 food-menu-container\" ng-if=redWine><div class=food-menu-title>RED <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('RED')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody class=food-item-tbl><tr ng-repeat=\"item in redWine | orderBy :['weight','itemName']\"><td>{{item.itemDesc}}</td><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=3 style=border-top:none></td></tr></tbody></table></div><div class=span6 ng-if=whiteWine><div class=food-menu-title>WHITE <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('WHITE')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody class=food-item-tbl><tr ng-repeat=\"item in whiteWine | orderBy :['weight','itemName']\"><td>{{item.itemDesc}}</td><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=3 style=border-top:none></td></tr></tbody></table></div></div><div class=row-fluid ng-if=lunchSpecial><div class=span12><div class=\"food-menu-container food-menu-container-border middle-callout\"><div class=food-menu-title>LUNCH SPECIAL <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('LUNCH SPECIAL')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><ul class=food-menu-list><li ng-repeat=\"item in lunchSpecial | orderBy :['weight','itemName']\"><div class=food-item-first-line><div class=food-item-title>{{item.itemName}}</div></div><div class=food-item-second-line>{{item.itemDesc}}</div><div class=food-item-price>{{item.price}} <span ng-if=isAdmin><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></div></li></ul></div></div></div><div class=row-fluid ng-if=rawBar><div class=\"span6 food-menu-container\" ng-if=rawBar><div class=food-menu-title>RAW BAR <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('RAW BAR')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody class=food-item-tbl ng-repeat=\"item in rawBar | orderBy :['weight','itemName']\"><tr><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=2 style=border-top:none><span class=food-item-tbl-desc>{{item.itemDesc}}</span></td></tr></tbody></table></div><div class=\"span6 food-menu-container\" ng-if=platters><div class=food-menu-title>PLATTERS <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('PLATTERS')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody class=food-item-tbl ng-repeat=\"item in platters | orderBy :['weight','itemName']\"><tr><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=2 style=border-top:none><span class=food-item-tbl-desc>{{item.itemDesc}}</span></td></tr></tbody></table></div></div><div class=row-fluid ng-if=starters><div class=\"span6 food-container\" ng-if=starters><div class=food-menu-title>STARTERS <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('STARTERS')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody class=food-item-tbl ng-repeat=\"item in starters | orderBy :['weight','itemName']\"><tr><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=2 style=border-top:none><span class=food-item-tbl-desc>{{item.itemDesc}}</span></td></tr></tbody></table></div><div class=\"span6 food-container\" ng-if=salads><div class=food-menu-title>SALADS <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('SALADS')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody class=food-item-tbl ng-repeat=\"item in salads | orderBy :['weight','itemName']\"><tr><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=2 style=border-top:none><span class=food-item-tbl-desc>{{item.itemDesc}}</span></td></tr></tbody></table></div></div><div class=row-fluid ng-if=cocktailsCol1><div class=\"span12 food-container\"><div class=food-menu-title>House Cocktails <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('COCKTAILS')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><div class=fmc-double-column><table class=\"table table-condensed\"><tbody class=food-item-tbl ng-repeat=\"item in cocktailsCol1\"><tr><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=2 style=border-top:none><span class=food-item-tbl-desc>{{item.itemDesc}}</span></td></tr></tbody></table></div><div class=\"fmc-double-column fmcdc-last\"><table class=\"table table-condensed\"><tbody class=food-item-tbl ng-repeat=\"item in cocktailsCol2\"><tr><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=2 style=border-top:none><span class=food-item-tbl-desc>{{item.itemDesc}}</span></td></tr></tbody></table></div></div><div class=\"text-center span12 cocktailsPhotos visible-desktop hidden-phone hidden-tablet\"><ul class=inline><li><a class=thumbnail><img src=/resources/img/cocktails1.jpg></a></li><li style=position:relative;top:68px><a class=thumbnail><img src=/resources/img/cocktails3.jpg></a> <a class=thumbnail><img src=/resources/img/cocktails4.jpg></a></li><li><a class=thumbnail><img src=/resources/img/cocktails2.jpg></a></li></ul></div><br></div><div class=row-fluid ng-if=mainsCol1><div class=\"span12 food-container\"><div class=food-menu-title>MAINS <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('MAINS')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><div class=fmc-double-column><table class=\"table table-condensed\"><tbody ng-repeat=\"item in mainsCol1 | orderBy :['weight','itemName']\" class=food-item-tbl><tr><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=2 style=border-top:none><span class=food-item-tbl-desc>{{item.itemDesc}}</span></td></tr></tbody></table></div><div class=\"fmc-double-column fmcdc-last\"><table class=\"table table-condensed\"><tbody ng-repeat=\"item in mainsCol2 | orderBy :['weight','itemName']\" class=food-item-tbl><tr><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=2 style=border-top:none><span class=food-item-tbl-desc>{{item.itemDesc}}</span></td></tr></tbody></table></div></div></div><div class=row-fluid ng-if=sides><div class=\"span6 food-container\" ng-if=sides><div class=food-menu-title>SIDES <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('SIDES')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody class=food-item-tbl ng-repeat=\"item in sides | orderBy :['weight','itemName']\"><tr><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=2 style=border-top:none><span class=food-item-tbl-desc>{{item.itemDesc}}</span></td></tr></tbody></table></div><div class=\"span6 food-container\" ng-if=deserts><div class=food-menu-title>DESERTS <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('DESERTS')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody ng-repeat=\"item in deserts | orderBy :['weight','itemName']\" class=food-item-tbl><tr><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=2 style=border-top:none><span class=food-item-tbl-desc>{{item.itemDesc}}</span></td></tr></tbody></table></div></div><div class=row-fluid><div class=\"span6 food-container\" ng-if=beverages><div class=food-menu-title>BEVERAGES <a class=pointer ng-if=isAdmin ng-click=\"openAddModal('BEVERAGES')\"><i class=icon-plus-sign></i></a></div><div class=food-menu-title-ornament-container><div class=food-menu-title-ornament></div></div><table class=\"table table-condensed\"><tbody class=food-item-tbl ng-repeat=\"item in beverages | orderBy :['weight','itemName']\"><tr><td>{{item.itemName}}</td><td class=pull-right>{{item.price}}</td><td ng-if=isAdmin><span><a class=pointer ng-click=openEditModal(item,$index)><i class=icon-edit-sign></i></a> <a class=pointer ng-click=openDeleteModal(item,$index)><i class=\"icon-remove-sign red\"></i></a></span></td><td class=item-weight ng-if=isAdmin>{{item.weight}}</td></tr><tr><td colspan=2 style=border-top:none><span class=food-item-tbl-desc>{{item.itemDesc}}</span></td></tr></tbody></table></div></div></div><div class=row-fluid ng-if=showWarning><div class=aside-container><div class=\"food-menu-container food-menu-container-border aside\" style=opacity:1><img class=food-menu-container-image src=/resources/img/shark-small.gif style=\"opacity: 1\"><div class=aside-text>There is a risk associated with consumption of raw oysters or any raw protein</div></div></div></div><script type=text/ng-template id=addModal.html><div class=\"modal-header\">\n" +
    "        <h3>Add a Menu Item</h3>\n" +
    "        </div>\n" +
    "        <div class=\"modal-body\">\n" +
    "        <form name=\"form\" class=\"form-horizontal css-form\"> \n" +
    "        <div class=\"control-group\">\n" +
    "        <label class=\"control-label\" for=\"itemName\">Name</label>\n" +
    "        <div class=\"controls\">\n" +
    "        <input type=\"text\" id=\"itemName\" placeholder=\"Name\" ng-model=\"menuItem.itemName\" required>\n" +
    "        </div>\n" +
    "        </div>\n" +
    "        <div class=\"control-group\">\n" +
    "        <label class=\"control-label\" for=\"itemDesc\">Description (Optional)</label>\n" +
    "        <div class=\"controls\">\n" +
    "        <input type=\"text\" id=\"itemDesc\" placeholder=\"Description...\" ng-model=\"menuItem.itemDesc\" >\n" +
    "        </div>\n" +
    "        </div>\n" +
    "        <div class=\"control-group\">\n" +
    "        <label class=\"control-label\" for=\"itemCatagory\">Catagory</label>\n" +
    "        <div class=\"controls\">\n" +
    "        <input type=\"text\" id=\"itemCatagory\" ng-model=\"menuItem.catagory\" disabled >\n" +
    "        </div>\n" +
    "        </div>\n" +
    "        <div class=\"control-group\">\n" +
    "        <label class=\"control-label\" for=\"itemPrice\">Price</label>\n" +
    "        <div class=\"controls\">\n" +
    "        <input type=\"text\" id=\"itemPrice\" ng-model=\"menuItem.price\" required >\n" +
    "        </div>\n" +
    "        </div>\n" +
    "        <div class=\"control-group\">\n" +
    "        <label class=\"control-label\" for=\"itemWeight\">Weight</label>\n" +
    "        <div class=\"controls\">\n" +
    "        <input type=\"text\" id=\"itemWeight\" ng-model=\"menuItem.weight\" required >\n" +
    "        </div>\n" +
    "        </div>\n" +
    "        </form>                       \n" +
    "        </div>\n" +
    "        <div class=\"modal-footer\">\n" +
    "        <button class=\"btn btn-primary\" ng-disabled=\"form.$invalid\" ng-click=\"ok()\">OK</button>\n" +
    "        <button class=\"btn btn-warning\" ng-click=\"cancel()\">Cancel</button>\n" +
    "        </div></script><script type=text/ng-template id=deleteModal.html><div class=\"modal-header\">\n" +
    "        <h3>Delete {{menuItem.itemName}}?</h3>\n" +
    "        </div>\n" +
    "        <div class=\"modal-body\">\n" +
    "        <p class=\"warning\">\n" +
    "        Are you sure you want to delete {{ menuItem.itemName }} (this can not be un-done)?\n" +
    "        </p>\n" +
    "        </div>\n" +
    "        <div class=\"modal-footer\">\n" +
    "        <button class=\"btn btn-primary\" ng-click=\"ok()\">OK</button>\n" +
    "        <button class=\"btn btn-warning\" ng-click=\"cancel()\">Cancel</button>\n" +
    "        </div></script><script type=text/ng-template id=editModal.html><div class=\"modal-header\">\n" +
    "        <h3>Edit {{menuItem.itemName}} </h3>\n" +
    "        </div>\n" +
    "        <div class=\"modal-body\">\n" +
    "        <form name=\"form\" class=\"form-horizontal css-form\"> \n" +
    "        <div class=\"control-group\">\n" +
    "        <label class=\"control-label\" for=\"itemName\">Name</label>\n" +
    "        <div class=\"controls\">\n" +
    "        <input type=\"text\" id=\"itemName\" placeholder=\"Name\" ng-model=\"menuItem.itemName\" required>\n" +
    "        </div>\n" +
    "        </div>\n" +
    "        <div class=\"control-group\">\n" +
    "        <label class=\"control-label\" for=\"itemDesc\">Description (Optional)</label>\n" +
    "        <div class=\"controls\">\n" +
    "        <input type=\"text\" id=\"itemDesc\" placeholder=\"Description...\" ng-model=\"menuItem.itemDesc\" >\n" +
    "        </div>\n" +
    "        </div>\n" +
    "        <div class=\"control-group\">\n" +
    "        <label class=\"control-label\" for=\"itemCatagory\">Catagory</label>\n" +
    "        <div class=\"controls\">\n" +
    "        <input type=\"text\" id=\"itemCatagory\" ng-model=\"menuItem.catagory\" disabled >\n" +
    "        </div>\n" +
    "        </div>\n" +
    "        <div class=\"control-group\">\n" +
    "        <label class=\"control-label\" for=\"itemPrice\">Price</label>\n" +
    "        <div class=\"controls\">\n" +
    "        <input type=\"text\" id=\"itemPrice\" ng-model=\"menuItem.price\" required >\n" +
    "        </div>\n" +
    "        </div>\n" +
    "        <div class=\"control-group\">\n" +
    "        <label class=\"control-label\" for=\"itemWeight\">Weight</label>\n" +
    "        <div class=\"controls\">\n" +
    "        <input type=\"text\" id=\"itemWeight\" ng-model=\"menuItem.weight\" required >\n" +
    "        </div>\n" +
    "        </div>\n" +
    "        </form>                       \n" +
    "        </div>\n" +
    "        <div class=\"modal-footer\">\n" +
    "        <button class=\"btn btn-primary\" ng-disabled=\"form.$invalid\" ng-click=\"ok()\">Save</button>\n" +
    "        <button class=\"btn btn-warning\" ng-click=\"cancel()\">Cancel</button>\n" +
    "        </div></script></div>");
}]);

angular.module("reservation/reservation.tpl.html", []).run(["$templateCache", function($templateCache) {
  $templateCache.put("reservation/reservation.tpl.html",
    "<div class=ui-view-row id=reservation-page><div class=container><div class=row><div class=\"span3 visible-desktop hidden-phone hidden-tablet\"><ul class=\"thumbnails text-center\"><li><a class=thumbnail><img src=/resources/img/reserve1.jpg></a></li></ul></div><div class=span6><div class=span12><p class=callout>Reservations are recommended, but certainly not required. Walkins are always welcome. Reservations can be made by calling (513) 421-8111 or via the internet. Use the form below to make reservations online. To book a private event, please call the restaurant (513) 421-8111</p></div><div class=span12></div><div class=span12><form name=ism id=ism class=form-horizontal method=POST target=_blank action=http://www.opentable.com/restaurant-search.aspx><div class=control-group><label class=control-label for=PartySizeInput>Party Size:</label><div class=controls><select name=PartySize id=PartySizeInput><option value=1>1</option><option value=2 selected>2</option><option value=3>3</option><option value=4>4</option><option value=5>5</option><option value=6>6</option><option value=7>7</option><option value=8>8</option><option value=9>9</option><option value=10>10</option><option value=11>11</option><option value=12>12</option><option value=13>13</option><option value=14>14</option><option value=15>15</option><option value=16>16</option><option value=17>17</option><option value=18>18</option><option value=19>19</option><option value=20>20</option></select></div></div><div class=control-group><label class=control-label for=startDate>Date:</label><div class=controls><div class=input-append><input id=startDate name=startDate datepicker-popup=MM/dd/yyyy ng-model=dt is-open=opened min=minDate max=\"'2015-06-22'\" datepicker-options=dateOptions date-disabled=\"disabled(date, mode)\" ng-required=true class=span10><button class=btn type=button ng-click=open()><i class=\"fa fa-calendar\"></i></button></div></div></div><div class=control-group><label class=control-label for=ResTimeSelect>Time:</label><div class=controls><select id=ResTimeSelect name=ResTime><option value=\"10:00 AM\">10:00 AM</option><option value=\"10:30 AM\">10:30 AM</option><option value=\"11:00 AM\">11:00 AM</option><option value=\"11:30 AM\">11:30 AM</option><option value=\"12:00 PM\">12:00 PM</option><option value=\"12:30 PM\">12:30 PM</option><option value=\"1:00 PM\">1:00 PM</option><option value=\"1:30 PM\">1:30 PM</option><option value=\"2:00 PM\">2:00 PM</option><option value=\"2:30 PM\">2:30 PM</option><option value=\"3:00 PM\">3:00 PM</option><option value=\"3:30 PM\">3:30 PM</option><option value=\"5:00 PM\">5:00 PM</option><option value=\"5:30 PM\">5:30 PM</option><option value=\"6:00 PM\">6:00 PM</option><option value=\"6:30 PM\">6:30 PM</option><option value=\"7:00 PM\" selected>7:00 PM</option><option value=\"7:30 PM\">7:30 PM</option><option value=\"8:00 PM\">8:00 PM</option><option value=\"8:30 PM\">8:30 PM</option><option value=\"9:00 PM\">9:00 PM</option><option value=\"9:30 PM\">9:30 PM</option><option value=\"10:00 PM\">10:00 PM</option><option value=\"10:30 PM\">10:30 PM</option><option value=\"11:00 PM\">11:00 PM</option><option value=\"11:30 PM\">11:30 PM</option></select></div></div><div class=control-group><div class=controls><button type=submit class=btn name=submit>Search</button></div><input type=hidden id=RestaurantReferralID name=RestaurantReferralID value=100687><input type=hidden id=RestaurantID name=RestaurantID value=100687><input type=hidden name=txtDateFormat value=MM/dd/yyyy></div><div class=control-group><div class=controls><div id=OT_logo><a href=http://www.opentable.com/home.aspx title=\"Powered By OpenTable\"><img src=http://www.opentable.com/img/buttons/Otlogo.gif id=OT_imglogo alt=\"Restaurant Management Software\" border=0></a></div></div></div></form></div></div><div class=\"span3 visible-desktop hidden-phone hidden-tablet\"><ul class=\"thumbnails text-center\"><li><a class=thumbnail><img src=/resources/img/reserve2.jpg></a></li></ul></div></div></div></div>");
}]);
