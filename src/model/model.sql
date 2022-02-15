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
branch int REFERENCES restaurants(restaurant_id)
);

CREATE TABLE branchMenus (
course_id serial PRIMARY KEY,
meal_name varchar(32) not null,
meal_desc text,
menu int REFERENCES branchs(branch_id)
);

ALTER TABLE branchs DROP COLUMN working_hours;
SELECT * FROM restaurants JOIN branchs ON restaurant_id = branch;

INSERT INTO restaurants( restaurant_name) VALUES ('Rayhon');
INSERT INTO restaurants( restaurant_name) VALUES ('Soy');
INSERT INTO restaurants( restaurant_name) VALUES ('Komolon');
INSERT INTO restaurants( restaurant_name) VALUES ('Beshqozon');


INSERT INTO branchs( branch_location, location_info, branch) 
VALUES ('Shayxontoxur',
'Samarqand darvoza yonida', 
1
);
INSERT INTO branchs( branch_location, location_info, branch) 
VALUES ('Yunusobot',
'Megaplanet yonida', 
1
);
INSERT INTO branchs( branch_location, location_info, branch) 
VALUES ('Chilonzor',
'Integro yonida', 
1
);
INSERT INTO branchs( branch_location, location_info, branch) 
VALUES ('Yashnabod',
'Park yonida', 
1
);