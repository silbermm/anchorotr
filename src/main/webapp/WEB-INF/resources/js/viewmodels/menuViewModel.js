define(["knockout", "jquery", "../models/menuitem", "../models/catagory"], function(ko, $, MenuItem, Catagory) {
    var menuViewModel = function() {
        var self = this;
        self.baseUrl = $("#baseUrl").val();

        self.showWarning = ko.observable(false);

        self.catagories = ko.observableArray();

        self.deleteObject = ko.observable();
        self.deleteObjectName = ko.observable();

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
            // show modal to ask if sure...
            $('#removeItemModal').modal('show');
        }

        self.actuallyDelete = function() {
            console.log(self.deleteObject().catagory());
            if (self.deleteObject().catagory() === 'RAW BAR') {
                self.rawBar.remove(self.deleteObject());
            }
            if (self.deleteObject().catagory() === 'PLATTERS') {
                self.platters.remove(self.deleteObject());
            }
            if (self.deleteObject().catagory() === 'SPARKLING AND CHAMPAGNE') {                
                self.ajaxCall({
                    type: "DELETE",
                    url: "/menus/items/" + self.deleteObject().id(),                    
                    success: function() {
                        self.sparklingWine.remove(self.deleteObject());
                        self.deleteObject();
                    },
                });              
                $("#removeItemModal").modal('hide');
            }
        }

        self.ajaxCall = function(ajaxCall) {
            ajaxCall = ajaxCall || {};            
            $.ajax({
                type: ajaxCall.type || "GET",
                url: ajaxCall.url || "",                
                contentType: "application/json",
                dataType: "json"
            }).done(function(msg) {
                console.log(msg);                
                ajaxCall.success();
            }).fail(function(jqXHR, textStatus) {
                console.log(jqXHR.responseText);
            });

            //props.params = props.params || {};
            //props.id = props.id || 1;
            //props.callback = props.callback || function() {           
        };

        self.addItem = function(menuId, catagory) {
            console.log(menuId + " " + catagory);
        }

        self.getLunchMenu = function() {
            cleanMenus();
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

            $.getJSON(self.baseUrl + '/menus/1/MAINS', function(data) {
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
            console.log("attempting to get dinner menu...");
            getMenu(2, 'RAW%20BAR', self.rawBar);
            getMenu(2, 'PLATTERS', self.platters);
            getMenu(2, 'STARTERS', self.starters);
            getMenu(2, 'SALADS', self.salads);
            //getMenu(2, 'MAINS', self.mains);
            getMenu(2, 'SIDES', self.sides);
            getMenu(2, 'DESERTS', self.deserts);
            $.getJSON(self.baseUrl + '/menus/2/MAINS', function(data) {
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
            console.log("getting cocktails");
            $.getJSON(self.baseUrl + '/menus/4', function(data) {

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
        }

        var getCatagories = function(menuId) {
            self.catagories.removeAll();
            $.getJSON('/menus/' + menuId + "/catagories", function(data) {
                var mappedItems = $.map(data, function(cat) {
                    self.catagories.push(cat);
                });
            })
        }


    };

    return menuViewModel;
});
