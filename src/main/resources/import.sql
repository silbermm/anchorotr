DROP TABLE IF EXISTS authorities;
Drop table if exists users;
Drop TABLE IF EXISTS persistent_logins;

create table persistent_logins(username varchar(64) not null, series varchar(64) primary key, token varchar(64) not null, last_used timestamp not null)
create table users(username varchar(50) not null primary key,password varchar(200) not null,enabled boolean not null);
create table authorities (username varchar(50) not null,authority varchar(50) not null,constraint fk_authorities_users foreign key(username) references users(username));
create unique index ix_auth_username on authorities (username,authority);

INSERT INTO users (username, password, enabled) VALUES('silbermm','51375db7e11864e35ba2c9df43df2ef8185ef8f3c12ddff400890065d05f0f62',1);
INSERT INTO authorities (username, authority) VALUES ('silbermm', 'Administrator');
INSERT INTO users (username, password, enabled) VALUES('admin', '7f6a223111da9f8831925b172a8976a70ae9192491dd993f8f7384cf2e849b87',1);
INSERT INTO authorities (username, authority) VALUES ('admin', 'Administrator');

DELETE FROM menu;
INSERT INTO menu (menu_id,name) VALUEs (1,'lunch');
INSERT INTO menu (menu_id,name) VALUEs (2,'dinner');
INSERT INTO menu (menu_id,name) VALUEs (3,'wine list');
INSERT INTO menu (menu_id,name) VALUES (4,'house cocktails');
INSERT INTO menu (menu_id,name) VALUES (5, 'happy hour');

