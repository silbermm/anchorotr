define(["knockout"], function(ko) {
	var locationViewModel = function() {
		var self = this;	
		self.active = ko.observable(false);
		
	};

	return locationViewModel;
});
