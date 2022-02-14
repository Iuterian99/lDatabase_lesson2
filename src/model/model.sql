-- Managing Tables

CREATE TABLE courses (
course_id serial PRIMARY KEY,
course_name varchar(32) not null,
course_price decimal(10,2) not null,
curse_duration int not null,
course_desc text,
course_created_at timestamptz DEFAULT CURRENT_TIMESTAMP
)