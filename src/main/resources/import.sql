DROP TABLE IF EXISTS authorities;
Drop table if exists users;
Drop TABLE IF EXISTS persistent_logins;

create table persistent_logins(username varchar(64) not null, series varchar(64) primary key, token varchar(64) not null, last_used timestamp not null);
create table users(username varchar(50) not null primary key,password varchar(200) not null,enabled boolean not null);
create table authorities (username varchar(50) not null,authority varchar(50) not null,constraint fk_authorities_users foreign key(username) references users(username));
create unique index ix_auth_username on authorities (username,authority);

INSERT INTO users (username, password, enabled) VALUES('silbermm','51375db7e11864e35ba2c9df43df2ef8185ef8f3c12ddff400890065d05f0f62','t');
INSERT INTO authorities (username, authority) VALUES ('silbermm', 'Administrator');
INSERT INTO users (username, password, enabled) VALUES('admin', '7f6a223111da9f8831925b172a8976a70ae9192491dd993f8f7384cf2e849b87','t');
INSERT INTO authorities (username, authority) VALUES ('admin', 'Administrator');

DELETE FROM mailsettings;
INSERT INTO mailsettings (id,fromaddress,password,smtpauth,smtphost,smtpport,starttls,subject,toaddress,username) VALUES(1,'info@theanchor-otr.com','','t','smtpout.secureserver.net','465','t','Website Mail','info@theanchor-otr.com','info@theanchor-otr.com');

DELETE FROM menu;
INSERT INTO menu (menu_id,name) VALUEs (1,'lunch');
INSERT INTO menu (menu_id,name) VALUEs (2,'dinner');
INSERT INTO menu (menu_id,name) VALUEs (3,'wine list');
INSERT INTO menu (menu_id,name) VALUES (4,'house cocktails');
INSERT INTO menu (menu_id,name) VALUES (5, 'happy hour');

