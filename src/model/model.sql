-- Managing Tables

CREATE TABLE restaurants (
restaurant_id serial PRIMARY KEY,
restaurant_name varchar(32) not null,
);

CREATE TABLE branchs (
branch_id serial PRIMARY KEY,
branch_location varchar(32) not null,
location_info text,
branch_created_at timestamptz DEFAULT CURRENT_TIMESTAMP,
branch_of int REFERENCES restaurants(restaurant_id)
);

CREATE TABLE branchMenus (
menu_id serial PRIMARY KEY,
meal_name varchar(32) not null,
meal_desc text,
meal_price varchar(20) not null,
menu_of_branch_id int REFERENCES branchs(branch_id)
);




ALTER TABLE branchMenus RENAME COLUMN course_id TO menu_id;
ALTER TABLE branchMenus ADD COLUMN meal_price varchar(20);
SELECT * FROM restaurants LEFT JOIN branchs ON restaurant_id = branch_of;
SELECT * FROM branchs JOIN branchMenus ON branch_id = menu_of_branch_id;

INSERT INTO restaurants( restaurant_name) VALUES ('Rayhon');
INSERT INTO restaurants( restaurant_name) VALUES ('Soy');
INSERT INTO restaurants( restaurant_name) VALUES ('Komolon');
INSERT INTO restaurants( restaurant_name) VALUES ('Beshqozon');


INSERT INTO branchMenus( meal_name, meal_desc, meal_price, menu_of_branch_id) 
VALUES ('Qatlama', 'xamrli taom', '21000 so`m', 1),
       ('manti', '2-ovqat', '3500 so`m', 1),
       ('shurva', 'qo`y go`shtiga', '14000 so`m', 1 ),
       ('osh', 'Jizzax oshi', '21000 so`m', 1 ),
       ('xonim', 'go`shtli', '2000 so`m', 1 ),
       ('plimen', 'uy plimeni', '18000 so`m', 1 ),
       ('Norin', 'suvsiz norin', '25000 so`m', 1 ),
       ('beshbarmoq', 'katta tog`orada', '35000 so`m', 1 ),
       ('Qatlama', 'xamrli taom', '21000 so`m', 2),
       ('manti', '2-ovqat', '3500 so`m', 2),
       ('shurva', 'qo`y go`shtiga', '14000 so`m', 2 ),
       ('osh', 'Jizzax oshi', '21000 so`m', 2 ),
       ('xonim', 'go`shtli', '2000 so`m', 2 ),
       ('plimen', 'uy plimeni', '18000 so`m', 2 ),
       ('Norin', 'suvsiz norin', '25000 so`m', 2 ),
       ('beshbarmoq', 'katta tog`orada', '35000 so`m', 2),
       ('Qatlama', 'xamrli taom', '21000 so`m', 3),
       ('manti', '2-ovqat', '3500 so`m', 3),
       ('shurva', 'qo`y go`shtiga', '14000 so`m', 3 ),
       ('osh', 'Jizzax oshi', '21000 so`m', 3 ),
       ('xonim', 'go`shtli', '2000 so`m', 3 ),
       ('plimen', 'uy plimeni', '18000 so`m', 3 ),
       ('Norin', 'suvsiz norin', '25000 so`m', 3 ),
       ('beshbarmoq', 'katta tog`orada', '35000 so`m', 3),
       ('Qatlama', 'xamrli taom', '21000 so`m', 4),
       ('manti', '2-ovqat', '3500 so`m', 4),
       ('shurva', 'qo`y go`shtiga', '14000 so`m', 4 ),
       ('osh', 'Jizzax oshi', '21000 so`m', 4 ),
       ('xonim', 'go`shtli', '2000 so`m', 4 ),
       ('plimen', 'uy plimeni', '18000 so`m', 4 ),
       ('Norin', 'suvsiz norin', '25000 so`m', 4 ),
       ('beshbarmoq', 'katta tog`orada', '35000 so`m', 4);

INSERT INTO branchs( branch_location, location_info, branch_of) 
VALUES ('Shayxontoxur', 'Samarqand darvoza yonida', 2),
       ('Yunusobot', 'Megaplanet yonida', 2),
       ('Chilonzor', 'Integro yonida', 2),
       ('Yashnabod', 'Park yonida',  2),
       ('Shayxontoxur', 'Samarqand darvoza yonida', 3),
       ('Yunusobot', 'Megaplanet yonida', 3),
       ('Chilonzor', 'Integro yonida', 3),
       ('Yashnabod', 'Park yonida',  3),
       ('Shayxontoxur', 'Samarqand darvoza yonida', 4),
       ('Yunusobot', 'Megaplanet yonida', 4),
       ('Chilonzor', 'Integro yonida', 4),
       ('Yashnabod', 'Park yonida',  4);



SELECT 
r.restaurant_id AS id,
r.restaurant_name AS name,
b.branch_id AS branch_id,
b.branch_location AS branch_in,
b.location_info AS branch_location_info,
m.meal_name AS meal,
m.meal_desc AS meal_info,
m.meal_price AS meal_price
FROM restaurants r
FULL JOIN branchs b
ON r.restaurant_id = b.branch_of
FULL JOIN branchMenus m
ON b.branch_id = m.menu_of_branch_id
ORDER BY r.restaurant_id;