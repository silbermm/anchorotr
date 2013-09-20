define(["knockout",
    "jquery",
    "../viewmodels/homeViewModel",
    "../viewmodels/locationViewModel",
    "../viewmodels/aboutViewModel",
    "../viewmodels/menuViewModel",
    "jquery.bootstrap"], function(
        ko,
        $,
        homeViewModel,
        locationViewModel,
        aboutViewModel,
        menuViewModel) {
    var masterViewModel = function() {
        var self = this;
        self.homeViewModel = new homeViewModel();
        self.locationViewModel = new locationViewModel();
        self.aboutViewModel = new aboutViewModel();
        self.menuViewModel = new menuViewModel();
        self.currentView = ko.observable("homeTemplate");
        self.currentMenuLink = ko.observable();
        self.currentModel = ko.observable(self.homeViewModel);
        self.pageTitle = ko.observable("The Anchor-OTR");

        // Main Menu Animations	
        self.toggleSubMenu = function() {
            $('#submenu').collapse('toggle');
        }

        self.hideSubMenu = function() {
            $('#submenu').collapse('hide');
        }

        self.showSubMenu = function() {
            $("#submenu").collapse('show');
        }

        self.isMenuView = ko.computed(function() {
            console.log(self.currentView());
            if (self.currentView() === "foodMenuTemplate" || self.currentView() === "dinnerMenuTemplate" || self.currentView() === "wineListTemplate") {
                return true;
            }
            return false;
        });

        self.showMailModal = function() {
            return true;
        }

        self.gotoLogin = function() {
            window.location($("#baseUrl").val() + "/login?");
        }

        // Animation callbacks for the planets list
        self.showElement = function(elem) {
            if (elem.nodeType === 1)
                $(elem).hide().slideDown()
        }
        self.hideElement = function(elem) {
            if (elem.nodeType === 1)
                $(elem).slideUp(function() {
                    $(elem).remove();
                })
        }

    };
    return masterViewModel;
});
