define(["knockout", 'jquery', 'async!https://maps.googleapis.com/maps/api/js?key=AIzaSyCn6M_PmJLrNR8-BkJL0aEvcpBRG69sdPc&sensor=false!callback'], function(ko, $) {
    var locationViewModel = function() {
        var self = this;
        self.active = ko.observable(false);

        var latLng = new google.maps.LatLng(39.110495,-84.517172);
        var mapOptions = {
            center: latLng,
            zoom: 18,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("map-canvas"),
                mapOptions);

        var marker = new google.maps.Marker({
            position: latLng,
            map: map,
            title: 'The Anchor-OTR'
        });

    };

    return locationViewModel;
});
