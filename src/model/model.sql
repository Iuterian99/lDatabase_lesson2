-- Managing Tables

CREATE TABLE restaurants (
restaurant_id serial PRIMARY KEY,
restaurant_name varchar(32) not null,
working_hours int not null
);

CREATE TABLE branchs (
branch_id serial PRIMARY KEY,
branch_location varchar(32) not null,
working_hours int not null,
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

INSERT INTO restaurants(
  restaurant_name,
  working_hours
) VALUES ('Rayhon', 9:00 to 23:00);