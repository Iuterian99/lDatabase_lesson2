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
course_id serial PRIMARY KEY,
meal_name varchar(32) not null,
meal_desc text,
meal_price varchar(20) not null,
menu_of_branch_id int REFERENCES branchs(branch_id)
);

ALTER TABLE branchMenus RENAME COLUMN menu TO menu_of_branch_id;
ALTER TABLE branchMenus ADD COLUMN meal_price varchar(20);
SELECT * FROM restaurants JOIN branchs ON restaurant_id = branch_of;
SELECT * FROM restaurants JOIN branchs ON restaurant_id = branch_of;

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
       ('beshbarmoq', 'katta tog`orada', '35000 so`m', 1 );

INSERT INTO branchs( branch_location, location_info, branch_of) 
VALUES ('Shayxontoxur', 'Samarqand darvoza yonida', 2),
       ('Yunusobot', 'Megaplanet yonida', 2),
       ('Chilonzor', 'Integro yonida', 2),
       ('Yashnabod', 'Park yonida',  2);