DELETE FROM menuitem;
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Deviled Eggs','with smoked trout','SNACKS','$4',2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Jonah Crab Claw','Snap + Eat','SNACKS','$3.5 EACH',2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('House Made Pickles',NULL,'SNACKS','$4',2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_Id) VALUES('Crab Cake Slider','with lemon aioli','SNACKS','$6',2);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('ICED','daily selection with mignonette + cocktail + fresh horseradish','OYSTERS','M/P',2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('OVEN ROASTED','with pancetta + watercress','OYSTERS','$4 each',2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FRIED','with house made tartar sauce','OYSTERS','$9',2);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('New England Clam Chowder',NULL,'STARTERS',8,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('BOQUERONES','basil pesto bruschetta','STARTERS',8,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('PEI MUSSELS','shallots and burnt orange','STARTERS',9,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Fried Oysters','house made tartar sauce','STARTERS',9,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('CRAWFISH BEIGNETS','rooster aioli','STARTERS',10,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FRIED CALAMARI','with sweet gherkins and mustard aioli','STARTERS',11,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SMOKED WHITEFISH TOAST','avocado, pickled red onion','STARTERS',11,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SHRIMP AND GRITS','slow poached egg','STARTERS',12,2);



INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FISH & CHIPS','with malt vinegar aioli','MAINS',16,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('TROUT BLT','with bacon aioli and Vidalia onion rings','MAINS',17,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('JUMBO LUMP CRAB SPAGHETTI','with basil pesto','MAINS',19,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('DAY BOAT SEA SCALLOPS','with miso corn salad','MAINS',24,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SHELLFISH BOUILLABAISSE',NULL,'MAINS',25,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('LOBSTER ROLL','with french fries','MAINS','MP',2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FILET FISH OF THE DAY',NULL,'MAINS','MP',2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('WHOLE FISH OF THE DAY','served grilled/fried/Thai style','MAINS','MP',2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('WHOLE MAINE LOBSTER','served grilled or boiled with sweet pea pancakes','MAINS','MP',2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('BURGER*','with french fries,add fried oyster +2','MAINS',14,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FLAT IRON STEAK*',NULL,'MAINS',19,2);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FRENCH FRIES',NULL,'SIDES',6,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('HUSH PUPPIES',NULL,'SIDES',6,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('CELERY ROOT SLAW',NULL,'SIDES',6,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('ELOTES',NULL,'SIDES',7,2);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SALTED CARAMEL PUDDING',NULL,'DESERTS',6,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('STEAMED LEMON CAKE',NULL,'DESERTS',7,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('HOT FUDGE SUNDAE',NULL,'DESERTS',7,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SEASONAL CRISP','with ice cream','DESERTS',9,2);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('PARKSIDE GIMLET','Hindricks''s gin, fresh lime, mint syrup, cucumber','COCKTAILS',10,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('STOWAWAY','Hangar One Mandarin vodka, fresh lime, mint syrup','COCKTAILS',9,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('BOATHOUSE PUNCH','Watershed Gin, St.Germain, Aperol, fresh citrus juices, rose Prosecco','COCKTAILS',9,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FAIR HARBOR','Kraken rum, ginger beer, lime, pomegranate juice','COCKTAILS',8,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SMALL CRAFT ADVISORY','Cazadores Tequila Blanco, citrus juices, jalapeno syrup','COCKTAILS',10,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SALTY DOG','Tito''s vodka, fresh grapefruit juice','COCKTAILS',9,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('STING RAY','Buffalo Trace bourbon, Carpano Antica, lime juice, ginger syrup','COCKTAILS',10,4);


INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Il Follo Prosecco Cuvee Ros���, Veneto, Italy','NV','SPARKLING AND CHAMPAGNE','11/44',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Ravent���s i Blanc Cava Reserva Brut, Spain','''09','SPARKLING AND CHAMPAGNE','47',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Laurent-Perrier Champagne, France','NV','SPARKLING AND CHAMPAGNE','80',3 );

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Condesa Eylo, Verdejo, Rueda, Spain','''10','WHITE','7/28',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Fattoria Laila, Verdicchio, Marche, Italy','''11','WHITE','33',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Labb��� Abymes, Jacqu���re, Vin de Savoie, France','''12','WHITE','33',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Dm. du Haut Bourg, Muscadet, Loire Valley, France','''11','WHITE','9/36',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Skuttlebutt, Sauvignon Blanc/Semillon, Margaret River, Australia','''12','WHITE','10/42',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Ch���teau Lamothe de Haux, Bordeaux Blanc, France','''11','WHITE','42',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Dm. Bott Geyl, Pinot d���Alsace, ���M���tiss,��� France','''10','WHITE','42',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Cantina del Taburno, Falanghina, Italy','''12','WHITE','42',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Seifried, Pinot Gris, Nelson, New Zealand','''11','WHITE','11/44',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Marques de Caceres, Deusa Nai, Albari���o, Rias Baixas, Spain','''11','WHITE','44',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Sivas-Sonoma, Chardonnay, California','''11','WHITE','12/45',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Ulacia, Getariako, Txakolina, Basque, Spain','''12','WHITE','13/46',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Dm. Laroche, Petit Chablis, Chardonnay, France','''10','WHITE','52',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('August Kesseler, Riesling Kabinett, Germany','''11','WHITE','54',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Les Argiles Vouvray, Chenin Blanc, France','''11','WHITE','62',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Zuani Vigne, Bianco, Collio, Italy','''12','WHITE','64',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Acha Blanca, Albari���o, California','''12','WHITE','64',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Tinel-Blondelet, Sauvignon Blanc, Sancerre "La Croix Canat" France','''10','WHITE','66',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Dm. Rijckaert, Burgundy, St. Veran, Chardonnay, Vielles Vignes, France','''10','WHITE','67',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('WALT "La Brisa" Chardonnay, Sonoma, California','''10','WHITE','98',3 );

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Ch���teau Mas Neuf, Ros��� "Rh���ne Paradox," Rhone Valley, France','''12','ROSE','8/34',3);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('El Coto Rosado, Grenache & Tempranillo, Rioja, Spain','''12','ROSE','8/34',3);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Alexander Valley, Ros���, Sangiovese, California','''12','ROSE','42',3);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Heitz, Grignolino Ros���, Napa, California','''12','ROSE','52',3);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Tortoise Creek, Carignan, "Vielles Vignes", Pays d���H���rault, France','''12','RED','29',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Corte alla Flora, Podere del Giuggiolo, Sangiovese, Toscano, Italy','''10','RED','8/34',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Arido, Malbec, Mendoza, Argentina','''09','RED','34',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Leese-Fitch, Cabernet Sauvignon, California','''11','RED','9/36',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Sevona Estate, Pinot Noir, Santa Barbara County, California','''10','RED','52',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Felino Vina Cobos, Malbec, Mendoza, Argentina','''11','RED','54',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Lang & Reed, North Coast, Cabernet Franc, California','''10','RED','62',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('North Valley, Pinot Noir, Soter Vineyards, Oregon','''11','RED','74',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('"Vi���a Ardanza Reserva", Tempra���illo/Garnacha, Rioja, Spain','''04','RED','86',3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Ch���teau de Vaudieu, Ch���teauneuf du Pape, Val de Dieu, France','''10','RED','108',3 );





