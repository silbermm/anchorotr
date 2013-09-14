define(["knockout"], function(ko){
	var Catagory = function(c){
		var self = this;
		self.name=ko.observable(c.name);
	}
	return Catagory;
});
