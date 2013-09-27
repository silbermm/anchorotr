define(["knockout", "jquery", "jquery.bootstrap", "jquery.bootstrapDate"], function(ko, $) {
	var reserveViewModel = function() {
		var self = this;                                        
                $("#startDate").datepicker();
	};
	return reserveViewModel;
});
