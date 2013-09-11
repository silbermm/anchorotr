define(["knockout"], function(ko){
	var Task = function(id, label){
		var self = this;
		self.id = ko.observable(id);
		self.label = ko.observable(label);
	}
	return Task;
});
