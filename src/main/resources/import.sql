DROP TABLE IF EXISTS authorities;
Drop table if exists users;

create table users(username varchar(50) not null primary key,password varchar(200) not null,enabled boolean not null);
create table authorities (username varchar(50) not null,authority varchar(50) not null,constraint fk_authorities_users foreign key(username) references users(username));
create unique index ix_auth_username on authorities (username,authority);

INSERT INTO users (username, password, enabled) VALUES('silbermm','51375db7e11864e35ba2c9df43df2ef8185ef8f3c12ddff400890065d05f0f62','t');
INSERT INTO authorities (username, authority) VALUES ('silbermm', 'Administrator');

DELETE FROM menu;
INSERT INTO menu (menu_id,name) VALUEs (1,'lunch');
INSERT INTO menu (menu_id,name) VALUEs (2,'dinner');
INSERT INTO menu (menu_id,name) VALUEs (3,'wine list');
INSERT INTO menu (menu_id,name) VALUES (4,'house cocktails');
INSERT INTO menu (menu_id,name) VALUES (5, 'happy hour');

DELETE FROM menuitem;
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('East Coast Oysters',NULL,'RAW BAR',12,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('West Coast Oysters',NULL,'RAW BAR',12,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Little Neck Clams',NULL,'RAW BAR',1.5,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_Id) VALUES('Crab Claws',NULL,'RAW BAR',15,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_Id) VALUES('Peel and Eat Shrimp 1/2lb',NULL,'RAW BAR',12,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_Id) VALUES('Peel and Eat Shrimp 1lb',NULL,'RAW BAR',20,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_Id) VALUES('Bait and Tackle','8 east coast oysters, 4 little neck clams, peel & eat shrimp, 4 chilled mussels, 2 jonah crab claws','PLATTERS',40,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_Id) VALUES('Hook, Line and Sinker','6 east and 6 west coast oysters, 6 little neck clams, peel & eat shrimp, 8 chilled mussels, 4 jonah crab claws, ½ lobster','PLATTERS',75,1);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_Id) VALUES('New England Clam Chowder',NULL,'STARTERS',8,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('BOQUERONES','basil pesto bruschetta','STARTERS',8,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('PEI MUSSELS','shallots and burnt orange','STARTERS',9,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Fried Oysters','house made tartar sauce','STARTERS',9,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('CRAWFISH BEIGNETS','rooster aioli','STARTERS',10,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FRIED CALAMARI','with sweet gherkins and mustard aioli','STARTERS',11,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SMOKED WHITEFISH TOAST','avocado, pickled red onion','STARTERS',11,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SHRIMP AND GRITS','slow poached egg','STARTERS',12,1);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('MIXED GREENS','cherry tomatoes','SALADS',6,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('BABY TUSCAN KALE','pickled onions, toasted hazelnuts, parmesan','SALADS',11,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('TUNA NIÇOISE*','egg, potato, haricot vert, anchovy vinaigrette','SALADS',16,1);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FISH TACOS','with pico de gallo and chipotle aioli','MAINS',12,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('OYSTER PO BOY','dressed','MAINS',12,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('TROUT BLT','with bacon aioli','MAINS',12,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SMELT SANDWICH','preserved lemon, herbs','MAINS',12,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SARDINE BANH MI',NULL,'MAINS',13,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('PAN FRIED COD SANDWICH',NULL,'MAINS',14,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('PAN ROASTED SKATE','lemon caper sauce','MAINS',14,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('LINGUINI WITH CLAMS','pancetta and red pepper flakes','MAINS',14,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FISH & CHIPS',NULL,'MAINS',15,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('LOBSTER ROLL','served with french fries','MAINS',20,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('WHOLE FISH OF THE DAY','served grilled or fried','MAINS',20,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('BURGER*','add fried oyster +2','MAINS',12,1);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FRENCH FRIES',NULL,'SIDES',6,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('HUSH PUPPIES',NULL,'SIDES',6,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('CELERY ROOT SLAW',NULL,'SIDES',6,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('ELOTES',NULL,'SIDES',7,1);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SALTED CARAMEL PUDDING',NULL,'DESERTS',6,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('STEAMED LEMON CAKE',NULL,'DESERTS',7,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('HOT FUDGE SUNDAE',NULL,'DESERTS',7,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SEASONAL CRISP','with ice cream','DESERTS',9,1);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('1/2 Sandwich** + CUP OF CHOWDER/GREEN SALAD','(**except Tacos, Lobster Roll, and Burger)','LUNCH SPECIAL',11,1);


INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Iced Tea',NULL,'BEVERAGES',2,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Freshed Squeezed Lemonade',NULL,'BEVERAGES',2.5,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Arnold Palmer',NULL,'BEVERAGES',2.5,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Coke, Diet Coke, Sprite',NULL,'BEVERAGES',2.5,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Root Beer',NULL,'BEVERAGES',2.5,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Sparkling Water',NULL,'BEVERAGES',3,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('The Anchor Bloody Mary with house made pickles','add chilled shrimp +2.5,add oyster +2,add lobster claw +4','BEVERAGES',9,1);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('East Coast Oysters',NULL,'RAW BAR',12,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('West Coast Oysters',NULL,'RAW BAR',12,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Little Neck Clams',NULL,'RAW BAR',1.5,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Crab Claws',NULL,'RAW BAR',15,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Peel and Eat Shrimp 1/2lb',NULL,'RAW BAR',12,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Peel and Eat Shrimp 1lb',NULL,'RAW BAR',20,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Bait and Tackle','8 east coast oysters, 4 little neck clams, peel & eat shrimp, 4 chilled mussels, 2 jonah crab claws','PLATTERS',40,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Hook, Line and Sinker','6 east and 6 west coast oysters, 6 little neck clams, peel & eat shrimp, 8 chilled mussels, 4 jonah crab claws, ½ lobster','PLATTERS',75,2);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('New England Clam Chowder',NULL,'STARTERS',8,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('BOQUERONES','basil pesto bruschetta','STARTERS',8,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('PEI MUSSELS','shallots and burnt orange','STARTERS',9,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('Fried Oysters','house made tartar sauce','STARTERS',9,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('CRAWFISH BEIGNETS','rooster aioli','STARTERS',10,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FRIED CALAMARI','with sweet gherkins and mustard aioli','STARTERS',11,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SMOKED WHITEFISH TOAST','avocado, pickled red onion','STARTERS',11,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SHRIMP AND GRITS','slow poached egg','STARTERS',12,2);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('MIXED GREENS','cherry tomatoes','SALADS',6,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('BABY TUSCAN KALE','pickled onions, toasted hazelnuts, parmesan','SALADS',11,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('HEIRLOOM TOMATO SALAD','feta cheese, cucumbers, olives, fresh herbs','SALADS',12,2);

INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FISH & CHIPS','with malt vinegar aioli','MAINS',16,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('TROUT BLT','with bacon aioli and Vidalia onion rings','MAINS',17,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('JUMBO LUMP CRAB SPAGHETTI','with basil pesto','MAINS',19,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('DAY BOAT SEA SCALLOPS','with miso corn salad','MAINS',24,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SHELLFISH BOUILLABAISSE',NULL,'MAINS',25,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('LOBSTER ROLL','with french fries','MAINS',0,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FILET FISH OF THE DAY',NULL,'MAINS',0,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('WHOLE FISH OF THE DAY','served grilled/fried/Thai style','MAINS',0,2);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('WHOLE MAINE LOBSTER','served grilled or boiled with sweet pea pancakes','MAINS',0,2);
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
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('PARKSIDE GIMLET','Hindricks''s gin, fresh lime, mint syrup, cucumber',NULL,10,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('STOWAWAY','Hangar One Mandarin vodka, fresh lime, mint syrup',NULL,9,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('BOATHOUSE PUNCH','Watershed Gin, St.Germain, Aperol, fresh citrus juices, rose Prosecco',NULL,9,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('FAIR HARBOR','Kraken rum, ginger beer, lime, pomegranate juice',NULL,8,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SMALL CRAFT ADVISORY','Cazadores Tequila Blanco, citrus juices, jalapeno syrup',NULL,10,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('SALTY DOG','Tito''s vodka, fresh grapefruit juice',NULL,9,4);
INSERT INTO menuitem (itemName,itemDesc,catagory,price,menu_id) VALUES('STING RAY','Buffalo Trace bourbon, Carpano Antica, lime juice, ginger syrup',NULL,10,4);