DELETE FROM menuitem;
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('Deviled Eggs','with smoked trout','SNACKS','$4',2,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('Jonah Crab Claw','Snap + Eat','SNACKS','$3.5 EACH',2,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('House Made Pickles',NULL,'SNACKS','$4',2,3);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_Id,weight) VALUES('Crab Cake Slider','with lemon aioli','SNACKS','$6',2,4);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('ICED','daily selection with mignonette + cocktail + fresh horseradish','OYSTERS','M/P',2,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('OVEN ROASTED','with pancetta + watercress','OYSTERS','$4 each',2,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('FRIED','with house made tartar sauce','OYSTERS','$9',2,3);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('PAT LAFREIDA BURGER','with fries','SANDWICHES','$14',2,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('OYSTER PO BOY','dressed with slaw','SANDWICHES','$15',2,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('TROUT BLT','with onion rings','SANDWICHES','$17',2,3);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('MIXED GREEN SALAD','with radished + cucmbers + cherry tomatoes','APPETIZERS','$6',2,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('KALE SALAD','with pickled onion + hazelnuts + parmesan','APPETIZERS','$11',2,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('BEET + WATERCRESS SALAD','with spiced pecans + bleu dauvergne','APPETIZERS','$11',2,3);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('New England Clam Chowder',NULL,'APPETIZERS','$8',2,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('SCALLOP','with pulled pork + hollandaise','APPETIZERS','$9',2,5);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('CRAWFISH BEIGNETS','with rooster aioli','APPETIZERS','$10',2,6);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('PEI MUSSELS','with shallots and burnt orange','APPETIZERS','$11',2,7);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('GRILLED CALAMARI','with tabbouleh + fried chickpeas','APPETIZERS','$11',2,8);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('1/2LB PEEL & EAT SHRIMP','with old bay seasoning','APPETIZERS','$12',2,9);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('FISH & CHIPS','with malt vinegar aioli','MAINS','$16',2,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('ORRECHETTE PASTA "SICILIAN STYLE"','with clams + rapini','MAINS','$19',2,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('SPOT TAIL BASS FILET','with couscous + yougurt tahini','MAINS','$24',2,3);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('SEA SCALLOPS','with frisee + mushrooms + bacon vin','MAINS','$24',2,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('SHELLFISH BOUILLABAISSE','with saffron aioli','MAINS','$25',2,5);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('RED WATTLEE PORK CHOP','with chorizo corn bread stuffing','MAINS','$27',2,6);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('WHOLE FISH OF THE DAY','with grilled veg of Thai style','MAINS','MP',2,7);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('FRENCH FRIES',NULL,'SIDES','$6',2,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('HUSH PUPPIES',NULL,'SIDES','$6',2,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('RAPINI',NULL,'SIDES','$6',2,3);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('BRUSSEL SPROUTS',NULL,'SIDES','$8',2,4);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('TUESDAY','$28 three course menu','DAILY SPECIALS',NULL,2,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('WEDNESDAY','bait + tackle seafood platter','DAILY SPECIALS',NULL,2,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('THURSDAY','lobster roll','DAILY SPECIALS',NULL,2,3);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('FRIDAY','whole maine lobster dinner','DAILY SPECIALS',NULL,2,4);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('CABIN FEVER','buffalo trace bourbon, apple cider molasses, allspice dram, ginger beer','COCKTAILS','$10',4,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('STING RAY','Buffalo Trace bourbon, Carpano Antica, lime juice, ginger syrup','COCKTAILS','$10',4,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('THE ANCHOR BLOODY MARY','tito''s vodka, house made pickles - add shrimp +2.5/oyster +2/lobster claw +4','COCKTAILS','$9',4,3);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('PARKSIDE GIMLET','Hindricks''s gin, fresh lime, mint syrup, cucumber','COCKTAILS','$10',4,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('STOWAWAY','Hangar One Mandarin vodka, fresh lime, mint syrup','COCKTAILS','$9',4,5);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('FAIR HARBOR','Kraken rum, ginger beer, lime, pomegranate juice','COCKTAILS','$8',4,6);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('SMALL CRAFT ADVISORY','Cazadores Tequila Blanco, citrus juices, jalapeno syrup','COCKTAILS','$10',4,7);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('SALTY DOG','Tito''s vodka, fresh grapefruit juice','COCKTAILS','$9',4,8);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('SMOKE ON THE WATER','watershed bourbon barrel aged gin, muddled apple, smoked ginger syrup, fresh lemon juice','COCKTAILS','$10',4,9);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('CRIMSON TIDE','OYO Stone Fruit vodka, Averna amaro siciliano, lemon rosemary syrup','COCKTAILS','$10',4,10);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('IL FOLLO PROSECCO CUVEE ROSE, VENETO, ITALY','NV','SPARKLING AND CHAMPAGNE','11/44',3,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('RAVENTOS I BLANC CAVA RESERVA BRUT, SPAIN','''09','SPARKLING AND CHAMPAGNE','47',3,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('LAURENT-PERRIER CHAMPAGNE, FRANCE','NV','SPARKLING AND CHAMPAGNE','28/88',3,3);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('EL COTO ROSADO, GRENACHE & TEMPRANILLO, RIOJA, SPAIN','''11','ROSE','8/34',3,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('ALEXANDER VALLEY, ROSE, SANGIOVESE, CALIFORNIA','''12','ROSE','42',3,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('HEITZ, GRIGNOLINO ROSE, NAPA, CALIFORNIA','''12','ROSE','52',3,3);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('TORTOISE CREEK, CARIGNAN, "VIELLES VIGNES", PAYS D''HERAULT, FRANCE','''12','RED','8/32',3,1 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('KAIKEN, MALBEC RESERVA, MENDOZA, ARGENTINA','''11','RED','9/36',3,2 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('LEESE-FITCH, CABERNET SAUVIGNON, CALIFORNIA','''11','RED','9/36',3,3 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('PERRIN FAMILLE, COTES DU RHONE ROUGE, FRANCE','''10','RED','10/42',3,4 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('FELINO VINA COBOS, MALBEC, MENDOZA, ARGENTINA','''10','RED','54',3,5 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('TOLAINI AL PASSO, SUPER TUSCAN, TOSCANO, ITALY','''08','RED','58',3,6 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('SEVONA ESTATE, PINOT NOIR, SANTA BARBARA COUNTY, CALIFORNIA','''10','RED','58',3,7 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('LANG & REED, NORTH COAST, CABERNET FRANC, CALIFORNIA','''10','RED','62',3,8);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('NORTH VALLEY, PINOT NOIR, SOTER VINEYARDS, OREGON','''11','RED','74',3,9 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('"VINA ARDANZA RESERVA", TEMPRANILLO/GARNACHA, RIOJA, SPAIN','''04','RED','86',3,10 );
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id,weight) VALUES('CHATEAU DE VAUDIEU, CHATEAUNEUF DU PAPE, VAL DE DIEU, FRANCE','''10','RED','108',3,11 );


