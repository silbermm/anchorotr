requirejs.config({
    "baseUrl": "/anchor/resources/js/lib",
    "paths": {
        ko: "knockout",
        jquery: "jquery-1.9.0.min",
        "jquery.bootstrap": "bootstrap",
        sammy: "sammy",
        "app": "../app",
    },
    shim: {
        ko: {exports: "ko"},
        jquery: {exports: 'jQuery'},
        "jquery.bootstrap": {
            deps: ["jquery"]
        },
        sammy: {
            deps: ['jquery']
        },
    }
});
define(["knockout", "sammy", "jquery", "../viewmodels/masterViewModel"], function(ko, Sammy, $, master) {
    var master = new master();

    ko.bindingHandlers.fadeVisible = {
        init: function(element, valueAccessor) {
            // Initially set the element to be instantly visible/hidden depending on the value
            var value = valueAccessor();
            $(element).toggle(ko.utils.unwrapObservable(value)); // Use "unwrapObservable" so we can handle values that may or may not be observable
        },
        update: function(element, valueAccessor) {
            // Whenever the value subsequently changes, slowly fade the element in or out
            var value = valueAccessor();
            ko.utils.unwrapObservable(value) ? $(element).fadeIn() : $(element).fadeOut();
        }
    };

    ko.applyBindings(master, document.getElementById("topHtml"));
    ko.bindingHandlers.stopBinding = {
        init: function() {
            return {controlsDescendantBindings: true};
        }
    };

    // Anything that needs to be done globally...
    master.toggleSubMenu();


    // Client Side Routes
    Sammy(function() {

        this.get("#/location", function() {
            // do some kind of transistion
            master.pageTitle("Location | The Anchor-OTR");
            master.currentView("locationTemplate");
            master.currentModel(master.locationViewModel);
            master.currentMenuLink("location");
            master.hideSubMenu();
        });

        this.get("#/home", function() {
            master.pageTitle("Home");
            master.currentView("homeTemplate");
            master.currentModel(master.homeViewModel);
            master.hideSubMenu();
            master.currentMenuLink("");
        });

        this.get("#/about", function() {
            master.pageTitle("About");
            master.currentView("aboutTemplate");
            master.currentModel(master.aboutViewModel);
            master.hideSubMenu();
            master.currentMenuLink("about");
        });
        this.get("#/reserve", function() {
            master.pageTitle("Reservations");
            master.currentView("reserveTemplate");
            master.hideSubMenu();
            master.currentMenuLink("reserve");
        });
        this.get("#/menus/lunch", function() {
            master.menuViewModel.getLunchMenu();
            master.pageTitle("Lunch Menu");
            master.currentView("foodMenuTemplate");
            master.currentMenuLink("lunch");
            master.currentModel(master.menuViewModel);
            master.showSubMenu();
            master.menuViewModel.showWarning(true);
        });
        this.get("#/menus/dinner", function() {
            master.menuViewModel.getDinnerMenu();
            master.pageTitle("Dinner Menu");
            master.currentView("foodMenuTemplate");
            master.currentMenuLink("dinner");
            master.currentModel(master.menuViewModel);
            master.showSubMenu();
            master.menuViewModel.showWarning(true);
        });
        this.get("#/menus/cocktails", function() {
            master.menuViewModel.getCocktails();
            master.pageTitle("House Cocktails");
            master.currentView("foodMenuTemplate");
            master.currentMenuLink("cocktails");
            master.currentModel(master.menuViewModel);
            master.showSubMenu();
            master.menuViewModel.showWarning(false);
        });
        this.get("#/menus/wine", function() {
            master.menuViewModel.getWineList();
            master.pageTitle("Wine List");
            master.currentView("foodMenuTemplate");
            master.currentMenuLink("wine");
            master.currentModel(master.menuViewModel);
            master.showSubMenu();
            master.menuViewModel.showWarning(false);
        })
        this.get("#/menus/happyHour", function() {
            master.menuViewModel.getHappyHour();
            master.pageTitle("Happy Hour");
            master.currentView("foodMenuTemplate");
            master.currentMenuLink("happyHour");
            master.currentModel(master.menuViewModel);
            master.showSubMenu();
            master.menuViewModel.showWarning(false);
        });

        this.get("#/login", function() {
            window.location.href = $("#baseUrl").val() + "login";
        });

        this.get("#/logout", function() {
            window.location.href = $("#baseUrl").val() + "j_spring_security_logout";
        });

        this.get("", function() {
            this.redirect("#/home");
        });

    }).run();

});
