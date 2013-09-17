define(["knockout"], function(ko){
	var MenuItem = function(menuitem ){
		var self = this;
                if(menuitem){
                    self.id = ko.observable(menuitem.id);
                    self.itemname = ko.observable(menuitem.itemName);
                    self.itemdesc = ko.observable(menuitem.itemDesc);
                    self.catagory = ko.observable(menuitem.catagory);
                    self.price = ko.observable(menuitem.price);
                    self.menuid = ko.observable(menuitem.menuid);
                }else{
                    self.id = ko.observable();
                    self.itemname = ko.observable();
                    self.itemdesc = ko.observable();
                    self.catagory = ko.observable();
                    self.price = ko.observable();
                    self.menuid = ko.observable();
                }
		
	}
	return MenuItem;
});
