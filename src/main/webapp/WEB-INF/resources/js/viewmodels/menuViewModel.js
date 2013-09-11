define(["knockout","jquery","../models/menuitem"], function(ko,$,MenuItem) {
	var menuViewModel = function() {
		var self = this;
                self.baseUrl = $("#baseUrl").val();
                
		self.active = ko.observable(false);
		self.rawBar = ko.observableArray();
		self.platters = ko.observableArray();			
		self.starters = ko.observableArray();
		self.salads = ko.observableArray();
		//self.mains = ko.observableArray();
		self.sides = ko.observableArray();
		self.deserts = ko.observableArray();
		self.beverages = ko.observableArray();
		self.lunchSpecial = ko.observableArray();

		self.mainsCol1 = ko.observableArray();
		self.mainsCol2 = ko.observableArray();

		self.getLunchMenu = function(){
			cleanMenus();
			console.log("attempting to get lunch menu...");
			getMenu(1, 'RAW%20BAR', self.rawBar);	
			getMenu(1, 'PLATTERS', self.platters);
			getMenu(1, 'STARTERS', self.starters);
			getMenu(1, 'SALADS', self.salads);
			//getMenu(1, 'MAINS', self.mains);
			getMenu(1, 'SIDES', self.sides);
			getMenu(1, 'DESERTS', self.deserts);	
			getMenu(1, 'BEVERAGES', self.beverages);
			getMenu(1, 'LUNCH%20SPECIAL', self.lunchSpecial);

			$.getJSON(self.baseUrl + '/menus/1/MAINS', function(data) {
				var mappedItems = $.map(data, function(menuitem) {
					return new MenuItem(menuitem);
				});	
				var half = mappedItems.length / 2;
				var leftover = mappedItems.length % 2;
				var firstColumn = half + leftover;

				
				console.log("firstColumn should be " + firstColumn);
				$.each(mappedItems, function(idx, val){
					if(idx + 1 <= firstColumn ){
						self.mainsCol1.push(val);
					}else{
						self.mainsCol2.push(val);
					}
				});
			});
		}

		self.getDinnerMenu = function(){
			cleanMenus();
			console.log("attempting to get dinner menu...");
			getMenu(2, 'RAW%20BAR', self.rawBar);
			getMenu(2, 'PLATTERS', self.platters);
			getMenu(2, 'STARTERS', self.starters);
			getMenu(2, 'SALADS', self.salads);
			//getMenu(2, 'MAINS', self.mains);
			getMenu(2, 'SIDES', self.sides);
			getMenu(2, 'DESERTS', self.deserts);
			$.getJSON(self.baseUrl + '/menus/2/MAINS', function(data) {
				var dinnerMappedItems = $.map(data, function(menuitem) {
					return new MenuItem(menuitem);
				});	
				var half = dinnerMappedItems.length / 2;
				var leftover = dinnerMappedItems.length % 2;
				var firstColumn = half + leftover;

				
				console.log("firstColumn should be " + firstColumn);
				$.each(dinnerMappedItems, function(idx, val){
					if(idx + 1 <= firstColumn ){
						self.mainsCol1.push(val);
					}else{
						self.mainsCol2.push(val);
					}
				});
			});
		}
	
		var getMenu = function(menuId, catagory, observable){
			$.getJSON(self.baseUrl + '/menus/'+ menuId + "/" + catagory, function(data) {
				var mappedItems = $.map(data, function(menuitem) {
					return new MenuItem(menuitem);
				});
				observable(mappedItems);
			});
		}

		var cleanMenus = function(){
			self.rawBar.removeAll();
			self.platters.removeAll();
			self.starters.removeAll();
			self.salads.removeAll();
			self.sides.removeAll();
			self.deserts.removeAll();
			self.beverages.removeAll();
			self.lunchSpecial.removeAll();
			self.mainsCol1.removeAll();
			self.mainsCol2.removeAll();
		}
	};

	return menuViewModel;
});
