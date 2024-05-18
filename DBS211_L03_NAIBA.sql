-- *******************************
-- Name: [Naiba Shabanova]
-- ID: [164598229]
-- Date: [09.02.2024]
-- Purpose: DBS211 Lab 03
-- *******************************
-- Q1 SOLUTION --L5_MOVIES

CREATE TABLE L5_MOVIES (
    m_id INT PRIMARY KEY,
    title VARCHAR(35) NOT NULL,
    release_year INT NOT NULL,
    director INT NOT NULL,
    score DECIMAL(3,2) CHECK (score > 0 AND score < 5)
);

-- Q1 SOLUTION -- L5_ACTORS

CREATE TABLE L5_ACTORS (
    a_id INT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL
);


-- Q1 SOLUTION --  L5_CASTINGS
CREATE TABLE L5_CASTINGS (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES L5_MOVIES(m_id),
    FOREIGN KEY (actor_id) REFERENCES L5_ACTORS(a_id)
);

 -- Q1 SOLUTION -- L5_DIRECTORS
 CREATE TABLE L5_DIRECTORS (
    director_id INT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL
);

-- Q2 SOLUTION --
ALTER TABLE L5_MOVIES
ADD CONSTRAINT fk_director
FOREIGN KEY (director) REFERENCES L5_DIRECTORS(director_id);



-- Q3 SOLUTION --
ALTER TABLE L5_MOVIES
ADD CONSTRAINT unique_title
UNIQUE (title);

-- Q4 SOLUTION --L5_DIRECTORS
INSERT INTO L5_DIRECTORS (director_id, first_name, last_name) VALUES (1010, 'Rob', 'Minkoff');
INSERT INTO L5_DIRECTORS (director_id, first_name, last_name) VALUES (1020, 'Bill', 'Condon');
INSERT INTO L5_DIRECTORS (director_id, first_name, last_name) VALUES (1050, 'Josh', 'Cooley');
INSERT INTO L5_DIRECTORS (director_id, first_name, last_name) VALUES (2010, 'Brad', 'Bird');
INSERT INTO L5_DIRECTORS (director_id, first_name, last_name) VALUES (3020, 'Lake', 'Bell');
  

-- Q4 SOLUTION --L5_MOVIES
INSERT INTO L5_MOVIES (m_id, title, release_year, director, score) VALUES (100, 'The Lion King', 2019, 3020, 3.50);
INSERT INTO L5_MOVIES (m_id, title, release_year, director, score) VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20);
INSERT INTO L5_MOVIES (m_id, title, release_year, director, score) VALUES (300, 'Toy Story 4', 2019, 1020, 4.50);
INSERT INTO L5_MOVIES (m_id, title, release_year, director, score) VALUES (400, 'Mission Impossible', 2018, 2010, 5.00);
INSERT INTO L5_MOVIES (m_id, title, release_year, director, score) VALUES (500, 'The Secret Life of Pets', 2016, 1010, 3.90);

-- Q5 SOLUTION --
DROP TABLE L5_CASTINGS;
DROP TABLE L5_MOVIES;
DROP TABLE L5_ACTORS;
DROP TABLE L5_DIRECTORS;

--Is the order of tables important when removing? 
--Why? 


----I'd start by dropping L5_CASTINGS since it has foreign keys pointing to L5_MOVIES and L5_ACTORS.
----Next, I'd remove L5_MOVIES, which has a foreign key linked to L5_DIRECTORS.
----L5_ACTORS would follow; it appears to have no foreign key constraints from the details provided, so it's safe to drop after L5_MOVIES.
----Lastly, I'd drop L5_DIRECTORS, the parent table for L5_MOVIES

---In the context of SQL and database management, the sequence in which tables are dropped is critical due to the concept of referential integrity. This principle is central to relational databases and ensures that relationships between tables remain consistent. Specifically, when a table with a foreign key constraint references another table's primary key, the database enforces rules to maintain valid and consistent links between the data.

---If a parent table, which is referenced by child tables via foreign keys, is removed first, it would result in orphaned keys—foreign keys with no corresponding primary keys. This situation disrupts the data integrity and the logical structure of the database. To prevent this, database systems require that any table with foreign keys referencing another table must be dropped before the referenced table. This maintains the integrity and order of the database, preventing errors and data inconsistencies.

---Thus, when I am tasked with dropping tables, I ensure to drop child tables before their respective parent tables. This approach respects the dependencies and maintains the referential integrity, allowing for a clean and error-free removal of tables from the database.
