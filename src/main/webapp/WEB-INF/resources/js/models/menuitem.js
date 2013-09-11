define(["knockout"], function(ko){
	var MenuItem = function(menuitem ){
		var self = this;
		self.id = ko.observable(menuitem.id);
		self.itemname = ko.observable(menuitem.itemName);
		self.itemdesc = ko.observable(menuitem.itemDesc);
		self.catagory = ko.observable(menuitem.catagory);
		self.price = ko.observable(menuitem.price);
		self.menuid	= ko.observable(menuitem.menuid);
	}
	return MenuItem;
});
