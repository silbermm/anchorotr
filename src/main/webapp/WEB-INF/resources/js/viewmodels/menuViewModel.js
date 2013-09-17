define(["knockout", "jquery", "../models/menuitem", "../models/catagory"], function(ko, $, MenuItem, Catagory) {
    var menuViewModel = function() {
        var self = this;
        self.baseUrl = $("#baseUrl").val();

        self.showWarning = ko.observable(false);

        self.catagories = ko.observableArray();

        self.deleteObject = ko.observable();
        self.deleteObjectName = ko.observable();
        self.currentMenu = ko.observable();

        self.addMenuObject = ko.observable(new MenuItem());

        self.active = ko.observable(false);
        self.rawBar = ko.observableArray();
        self.platters = ko.observableArray();
        self.starters = ko.observableArray();
        self.salads = ko.observableArray();
        self.sides = ko.observableArray();
        self.deserts = ko.observableArray();
        self.beverages = ko.observableArray();
        self.lunchSpecial = ko.observableArray();

        self.happyHour = ko.observable(false);

        self.cocktailsCol1 = ko.observableArray();
        self.cocktailsCol2 = ko.observableArray();

        self.mainsCol1 = ko.observableArray();
        self.mainsCol2 = ko.observableArray();

        self.sparklingWine = ko.observableArray();
        self.whiteWine = ko.observableArray();
        self.redWine = ko.observableArray();
        self.roseWine = ko.observableArray();

        self.editItem = function() {
            console.log(this);
        }

        self.deleteItem = function() {
            self.deleteObject(this);
            self.deleteObjectName(this.itemname());
            $('#removeItemModal').modal('show');
        }

        self.actuallyDelete = function() {
            $.ajax({
                type: "DELETE",
                url: "/menus/items/" + self.deleteObject().id(),
                contentType: "application/json",
                dataType: "json",
            }).done(function(msg){
                console.log(self.deleteObject().catagory());
                 switch (self.deleteObject().catagory()) {
                        case "SPARKLING AND CHAMPAGNE":
                            self.sparklingWine.remove(self.deleteObject());
                        case "ROSE":
                            self.roseWine.remove(self.deleteObject());
                        case "RED":
                            self.redWine.remove(self.deleteObject());
                        case "WHITE":
                            self.whiteWine.remove(self.deleteObject());
                        case "LUNCH SPECIAL":
                            self.lunchSpecial.remove(self.deleteObject());
                        case "RAW BAR":
                            self.rawBar.remove(self.deleteObject());
                        case "PLATTERS":
                            self.platters.remove(self.deleteObject());
                        case "STARTERS":
                            self.starters.remove(self.deleteObject());
                        case "SALADS":
                            self.salads.remove(self.deleteObject());
                        case "COCKTAILS":
                            self.cocktailsCol1.remove(self.deleteObject());
                            self.cocktailsCol2.remove(self.deleteObject());
                        case "MAINS":
                            self.mainsCol1.remove(self.deleteObject());
                            self.mainsCol2.remove(self.deleteObject());
                        case "SIDES":
                            self.sides.remove(self.deleteObject());
                        case "DESERTS":
                            self.deserts.remove(self.deleteObject());
                        case "BEVERAGES":
                            self.beverages.remove(self.deleteObject());
                        
                    }
            });           
            $("#removeItemModal").modal('hide');
        }
       
        self.addItem = function(catagory) {
            self.addMenuObject().catagory(catagory);
            self.addMenuObject().menuid(self.currentMenu());
            $('#addItemModal').modal('show');

        }

        self.cancelAdd = function() {
            self.addMenuObject(new MenuItem());
        }

        self.actuallyAdd = function() {
            var jsonObject = convertMenuItemToJson(self.addMenuObject());
            console.log(jsonObject);
            $.ajax({
                type: "POST",
                url: "/menus/items",
                contentType: "application/json",
                dataType: "json",
                data: jsonObject
            }).done(function(msg) {
                switch (self.addMenuObject().catagory()) {
                    case("SPARKLING AND CHAMPAGNE"):
                        self.sparklingWine.push(self.addMenuObject());
                    case("ROSE"):
                        self.roseWine.push(self.addMenuObject());
                    case("RED"):
                        self.redWine.push(self.addMenuObject());
                    case("WHITE"):
                        self.whiteWine.push(self.addMenuObject());
                    case("LUNCH SPECIAL"):
                        self.lunchSpecial.push(self.addMenuObject());
                    case("RAW BAR"):
                        self.rawBar.push(self.addMenuObject());
                    case("PLATTERS"):
                        self.platters.push(self.addMenuObject());
                    case("STARTERS"):
                        self.starters.push(self.addMenuObject());
                    case("SALADS"):
                        self.salads.push(self.addMenuObject());
                    case("COCKTAILS"):
                        self.cocktailsCol2.push(self.addMenuObject());
                    case("MAINS"):
                        self.mainsCol2.push(self.addMenuObject());
                    case("SIDES"):
                        self.sides.push(self.addMenuObject());
                    case("DESERTS"):
                        self.deserts.push(self.addMenuObject());
                    case ("BEVERAGES"):
                        self.beverages.push(self.addMenuObject());
                }
            }).fail(function(jqXHR, textStatus) {
                console.log(jqXHR.responseText);
            });
            $('#addItemModal').modal('hide');
        }

        self.getLunchMenu = function() {
            cleanMenus();
            self.currentMenu(1);
            console.log(self.catagories);
            console.log("attempting to get lunch menu...");
            getMenu(1, 'RAW%20BAR', self.rawBar);
            getMenu(1, 'PLATTERS', self.platters);
            getMenu(1, 'STARTERS', self.starters);
            getMenu(1, 'SALADS', self.salads);
            getMenu(1, 'SIDES', self.sides);
            getMenu(1, 'DESERTS', self.deserts);
            getMenu(1, 'BEVERAGES', self.beverages);
            getMenu(1, 'LUNCH%20SPECIAL', self.lunchSpecial);

            $.getJSON('/menus/1/MAINS', function(data) {
                var mappedItems = $.map(data, function(menuitem) {
                    return new MenuItem(menuitem);
                });
                var half = mappedItems.length / 2;
                var leftover = mappedItems.length % 2;
                var firstColumn = half + leftover;

                console.log("firstColumn should be " + firstColumn);
                $.each(mappedItems, function(idx, val) {
                    if (idx + 1 <= firstColumn) {
                        self.mainsCol1.push(val);
                    } else {
                        self.mainsCol2.push(val);
                    }
                });
            });
        };

        self.getDinnerMenu = function() {
            cleanMenus();
            self.currentMenu(2);
            console.log("attempting to get dinner menu...");
            getMenu(2, 'RAW%20BAR', self.rawBar);
            getMenu(2, 'PLATTERS', self.platters);
            getMenu(2, 'STARTERS', self.starters);
            getMenu(2, 'SALADS', self.salads);
            getMenu(2, 'SIDES', self.sides);
            getMenu(2, 'DESERTS', self.deserts);
            $.getJSON('/menus/2/MAINS', function(data) {
                var dinnerMappedItems = $.map(data, function(menuitem) {
                    return new MenuItem(menuitem);
                });
                var half = dinnerMappedItems.length / 2;
                var leftover = dinnerMappedItems.length % 2;
                var firstColumn = half + leftover;


                console.log("firstColumn should be " + firstColumn);
                $.each(dinnerMappedItems, function(idx, val) {
                    if (idx + 1 <= firstColumn) {
                        self.mainsCol1.push(val);
                    } else {
                        self.mainsCol2.push(val);
                    }
                });
            });
        }

        self.getCocktails = function() {
            cleanMenus();
            self.currentMenu(4);
            console.log("getting cocktails");
            $.getJSON('/menus/4', function(data) {

                var mappedItems = $.map(data, function(menuitem) {
                    return new MenuItem(menuitem);
                });

                var half = mappedItems.length / 2;
                var leftover = mappedItems.length % 2;
                var firstColumn = half + leftover;

                $.each(mappedItems, function(idx, val) {
                    if (idx + 1 <= firstColumn) {
                        self.cocktailsCol1.push(val);
                    } else {
                        self.cocktailsCol2.push(val);
                    }
                })
            });
        }

        self.getWineList = function() {
            cleanMenus();
            self.currentMenu(3);
            getMenu(3, 'WHITE', self.whiteWine);
            getMenu(3, 'RED', self.redWine);
            getMenu(3, 'SPARKLING%20AND%20CHAMPAGNE', self.sparklingWine);
            getMenu(3, 'ROSE', self.roseWine);
        }

        self.getHappyHour = function() {
            cleanMenus();
            self.happyHour(true);
        }

        self.showSparklingRow = ko.computed(function() {
            if (self.sparklingWine().length > 0) {
                return true;
            }
            if (self.roseWine().length > 0) {
                return true;
            }
            return false;
        })

        var getMenu = function(menuId, catagory, observable) {
            $.getJSON('/menus/' + menuId + "/" + catagory, function(data) {
                var mappedItems = $.map(data, function(menuitem) {
                    return new MenuItem(menuitem);
                });
                observable(mappedItems);
            });
        }

        var cleanMenus = function() {
            self.rawBar.removeAll();
            self.platters.removeAll();
            self.starters.removeAll();
            self.salads.removeAll();
            self.sides.removeAll();
            self.deserts.removeAll();
            self.beverages.removeAll();
            self.lunchSpecial.removeAll();
            self.mainsCol1.removeAll();
            self.mainsCol2.removeAll();
            self.cocktailsCol1.removeAll();
            self.cocktailsCol2.removeAll();
            self.sparklingWine.removeAll();
            self.whiteWine.removeAll();
            self.redWine.removeAll();
            self.roseWine.removeAll();
            self.happyHour(false);
            self.currentMenu();
        }

        var getCatagories = function(menuId) {
            self.catagories.removeAll();
            $.getJSON('/menus/' + menuId + "/catagories", function(data) {
                var mappedItems = $.map(data, function(cat) {
                    self.catagories.push(cat);
                });
            })
        }

        var convertMenuItemToJson = function(menuItem) {
            var data = {};
            data.itemName = menuItem.itemname();
            data.itemDesc = menuItem.itemdesc();
            data.catagory = menuItem.catagory();
            data.price = menuItem.price();
            data.menu = self.currentMenu();
            return JSON.stringify(data);
        }


    };

    return menuViewModel;
});
