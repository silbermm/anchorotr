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
            master.currentMenuLink("");
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
            master.currentMenuLink("");
        });

        this.get("#/menus/lunch", function() {
            master.menuViewModel.getLunchMenu();
            master.pageTitle("Lunch Menu");
            master.currentView("foodMenuTemplate");
            master.currentMenuLink("lunch");
            master.currentModel(master.menuViewModel);
            master.showSubMenu();
        });
        this.get("#/menus/dinner", function() {
            master.menuViewModel.getDinnerMenu();
            master.pageTitle("Dinner Menu");
            master.currentView("foodMenuTemplate");
            master.currentMenuLink("dinner");
            master.currentModel(master.menuViewModel);
            master.showSubMenu();
        });


        this.get("", function() {
            this.redirect("#/home");
        });

    }).run();

});
