define(["knockout", "jquery"], function(ko, $) {
	var homeViewModel = function() {
		var self = this;	
		self.active = ko.observable(false);

	};

	return homeViewModel;
});
